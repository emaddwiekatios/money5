import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:image/image.dart' as Im;
import 'package:path_provider/path_provider.dart';
import 'dart:math' as Math;
import 'package:money5_ios_android/colors.dart';

class CategoryTypeEdit extends StatefulWidget {

  final String cat_id;
  final String cat_name;
  final String cat_desc;
  final String cat_remark;
  final String cat_img;
  final String cat_date;
  final String cat_doc_id;
  CategoryTypeEdit({
    this.cat_id,
    this.cat_name,
    this.cat_desc,
    this.cat_remark,
    this.cat_img,
    this.cat_date,
    this.cat_doc_id,
  });


  @override
  CategoryTypeEditState createState() => CategoryTypeEditState();
}

class CategoryTypeEditState extends State<CategoryTypeEdit> {
  String imagename;
  File sampleimage;
  int state = 0;
  var url2;


  void initState(){
    print("inside init");
    setState(() {
      contcatid.text = widget.cat_id;
      contcatname.text = widget.cat_name;
      contcatremark.text=widget.cat_remark;
      contcatdesc.text = widget.cat_desc;
      contcatimg.text=widget.cat_img;
      contcatentrydate.text=widget.cat_date;

    });

  }
  TextEditingController contcatid = new TextEditingController();
  TextEditingController contcatname = new TextEditingController();
  TextEditingController contcatremark = new TextEditingController();
  TextEditingController contcatdesc = new TextEditingController();
  TextEditingController contcatimg = new TextEditingController();
  TextEditingController contcatentrydate = new TextEditingController();



  Future getImagecamera() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {

      sampleimage = tempImage;

    });

    //  compressImage();
  }

  Future getImagegalary() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleimage = tempImage;

    });

    /// compressImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pushNamed(context, '/CategoryTypeMain');
        },),
        title: Text("Image Upload"),
        centerTitle: true,
        backgroundColor: Color(getColorHexFromStr('#FDD148')),
      ),

      body: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          height: 600,
          width: 400,
          child: new Center(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: contcatid,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please Cat Id ';
                      }
                    },
                    onSaved: (input) => imagename = input,

                    decoration: InputDecoration(
                      labelText: 'Cat id',
                    ),
                    // obscureText: true,
                  ),
                  TextFormField(
                    controller: contcatname,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please Type an Name for Category';
                      }
                    },
                    onSaved: (input) => imagename = input,
                    decoration: InputDecoration(labelText: 'Category Name',
                    ),

                    // obscureText: true,
                  )
                  ,
                  TextFormField(
                    controller: contcatdesc,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please Type Category  Desc';
                      }
                    },
                    onSaved: (input) => imagename = input,
                    decoration: InputDecoration(labelText: 'Category Desc'),
                    // obscureText: true,
                  ),

                  TextFormField(
                    controller: contcatremark,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please Type Category Remark';
                      }
                    },
                    onSaved: (input) => imagename = input,
                    decoration: InputDecoration(labelText: 'Category Remark'),
                    // obscureText: true,
                  ),
                  //Image.network(widget.prodimg),
                  //enableupload(),

                  //sampleimage  != null ? Text("Select an image") : enableupload(),
                  enableupload(),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.camera_roll),
                        onPressed: () {
                          getImagecamera();

                          setState(() {
                            state = 0;
                          });
                        },

                      ),

                      IconButton(
                        icon: Icon(Icons.add_a_photo),
                        onPressed: () {
                          getImagegalary();

                          setState(() {
                            state = 0;
                          });
                        },

                      )
                    ],
                  )
                ],
              )),
        ),
      ),


    );
  }

  Widget enableupload() {
    return Container(
      child: Column(
        children: <Widget>[
          sampleimage ==null ?
          Image.network(

            widget.cat_img,
            height: 200.0,
            width: 200.0,
          ) :
          Image.file(
            sampleimage,
            height: 200.0,
            width: 200.0,
          )

          ,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                elevation: 7.0,
                child: Text("Compressed"),
                //  Text("Upload"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {


                  compressImage();
                  /* final StorageReference fbsr =FirebaseStorage.instance.ref().child('${contimage.text}.jpg');
                   final StorageUploadTask task = fbsr.putFile(sampleimage);
                   var downurl = fbsr.getDownloadURL();
                  print("the URL for image= ${downurl.toString()}");
                   */
                },
              ),




              RaisedButton(
                elevation: 7.0,
                child: setUpButtonChild(),
                // Text("Upload"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    state = 1;
                  });
                  if ( sampleimage == null )
                  {
                    print("inside uploadimg  no file update data only");

                    updateDataonly(widget.cat_doc_id);
                  }
                  else
                  {
                    print("inside uploadimg  file update data only");
                    uploadimage();

                  }
                  //addimagedata();
                  //updateData(widget.cat_id);
                  /* final StorageReference fbsr =FirebaseStorage.instance.ref().child('${contimage.text}.jpg');
               final StorageUploadTask task = fbsr.putFile(sampleimage);
               var downurl = fbsr.getDownloadURL();
              print("the URL for image= ${downurl.toString()}");
               */
                },
              ),
            ],
          ),

