
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_database/firebase_database.dart' ;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money5_ios_android/colors.dart';

import 'package:image/image.dart' as Im;
import 'package:path_provider/path_provider.dart';
import 'dart:math' as Math;
import 'package:date_format/date_format.dart';

class TypeEdit extends StatefulWidget {


  final String type_id;
  final String type_name;
  final String type_desc;
  final String type_price;
  final String type_cat;
  final String type_img;
  final String type_date;
  final String type_doc_id;
  TypeEdit({
    this.type_id,
    this.type_name,
    this.type_desc,
    this.type_price,
    this.type_cat,
    this.type_img,
    this.type_date,
    this.type_doc_id,
  });

  @override
  TypeEditState createState() => TypeEditState();
}
QuerySnapshot cars;
class TypeEditState extends State<TypeEdit> {
  String imagename;
  File sampleimage;
  int state = 0;
  var url2;
  String _selectedCat = 'Please choose a Category';
  List<String> list_cat = [];

  void initState() {
    print("inside init");
    setState(() {
      contprodid.text = widget.type_id;
      contprodname.text = widget.type_name;
      contprodPrice.text = widget.type_price.toString();
      //contprodset.text = widget.type_fav.toString();
      _selectedCat = widget.type_cat;

      contproddesc.text = widget.type_desc;
      contprodimg.text = widget.type_img;
      contprodentrydate.text = widget.type_date;
    });

    getData().then((results) {
      setState(() {
        cars = results;
        printlist();
      });
    });
  }

  TextEditingController contprodid = new TextEditingController();
  TextEditingController contprodname = new TextEditingController();

  TextEditingController contprodset = new TextEditingController();
  TextEditingController contprodcat = new TextEditingController();

  TextEditingController contproddesc = new TextEditingController();
  TextEditingController contprodimg = new TextEditingController();
  TextEditingController contprodentrydate = new TextEditingController();

  TextEditingController contprodPrice = new TextEditingController();

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
           // Navigator.pushNamed(context, '/TypeMain');
            /*  Navigator.of(context).pushReplacement(
                              new MaterialPageRoute(
                                 builder: (BuildContext context)=> new Productsdetails()
                                 ),
                               );
                               */
          },
        ),
        title: Text("Edit Prod"),
        centerTitle: true,
        backgroundColor: Color(getColorHexFromStr('#FDD148')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: new Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: contprodid,
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Please prod Id ';
                          }
                        },
                        onSaved: (input) => imagename = input,

                        decoration: InputDecoration(
                          labelText: 'prod id',
                        ),
                        // obscureText: true,
                      ),
                      TextFormField(
                        controller: contprodname,
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Please Type an Name for Trining';
                          }
                        },
                        onSaved: (input) => imagename = input,
                        decoration: InputDecoration(
                          labelText: 'Trining Name',
                        ),

                        // obscureText: true,
                      ),
                      TextFormField(
                        controller: contproddesc,
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Please Type Trining  Desc';
                          }
                        },
                        onSaved: (input) => imagename = input,
                        decoration: InputDecoration(labelText: 'Trining Desc'),
                        // obscureText: true,
                      ),
                      ///
                       Align(
                           alignment: Alignment.topLeft,
                         child: DropdownButton<String>(

                            items: list_cat.map((String val)
                            {
                              return new DropdownMenuItem<String>(
                                value: val,
                                child: new Text(val),
                              );
                            }).toList(),
                            hint: Text(_selectedCat),
                            onChanged: (newVal) {

                              this.setState(() {
                                _selectedCat = newVal;
                              });
                            }),
                       ),
                      TextFormField(
                        controller: contprodPrice,
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Please Type Price';
                          }
                        },
                        onSaved: (input) => imagename = input,
                        decoration: InputDecoration(labelText: 'Price'),
                        // obscureText: true,
                      ),
/*
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text("Price"),
                          new Flexible(
                            child: new TextField(
                                controller: contprodPrice,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: 'Price S',
                                )
                            ),
                          ),

                        ],
                      ),
*/


                      // SizedBox(height: 5.0,),
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
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget enableupload() {
    return Container(
      child: Column(
        children: <Widget>[
          sampleimage == null
              ? Image.network(
            widget.type_img,
            height: 200.0,
            width: 200.0,
          )
              : Image.file(
            sampleimage,
            height: 200.0,
            width: 200.0,
          ),
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
                  if (sampleimage == null) {
                    print("inside uploadimg  no file update data only");

                    updateDataonly(widget.type_doc_id);
                  } else {
                    uploadimage();
                  }
                  //addimagedata();
                  //updateData(widget.type_id);
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

    if (sampleimage == null) {
      print("inside compressed no file ");
    } else {
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
    final todayDate = DateTime.now();
    String  currentdate=formatDate(todayDate, [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);

    Firestore.instance.collection("Type").document().setData({
      'type_id': contprodid.text,
      'type_name': contprodname.text,
      'type_desc': contproddesc.text,
      'type_price': contprodPrice.text,

      'type_cat': contprodcat.text,
      'type_entry_date': currentdate,
      'type_date': currentdate ,// contprodenterydate.text,
      'type_img': url2
    });
  }

  updateData(selectedDoc) {
    final todayDate = DateTime.now();
    String  currentdate=formatDate(todayDate, [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);


    Firestore.instance
        .collection('Type')
        .document(selectedDoc)
        .updateData({
      'type_id': contprodid.text,
      'type_name': contprodname.text,
      'type_desc': contproddesc.text,

      'type_price': contprodPrice.text,

      'type_cat': _selectedCat,
      'type_entry_date': currentdate, // contprodenterydate.text,
      'type_img': url2
    }).catchError((e) {
      print(e);
    });
  }

  updateDataonly(selectedDoc) {
    final todayDate = DateTime.now();
    String  currentdate=formatDate(todayDate, [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);

    Firestore.instance
        .collection('Type')
        .document(selectedDoc)
        .updateData({
      'type_id': contprodid.text,
      'type_name': contprodname.text,
      'type_desc': contproddesc.text,
      'type_price': contprodPrice.text,
      'type_entry_date': currentdate, // contprodenterydate.text,
      'type_cat': _selectedCat,
      //'type_date': contprodentrydate.text, // contprodenterydate.text,
     // 'type_img': url2
    }).catchError((e) {
      print(e);
    });

    setState(() {
      state = 2;
    });
  }



  getData() async {
    //return await Firestore.instance.collection("Furnit_Products").snapshots();
    return await Firestore.instance.collection('TypeCategory').getDocuments();
  }
  printlist(){
    if (cars != null) {
      for(var i =0 ;i<cars.documents.length;i++)
      {
        list_cat.add(cars.docs[i].data()['cat_name']);
      }
    }
    else
    {
      print("error");
    }


  }

  //void uploadimage() {}


  Future<String> uploadimage() async {


    final StorageReference ref =
    FirebaseStorage.instance.ref().child('${contprodname.text}.jpg');
    final StorageUploadTask task = ref.putFile(sampleimage);
    var downurl = await (await task.onComplete).ref.getDownloadURL();

    var url = downurl.toString();
    url2 = url;
    //print("the URL for image= ${url}");
    setState(() {
      state = 2;
    });
    //addimagedata();
    updateData(widget.type_doc_id);
    //  Navigator.pushNamed(context, '/productsallcom');
    return "";

  }

}
