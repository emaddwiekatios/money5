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
import 'package:date_format/date_format.dart';
import 'TypesADD.dart';

class AddCategoryType extends StatefulWidget {
  var cat_max;
  AddCategoryType({this.cat_max});
  @override
  AddCategoryTypeState createState() => AddCategoryTypeState();
}

class AddCategoryTypeState extends State<AddCategoryType> {
  String imagename;
  File sampleimage;
  var currentdate;
  int state = 0;
  var url2;
  var prod_max;
  var Typeslist
  =[
    {
      "type_id":"Weman Dress",
      "type_name":"Weman Dress",
      "type_desc":"Weman Dress",
      "type_price":"7.0",

      "type_entry_date":'Weman Dress',

      "type_cat":"Weman Dress",
      "type_img":'https://firebasestorage.googleapis.com/v0/b/fir-3af1c.appspot.com/o/t-shirt.jpg?alt=media&token=18e2c978-8386-4aaa-880c-dc8d0a5252eb',
      "type_doc_id":'1'
    }
  ];


  TextEditingController contCatid = new TextEditingController();
  TextEditingController contCatname = new TextEditingController();
  TextEditingController contCatremark = new TextEditingController();
  TextEditingController contCatdesc = new TextEditingController();
  TextEditingController contCaturl = new TextEditingController();
  TextEditingController contCatdentrydate = new TextEditingController();


  getData() async {
    //return await FirebaseFirestore.instance.collection("Gym-Types").snapshots();


    return await FirebaseFirestore.instance.collection('Type').get();
  }


  printlist(){
    print('inside prinstlist');
    if (cars != null) {

      Typeslist.clear();


      for(var i =0 ;i<cars.docs.length;i++)
      {
      //  print('the name${cars.docs[i].data()['type_name']}');
        var temp_date;
        if(cars.docs[i].data()['type_entry_date'] != null) {
          temp_date=cars.docs[i].data()['type_entry_date'].toString().substring(0, 10);
        }
        else
        {
          temp_date=cars.docs[i].data()['type_entry_date'].toString();
        }
        Typeslist.add(
            {
              "type_id":cars.docs[i].data()['type_id'].toString(),
              "type_name":cars.docs[i].data()['type_name'],
              "type_desc":cars.docs[i].data()['type_desc'],
              "type_price":cars.docs[i].data()['type_price'],
              "type_cat":cars.docs[i].data()['type_cat'],
              "type_entry_date": temp_date,
              //"type_entry_date":cars.docs[i].data()['type_entry_date'].toString(),
              "type_img":cars.docs[i].data()['type_img'],
              "type_doc_id"  : cars.documents[i].documentID,
            });
      }
    }

    else
    {
      print("error");
    }

    Typeslist.sort((a, b) => int.parse(a['type_id']).compareTo(int.parse(b['type_id'])));
    var array_len =Typeslist.length;
    setState(() {
      prod_max=((int.parse(Typeslist[array_len-1]['type_id'])+1).toString());
      Typeslist.sort((b, a) => int.parse(a['type_id']).compareTo(int.parse(b['type_id'])));
      contCatid.text=prod_max.length>0  ?prod_max.toString() : 0;
    //  duplicateItems=Typeslist;
    });
print(prod_max);

    setState(() {


     // duplicateItems=Typeslist;
    //  print(duplicateItems);

    });



  }



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
  void initState() {
    state=0;
    // TODO: implement initState
    super.initState();
    getData().then((results) {
      setState(() {

        cars = results;

        printlist();
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
            //Navigator.pushNamed(context, '/trainingmain');
            //Navigator.pushNamed(context, '/CategoryTypeMain');


            Navigator.pop(context);
          },),
          title: Text("ADD Category"),
          centerTitle: true,
          backgroundColor: Color(getColorHexFromStr('#FDD148'),)
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            height: 600,
            width: 400,
            child: new Center(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: contCatid,
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
                      controller: contCatname,
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Please Category Name';
                        }
                      },
                      onSaved: (input) => imagename = input,
                      decoration: InputDecoration(labelText: 'Cat Name',
                      ),

                      // obscureText: true,
                    )
                    ,
                    TextFormField(
                      controller: contCatdesc,
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Please Category Desc ';
                        }
                      },
                      onSaved: (input) => imagename = input,
                      decoration: InputDecoration(labelText: 'Category Desc'),
                      // obscureText: true,
                    ),
                    /*
                TextFormField(
                  controller: contCatremark,
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Please Category Remark';
                    }
                  },
                  onSaved: (input) => imagename = input,
                  decoration: InputDecoration(labelText: 'Category Remark'),
                  // obscureText: true,
                ),
               */

                    sampleimage == null ? Text("Select an image") : enableupload(),
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
      ),


    );
  }

  Widget enableupload() {
    return Container(
      child: Column(
        children: <Widget>[
          Image.file(
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
                color: Color(getColorHexFromStr('#FDD148'),),
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
                //  Text("Upload"),
                textColor: Colors.white,
                color: Color(getColorHexFromStr('#FDD148'),),
                onPressed: () {
                  setState(() {
                    state = 1;
                  });

                  uploadimage();


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

  Future<String> uploadimage() async {

    final StorageReference ref =
    FirebaseStorage.instance.ref().child('${contCatname.text}.jpg');
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
    currentdate=formatDate(todayDate, [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);

    addimagedata();
    contCatid.text=(int.parse(contCatid.text)+1).toString();
    contCatname.clear();
    contCatdesc.clear();
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
      Im.Image smallerImage = Im.copyResize(image);
      // Im.copyResize(image, 100); // choose the size here, it will maintain aspect ratio

      var compressedImage = new File('$path/img$rand.jpg')
        ..writeAsBytesSync(Im.encodeJpg(image, quality: 50));
      setState(() {
        sampleimage = compressedImage;
      });
    }
  }

  addimagedata() {
    Firestore.instance.collection("TypeCategory").document().setData({
      'cat_id': contCatid.text,
      'cat_name': contCatname.text,
      'cat_desc': contCatdesc.text,
      'cat_date':currentdate,// contCatenterydate.text,
      'cat_img': url2
    });
  }


}
