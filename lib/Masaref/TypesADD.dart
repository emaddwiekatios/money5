import 'package:flutter/material.dart';
import 'package:money5_ios_android/colors.dart';
import 'package:image_picker/image_picker.dart';


import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:image/image.dart' as Im;
import 'package:path_provider/path_provider.dart';
import 'dart:math' as Math;
import 'package:date_format/date_format.dart';

import './TypeMain.dart';
import 'CategoryTypeAdd.dart';

class TypesADD extends StatefulWidget {
  String maxprodid;
  TypesADD(this.maxprodid);


  @override
  _TypesADDState createState() => _TypesADDState();
}

QuerySnapshot cars;

class _TypesADDState extends State<TypesADD> {

   void refresh_data()
  {
    getData().then((results) {
      setState(() {
        cars = results;
        printlist();
      });
    });
  }

  String imagename;
  File sampleimage;
  var currentdate;
  int state = 0;
  var url2;

  List<String> list_cat = [];

  String _selectedCat = 'Choose';

  TextEditingController conttypeid = new TextEditingController();
  TextEditingController conttypename = new TextEditingController();

  TextEditingController conttypefav = new TextEditingController();
  TextEditingController conttypecat = new TextEditingController();
  TextEditingController conttypedesc = new TextEditingController();
  TextEditingController conttypeurl = new TextEditingController();
  TextEditingController conttypedentrydate = new TextEditingController();

  TextEditingController conttypepriceS = new TextEditingController();



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

