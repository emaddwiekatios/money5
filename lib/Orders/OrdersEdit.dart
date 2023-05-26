


import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money5_ios_android/colors.dart';

import 'package:image/image.dart' as Im;
import 'package:path_provider/path_provider.dart';
import 'dart:math' as Math;
//import 'package:money5_ios_android/main_page.dart';
//import 'package:flutter_app_vetagable/Pages/colors.dart';
import 'package:date_format/date_format.dart';
import 'package:provider/provider.dart';
import 'package:money5_ios_android/AppLocalizations.dart';
import 'package:money5_ios_android/Products/ProductsMain.dart';
import 'package:money5_ios_android/Orders/OrdersMain.dart';
class OrdersEdit extends StatefulWidget {

  final String Order_id;
  final String Order_name;
  final String Order_desc;
  final String Order_price;

  final String Order_fav;
  final String Order_cat;
  final String Order_img;
  final String Order_date;
  final String Order_doc_id;
  final String Order_status;
  OrdersEdit({
    this.Order_id,
    this.Order_name,
    this.Order_desc,
    this.Order_price,

    this.Order_fav,
    this.Order_cat,
    this.Order_img,
    this.Order_date,
    this.Order_doc_id,
    this.Order_status
  });

  @override
  _OrdersEditState createState() => _OrdersEditState();
}

const CURVE_HEIGHT = 160.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;
Color colorOne = pcolor2;
Color colorTwo = pcolor3;
Color colorThree = pcolor4;
QuerySnapshot cars;
class _OrdersEditState extends State<OrdersEdit> {


  String imagename;
  File sampleimage;
  int state = 0;
  var url2;
  List<String> list_cat = ['Choose Category'];

  String _selectedCat = 'Initial';


  String  _selectedstatus = 'Choose a Status';
  List<String> list_status = ['Initial','Accept','Inprogress','Complete','Rejected'];

  void initState() {
    print("inside init");
    setState(() {
      contorderid.text = widget.Order_id;
      contordername.text = widget.Order_name;
      contorderPrice.text = widget.Order_price.toString();
      contorderset.text = widget.Order_fav.toString();
      _selectedCat = widget.Order_cat;
      _selectedstatus=widget.Order_status;

      contorderdesc.text = widget.Order_desc;
      contorderimg.text = widget.Order_img;
      contorderentrydate.text = widget.Order_date;
      colorOne = pcolor2;
      colorTwo = pcolor3;
      colorThree = pcolor4;

      getData().then((results) {
        setState(() {

       //   contOrderid.text = widget.Order_max;
          cars = results;
          printlist();
        });
      });
    });

//    getData().then((results) {
//      setState(() {
//        cars = results;
//        printlist();
//      });
//    });
  }

  TextEditingController contorderid = new TextEditingController();
  TextEditingController contordername = new TextEditingController();

  TextEditingController contorderset = new TextEditingController();
  TextEditingController contordercat = new TextEditingController();

  TextEditingController contorderdesc = new TextEditingController();
  TextEditingController contorderimg = new TextEditingController();
  TextEditingController contorderentrydate = new TextEditingController();

  TextEditingController contorderPrice = new TextEditingController();
  TextEditingController contorderPriceM = new TextEditingController();
  TextEditingController contorderPriceL = new TextEditingController();

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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // Color pyellow = Color(Colors.amber);

  Widget build(BuildContext context) {

    var pheight = MediaQuery.of(context).size.height;
    var pwidth = MediaQuery.of(context).size.width;

    var appLanguage = Provider.of<AppLanguage>(context);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // drawer: Appdrawer(),
        body:
        Stack(
          children: <Widget>[
            //header shape
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 4,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(200),
                  //  color: Colors.amber,
                ),
                child: CustomPaint(
                  child: Container(
                    height: 400.0,
                  ),
                  painter: _MyPainter(),
                ),
              ),
            ),