////////

///////
        ],
      ),
    );
  }

////////

///////

  Future<String> uploadimage() async {

    final StorageReference ref =
    FirebaseStorage.instance.ref().child('${contcatname.text}.jpg');
    print("the pict${sampleimage}");
    final StorageUploadTask task = ref.putFile(sampleimage);
    var downurl = await (await task.onComplete).ref.getDownloadURL();

    var url = downurl.toString();
    url2 = url;
    //print("the URL for image= ${url}");
    setState(() {
      state = 2;
    });

    final todayDate = DateTime.now();
    // currentdate=formatDate(todayDate, [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);
    updateData(widget.cat_doc_id);
    //addimagedata();
    return "";

  }

  Widget setUpButtonChild() {
    if (state == 0) {
      return new Text(
        "Click Upload",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void compressImage() async {
    print("inside compressed");

    if ( sampleimage == null )
    {
      print("inside compressed no file ");


    }
    else
    {
      File imageFile = sampleimage;
      final tempDir = await getTemporaryDirectory();
      final path = tempDir.path;
      int rand = new Math.Random().nextInt(10000);

      Im.Image image = Im.decodeImage(imageFile.readAsBytesSync());
      Im.Image smallerImage = Im.copyResize(
          image); // choose the size here, it will maintain aspect ratio

      var compressedImage = new File('$path/img$rand.jpg')
        ..writeAsBytesSync(Im.encodeJpg(image, quality: 50));
      setState(() {
        sampleimage = compressedImage;
      });
    }
  }

  addimagedata() {
    Firestore.instance.collection("Furnit_Category").document().setData({
      'cat_id': contcatid.text,
      'cat_name': contcatname.text,
      'cat_desc': contcatdesc.text,
      'cat_remark': contcatremark.text,
      'cat_date':contcatentrydate.text,// contCatenterydate.text,
      'cat_img': url2
    });
  }

  updateData(selectedDoc) {

    Firestore.instance
        .collection('Furnit_Category')
        .document(selectedDoc)
        .updateData(
        {
          'cat_id': contcatid.text,
          'cat_name': contcatname.text,
          'cat_desc': contcatdesc.text,
          'cat_remark': contcatremark.text,
          'cat_date':contcatentrydate.text,// contCatenterydate.text,
          'cat_img': url2
        }
    )
        .catchError((e) {
      print(e);
    });
  }


  updateDataonly(selectedDoc) {

    Firestore.instance
        .collection('TypeCategory')
        .document(selectedDoc)
        .updateData(
        {
          'cat_id': contcatid.text,
          'cat_name': contcatname.text,
          'cat_desc': contcatdesc.text,
          'cat_remark': contcatremark.text,
          'cat_date':contcatentrydate.text,// contCatenterydate.text,
          // 'cat_img': url2
        }
    )
        .catchError((e) {
      print(e);
    });

    setState(() {
      state = 2;
    });
  }
}