  void initState() {
    //  print("inside init");
    getData().then((results) {
      setState(() {
        cars = results;
        printlist();
      });
    });

    conttypeid.text=widget.maxprodid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    //color: Color(getColorHexFromStr('#FDD148')),
                    //color: Color(getColorHexFromStr('#FDD148')),
                    height: MediaQuery.of(context).size.height ,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child:  Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(200),
                        color: Color(getColorHexFromStr('#FDD110')),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 100,
                    left: 200,
                    child:  Container(
                      height: 250,//MediaQuery.of(context).size.height / 4,
                      width: 250,//MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Color(getColorHexFromStr('#FEE16D'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 200,
                    child:  Container(
                      height: 250,//MediaQuery.of(context).size.height / 4,
                      width: 250,//MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Color(getColorHexFromStr('#FEE16D'),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: -40,
                    left: -30,
                    child:  Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Color(getColorHexFromStr('#FEE16D'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        print('inside button');
                        Navigator.pop(context);

/*
                        Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder:  (BuildContext context) => new TypeMain()),
                        );
*/
                      },
                    ),
                  ),
                  //body
//title
                  Positioned(
                    top: MediaQuery
                        .of(context)
                        .size
                        .height/25,
                    left: MediaQuery
                        .of(context)
                        .size
                        .width / 2 - 70,
                    child: Text(
                      'Add Type',
                      style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    right: 20,
                    bottom: 20,
                    child:  Container(
                      height: MediaQuery.of(context).size.height ,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(200),
                        //  color: Colors.yellow//Color(getColorHexFromStr('#FDD110')),
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width:  MediaQuery.of(context).size.width,
                          child: new Center(
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: conttypeid,
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Please type Id ';
                                      }
                                    },
                                    onSaved: (input) => imagename = input,

                                    decoration: InputDecoration(
                                      labelText: 'type id',
                                    ),
                                    // obscureText: true,
                                  ),
                                  TextFormField(
                                    controller: conttypename,
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Please type Name';
                                      }
                                    },
                                    onSaved: (input) => imagename = input,
                                    decoration: InputDecoration(
                                      labelText: 'type Name',
                                    ),

                                    // obscureText: true,
                                  ),
                                  TextFormField(
                                    controller: conttypedesc,
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Please type Desc ';
                                      }
                                    },
                                    onSaved: (input) => imagename = input,
                                    decoration: InputDecoration(labelText: 'type Desc'),
                                    // obscureText: true,
                                  ),

                                  ///
                                  ///
                                  Row(
                                    children: <Widget>[
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
                                     IconButton(icon: Icon(Icons.refresh,color: Colors.blue), onPressed: (){
                                       this.refresh_data();
                                     }),
                                      Container(
                                        height: MediaQuery.of(context).size.height/22,
                                        width: MediaQuery.of(context).size.width/2.8,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.blue,
                                        ),
                                        child: FlatButton(

                                            // color: Colors.amber,
                                            textColor: Colors.white,
                                            padding: EdgeInsets.all(3.0),
                                            splashColor: Colors.blueAccent,
                                            onPressed: () {

                                              Navigator.of(context).push(
                                                  new MaterialPageRoute(
                                                  builder:  (BuildContext context) => new AddCategoryType(),
                                                  ),);

                                                  },
                                            child: Text("Add Category!",
                                                style: TextStyle(fontSize: 18.0),


                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  /*   TextFormField(
                  controller: conttypecat,
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Please typeing Cat';
                    }
                  },
                  onSaved: (input) => imagename = input,
                  decoration: InputDecoration(labelText: 'typeing Cat'),
                  // obscureText: true,
                ),
*/
                                  ///
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      // new Text("Price"),
                                      new Flexible(
                                        child: new TextField(
                                            keyboardType: TextInputType.number,
                                            controller: conttypepriceS,
                                            decoration: InputDecoration(

                                              contentPadding: EdgeInsets.all(10),
                                              hintText: 'Enter a Price',
                                            )),
                                      ),
                                      /*  SizedBox(
                                          width: 20.0,
                                        ),
                                        new Flexible(
                                          child: new TextField(
                                              controller: conttypepriceM,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.all(10),
                                                hintText: 'Enter a Price Medium',
                                              )),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        new Flexible(
                                          child: new TextField(
                                              controller: conttypepriceL,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.all(10),
                                                hintText: 'Enter a Price Large',
                                              )),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        */
                                      /*  new Text("Fav"),
                    new Flexible(
                      child: new TextField(
                          controller: contTypesADDet,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'Please enter a Fat',
                          )),
                    ),
                    */
                                    ],
                                  ),
                                  /*  TextFormField(
                  controller: conttypedentrydate,
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Please typeing entery Date';
                    }
                  },
                  onSaved: (input) => imagename = input,
                  decoration: InputDecoration(labelText: 'typeing Entery date'),
                  // obscureText: true,
                ),
                */
                     sampleimage == null ? Text("Select an image") : Image.file(

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
                                        //  Text("Upload"),
                                        textColor: Colors.white,
                                        color: Colors.blue,
                                        onPressed: () {
                                          print('stat${state}');
                                          print('sampleimage${sampleimage}');
                                          if(sampleimage ==  null) {
                                            setState(() {
                                              state = 2;
                                            });
                                            addimagedata();
                                            addimagedatahist();

                                          }
                                          else if (sampleimage != null){
                                            setState(() {
                                              state = 1;
                                            });
                                            uploadimage();
                                          }

                                          setState(() {
                                            conttypeid.text=(int.parse(conttypeid.text)+1).toString();
                                            conttypename.text=null;
                                            conttypedesc.text=null;
                                            conttypepriceS.text=null;
                                            conttypename.clear();
                                            conttypedesc.clear();
                                            conttypepriceS.clear();

                                          });
                                        },
                                      ),
                                    ],
                                  ),

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
                  ),

                ],
              ),

            ],
          ),
        ));
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
                //  Text("Upload"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
  print('stat${state}');
  print('sampleimage${sampleimage}');
   if(sampleimage == 'Select an image') {
     setState(() {
       state = 2;
     });
     addimagedata();


   }
   else {
     setState(() {
       state = 1;
     });
     uploadimage();

   }
                  setState(() {
                    conttypeid.text=(int.parse(conttypeid.text)+1).toString();
                    conttypename.text=null;
                    conttypedesc.text=null;
                    conttypepriceS.text=null;
                    conttypename.clear();
                    conttypedesc.clear();
                    conttypepriceS.clear();

                  });

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
    FirebaseStorage.instance.ref().child('${conttypename.text}.jpg');
    print("the pict${sampleimage}");
    final StorageUploadTask task = ref.putFile(sampleimage);
    var downurl = await (await task.onComplete).ref.getDownloadURL();

    var url = downurl.toString();
    url2 = url;
    //print("the URL for image= ${url}");
    setState(() {
      state = 2;
    });


    addimagedata();
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
    currentdate=formatDate(todayDate, [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);

    FirebaseFirestore.instance.collection("Type").document().set({
      'type_id': conttypeid.text,
      'type_name': conttypename.text,
      'type_desc': conttypedesc.text,
      'type_price': conttypepriceS.text,


      'type_cat': _selectedCat,
      'type_entry_date': currentdate,
      'type_date': currentdate,
      'type_img': url2 == null ? 'no image': url2
    });
  }
   addimagedatahist() {
     final todayDate = DateTime.now();
     currentdate=formatDate(todayDate, [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);

     FirebaseFirestore.instance.collection("Type_hist").doc().set({
       'type_id': conttypeid.text,
       'type_name': conttypename.text,
       'type_desc': conttypedesc.text,
       'type_price': conttypepriceS.text,


       'type_cat': _selectedCat,
       'type_entry_date': currentdate,
       'type_date': currentdate,
       'type_img': url2 == null ? 'no image': url2
     });
   }

  getData() async {
    //return await Firestore.instance.collection("Gym-Proding").snapshots();
    return await FirebaseFirestore.instance.collection('TypeCategory').get();
  }
  printlist(){
    list_cat.clear();
    if (cars != null) {
      for(var i =0 ;i<cars.docs.length;i++)
      {
        list_cat.add(cars.docs[i].data()['cat_name']);
      }
    }
    else
    {
      print("error");
    }


  }


}