            //a
            Positioned(
              bottom: -125,
              left: -150,
              child: Container(
                height: 250, //MediaQuery.of(context).size.height / 4,
                width: 250, //MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(250),
                  color: colorOne,
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              right: -115,
              child: Container(
                height: 250, //MediaQuery.of(context).size.height / 4,
                width: 250, //MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: colorTwo),
              ),
            ),
            //menu
            Positioned(
              top: pheight/25,
              left: pwidth/20,
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  print('inside button');
                  // _scaffoldKey.currentState.openDrawer();

                  Navigator.pushReplacementNamed(context, "/ProductsMain");
                },
              ),
            ),
            Positioned(
              top: pheight/25,
              right: pwidth/20,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  print('inside button');
                  // FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  //  Navigator.popAndPushNamed(context, "/SignIn");

                  //Navigator.pushReplacementNamed(context, "/SignIn");
                },
              ),
            ),
            //body
            Positioned(
              top: MediaQuery
                  .of(context)
                  .size
                  .height/12,
              right: 10,
              left:10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height >= 775.0
                    ? MediaQuery.of(context).size.height
                    : 775.0,

                child:SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      height: MediaQuery.of(context).size.height-2,
                      width: MediaQuery.of(context).size.width,
                      child: new Center(
                          child: Column(
                            children: <Widget>[
                                TextFormField(
                                  controller: contorderid,
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
                                  controller: contordername,
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Please Type an Name for Trining';
                                    }
                                  },
                                  onSaved: (input) => imagename = input,
                                  decoration: InputDecoration(
                                    labelText: 'Prod Name',
                                  ),

                                  // obscureText: true,
                                ),
                                TextFormField(
                                  controller: contorderdesc,
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Please Type Trining  Desc';
                                    }
                                  },
                                  onSaved: (input) => imagename = input,
                                  decoration: InputDecoration(labelText: 'Prod Desc'),
                                  // obscureText: true,
                                ),
                              ///
//                              Align(
//                                alignment: (appLanguage.appLocal.toString() =='ar') ? Alignment.topRight :  Alignment.topLeft,
//
//                                child: new DropdownButton<String>(
//
//                                    items: list_cat.map((String val)
//                                    {
//                                      return new DropdownMenuItem<String>(
//                                        value: val,
//                                        child: new Text(val),
//                                      );
//                                    }).toList(),
//                                    hint: Text(_selectedCat),
//                                    onChanged: (newVal) {
//
//                                      this.setState(() {
//                                        _selectedCat = newVal;
//                                      });
//                                    }),
//                              ),
                                TextFormField(
                                  controller: contorderPrice,
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Please Price';
                                    }
                                  },
                                  onSaved: (input) => imagename = input,
                                  decoration: InputDecoration(labelText: 'Price '),
                                  // obscureText: true,
                                ),
                                 SizedBox(height: 5.0,),
                              Align(
                                  alignment: (appLanguage.appLocal.toString() =='ar') ? Alignment.topRight :  Alignment.topLeft,

                                  child: new DropdownButton<String>(

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
                              SizedBox(height: 5.0,),
                              Align(
                                alignment: (appLanguage.appLocal.toString() =='ar') ? Alignment.topRight :  Alignment.topLeft,

                                child: new DropdownButton<String>(

                                    items: list_status.map((String val)
                                    {
                                      return new DropdownMenuItem<String>(
                                        value: val,
                                        child: new Text(val),
                                      );
                                    }).toList(),
                                    hint: Text(_selectedstatus),
                                    onChanged: (newVal) {

                                      this.setState(() {
                                        _selectedstatus = newVal;
                                      });
                                    }),
                              ),
                              RaisedButton(
                                elevation: 7.0,
                                child: Text('Save'),
                                // Text("Upload"),
                                textColor: Colors.white,
                                color: Red_deep,
                                onPressed: () {



                                  updateDataonly(widget.Order_doc_id);

                                  Navigator.of(context).pushReplacement(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) => new OrdersMain()),
                                  );
                                },
                              ),

                            ],
                          )),
                    ),
                  ),
                ),


              ),
            ),
            //header title
            Positioned(
              top: MediaQuery.of(context).size.height / 18,
              left: MediaQuery.of(context).size.width / 2 - 50,
              child: Text(
                AppLocalizations.of(context).translate('Details'),
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
            ),





          ],
        ),
      ),
    );






  }
  Widget enableupload() {
    return Container(
      child: Column(
        children: <Widget>[
//          sampleimage == null
//              ? Image.network(
//            widget.Order_img,
//            height: MediaQuery.of(context).size.height/4,
//            width: MediaQuery.of(context).size.width-20,
//          )
//              : Image.file(
//            sampleimage,
//            height: MediaQuery.of(context).size.height/4,
//            width: MediaQuery.of(context).size.width-20,
//          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              RaisedButton(
//                elevation: 7.0,
//                child: Text("Compressed"),
//                //  Text("Upload"),
//                textColor: Colors.white,
//                color:Red_deep,
//                onPressed: () {
//                  compressImage();
//                  /* final StorageReference fbsr =FirebaseStorage.instance.ref().child('${contimage.text}.jpg');
//                   final StorageUploadTask task = fbsr.putFile(sampleimage);
//                   var downurl = fbsr.getDownloadURL();
//                  print("the URL for image= ${downurl.toString()}");
//                   */
//                },
//              ),
              RaisedButton(
                elevation: 7.0,
                child: setUpButtonChild(),
                // Text("Upload"),
                textColor: Colors.white,
                color: Red_deep,
                onPressed: () {
                  setState(() {
                    state = 1;
                  });
//                  if (sampleimage == null) {
//                    print("inside uploadimg  no file update data only");
//
                    updateDataonly(widget.Order_doc_id);
//                  }
//                  else {
                    //deleteold_image();
                    //uploadimage();
                  //}

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
    FirebaseFirestore.instance.collection("Orders").doc().setData({
      'Order_id': contorderid.text,
      'Order_name': contordername.text,
      'Order_desc': contorderdesc.text,
      'Order_price': contorderPrice.text,
      'Order_set': contorderset.text,
      'Order_cat': contordercat.text,
      'Order_entry_date': contorderentrydate.text, // contorderenterydate.text,
      'Order_img': url2
    });
  }

  updateData(selectedDoc) {
    final todayDate = DateTime.now();
    contorderentrydate.text = formatDate(todayDate,
        [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);

    FirebaseFirestore.instance
        .collection('Orders')
        .doc(selectedDoc)
        .update({
      'Order_id': contorderid.text,
      'Order_name': contordername.text,
      'Order_desc': contorderdesc.text,

      'Order_price': contorderPrice.text,
      'Order_priceM': contorderPriceM.text,
      'Order_priceL': contorderPriceL.text,
      'Order_fav': contorderset.text,
      'Order_cat': _selectedCat,
      'Order_date': contorderentrydate.text, // contorderenterydate.text,
      'Order_img': url2,
      'Order_status':_selectedCat
    }).catchError((e) {
      print(e);
    });
  }

  updateDataonly(selectedDoc) {
    final todayDate = DateTime.now();
    contorderentrydate.text = formatDate(todayDate,
        [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);

    FirebaseFirestore.instance
        .collection('Orders')
        .doc(selectedDoc)
        .update({
      'Order_id': contorderid.text,
      'Order_name': contordername.text,
      'Order_desc': contorderdesc.text,
      'Order_price': contorderPrice.text,
      'Order_fav': contorderset.text,
      'Order_cat': _selectedCat,
      'Order_date': contorderentrydate.text, // contorderenterydate.text,
      'Order_img': url2 ,// contorderenterydate.text,
       'Order_img': url2,
      'Order_status':_selectedstatus
    }).catchError((e) {
      print(e);
    });

    setState(() {
      state = 2;
    });
  }

  getData() async {
    //return await FirebaseFirestore.instance.collection("Gym-Proding").snapshots();
    return await FirebaseFirestore.instance.collection('TypeCategory').get();
  }


  printlist() {
    if (cars != null) {
      list_cat.clear();
      for (var i = 0; i < cars.docs.length; i++) {
        list_cat.add(cars.docs[i].data()['cat_name']);
      }
    } else {
      print("error");
    }
  }

  deleteold_image() async {
    if (widget.Order_img != null) {
      StorageReference storageReference =
      await FirebaseStorage.instance.getReferenceFromUrl(widget.Order_img);

      print(storageReference.path);

      await storageReference.delete();

      print('image deleted');
    }
  }
//  getData() async {
//    //return await FirebaseFirestore.instance.collection("Furnit_Products").snapshots();
//    return await FirebaseFirestore.instance.collection('Category').get();
//  }
//  printlist(){
//    if (cars != null) {
//      for(var i =0 ;i<cars.docs.length;i++)
//      {
//        list_cat.add(cars.docs[i].data()['cat_name']);
//      }
//    }
//    else
//    {
//      print("error");
//    }
//
//
//  }

  //void uploadimage() {}


  Future<String> uploadimage() async {


    final StorageReference ref =
    FirebaseStorage.instance.ref().child('${contordername.text}.jpg');
    final StorageUploadTask task = ref.putFile(sampleimage);
    var downurl = await (await task.onComplete).ref.getDownloadURL();

    var url = downurl.toString();
    url2 = url;
    //print("the URL for image= ${url}");
    setState(() {
      state = 2;
    });
    //addimagedata();
    updateData(widget.Order_doc_id);
    //  Navigator.pushNamed(context, '/productsallcom');
    return "";

  }

}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = colorOne;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width /2, size.height / 1, size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

