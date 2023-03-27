import 'package:flutter/material.dart';
import 'package:money5_ios_android/Category/categoryAdd.dart';
import 'package:money5_ios_android/Orders/OrdersMain.dart';
import 'dart:ui';
import 'dart:io';
import 'dart:async';
import 'package:image/image.dart' as Im;
import 'package:path_provider/path_provider.dart';
import 'dart:math' as Math;
import 'package:money5_ios_android/colors.dart';
import 'package:date_format/date_format.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money5_ios_android/Products/ProductsMain.dart';
//import 'package:money5_ios_android/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../AppLocalizations.dart';

class OrdersAdd extends StatefulWidget {
  var Order_max;
  OrdersAdd({this.Order_max});
  @override
  _OrdersAddState createState() => _OrdersAddState();
}

QuerySnapshot cars;
const CURVE_HEIGHT = 160.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;
Color colorOne ;
Color colorTwo ;
Color colorThree ;
User user;

class _OrdersAddState extends State<OrdersAdd> {
  final GlobalKey<ScaffoldState> _scaffoldKeyOrders = new GlobalKey<ScaffoldState>();


  // Color pyellow = Color(red4);
  File _image;
  final ImagePicker _picker = ImagePicker();
  // PickedFile _imageFile;
  File _imageFile;
int cat_max;
  @override
  void initState() {
    getCurrentUser();
    //  print("inside init");
    colorOne = pcolor6;
    colorTwo = pcolor3;
    colorThree = pcolor1;
    getData().then((results) {
      setState(() {

        contOrderid.text = widget.Order_max;
        cars = results;
        printlist();
       // printlistcat();
      });
    });

    _selectedstatus=list_status[0];
    _selectedCat=list_cat_name[0];
    super.initState();
  }

/*
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

*/
  String imagename;
  //PickedFile sampleimage;
  File sampleimage;
  var currentdate;
  int state = 0;
  var url2;



  List<int> list_cat_max_id=[];

  List<String> list_cat_name=['Choose Category'];
  String _selectedCat = 'Choose Cat';

  List<String> list_status = ['Initial','Accept','Inprogress','Complete','Rejected'];
  String  _selectedstatus = 'Choose a Status';

  var catslist
  =[
    {
      "cat_id":"Weman Dress",
      "cat_name":"Weman Dress",
      "cat_desc":"Weman Dress",
      "cat_remark":"Weman Dress",
      "cat_date":"Weman Dress",

      "cat_img":'https://firebasestorage.googleapis.com/v0/b/fir-3af1c.appspot.com/o/t-shirt.jpg?alt=media&token=18e2c978-8386-4aaa-880c-dc8d0a5252eb',

    }
  ];


  TextEditingController contOrderid = new TextEditingController();
  TextEditingController contOrdername = new TextEditingController();
  TextEditingController contOrderprice = new TextEditingController();
  TextEditingController contOrderfav = new TextEditingController();
  TextEditingController contOrdercat = new TextEditingController();
  TextEditingController contOrderdesc = new TextEditingController();
  TextEditingController contOrderurl = new TextEditingController();
  TextEditingController contOrderdentrydate = new TextEditingController();



  Widget build(BuildContext context) {

    var pheight = MediaQuery.of(context).size.height;
    var pwidth = MediaQuery.of(context).size.width;

    var appLanguage = Provider.of<AppLanguage>(context);
    return Scaffold(
      key: _scaffoldKeyOrders,
      // drawer: Appdrawer(),
      body:GestureDetector(
        onTap: (){
          print('ontap');
          FocusScopeNode currentFocusOrders = FocusScope.of(context);

          if (!currentFocusOrders.hasPrimaryFocus) {
            currentFocusOrders.unfocus();
          }
        },

        child: Stack(
          children: <Widget>[
            //header shape
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(200),
                  //  color: red4,
                ),
                child: CustomPaint(
                  child: Container(
                    height: 400.0,
                  ),
                  painter: _MyPainter(),
                ),
              ),
            ),
            /*
            Positioned(
              top: 125,
              left: -150,
              child: Container(
                height: 450, //MediaQuery.of(context).size.height / 4,
                width: 450, //MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(250),
                  color: red4,
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 115,
              child: Container(
                height: 350, //MediaQuery.of(context).size.height / 4,
                width: 350, //MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: red4),
              ),
            ),
            */
            //a
            Positioned(
              bottom: -125,
              left: -150,
              child: Container(
                height: 250, //MediaQuery.of(context).size.height / 4,
                width: 250, //MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(250),
                  color: pcolor4,
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
                    color: pcolor4),
              ),
            ),
            //menu
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  print('inside button');
                  Navigator.pop(context);
                  //_scaffoldKeyOrders.currentState.openDrawer();
//                  Navigator.of(context).pushReplacement(
//                    new MaterialPageRoute(
//                        builder: (BuildContext context) => new OrdersMain()),
//                  );
                },
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 14,
              left: MediaQuery.of(context).size.width / 2 -
                  ('Add Order'.toString().length * 8),
              child: Text(
                'Add Order',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            //body
            Positioned(
              top: 110,
              right: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height >= 775.0
                      ? MediaQuery.of(context).size.height
                      : 775.0,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      // color: Colors.red,
                      //   height: MediaQuery.of(context).size.height/2,
                      //   width: MediaQuery.of(context).size.width,
                      child: new Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[

                              Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(5.0),
                                child: TextFormField(

                                    keyboardType: TextInputType.number,
                                    controller: contOrderid,
                                    onChanged: (value) {},
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Please Order Id ';
                                      }
                                    },
                                    onSaved: (input) => imagename = input,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,

//                        prefixIcon: Icon(Icons.search,
//                            color: red2),
//                            size: 30.0),
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.cancel,
                                                color: Color(
                                                    getColorHexFromStr('#FEE16D')),
                                                size: 20.0),
                                            onPressed: () {
                                              print('inside clear');
                                              contOrderid.clear();
                                              contOrderid.text = null;
                                            }),
                                        contentPadding:
                                        EdgeInsets.only(left: 15.0, top: 15.0),
                                        hintText: 'Order_id',
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Quicksand'))),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(5.0),
                                child: TextFormField(
                                    controller: contOrdername,
                                    onChanged: (value) {},
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Please Order Name ';
                                      }
                                    },
                                    onSaved: (input) => imagename = input,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
//                        prefixIcon: Icon(Icons.search,
//                            color: red2),
//                            size: 30.0),
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.cancel,
                                                color: Color(
                                                    getColorHexFromStr('#FEE16D')),
                                                size: 20.0),
                                            onPressed: () {
                                              print('inside clear');
                                              contOrdername.clear();
                                              contOrdername.text = null;
                                            }),
                                        contentPadding:
                                        EdgeInsets.only(left: 15.0, top: 15.0),
                                        hintText: 'Order_name',
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Quicksand'))),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(5.0),
                                child: TextFormField(
                                    controller: contOrderdesc,
                                    onChanged: (value) {},
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Please Prod Name ';
                                      }
                                    },
                                    onSaved: (input) => imagename = input,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
//                        prefixIcon: Icon(Icons.search,
//                            color: red2),
//                            size: 30.0),
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.cancel,
                                                color: Color(
                                                    getColorHexFromStr('#FEE16D')),
                                                size: 20.0),
                                            onPressed: () {
                                              print('inside clear');
                                              contOrderdesc.clear();
                                              contOrderdesc.text = null;
                                            }),
                                        contentPadding:
                                        EdgeInsets.only(left: 15.0, top: 15.0),
                                        hintText: 'Order_Desc',
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Quicksand'))),
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(5.0),
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: contOrderprice,
                                    onChanged: (value) {},
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Please Prod Cost ';
                                      }
                                    },
                                    onSaved: (input) => imagename = input,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,

                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.cancel,
                                                color: Color(
                                                    getColorHexFromStr('#FEE16D')),
                                                size: 20.0),
                                            onPressed: () {
                                              print('inside clear');
                                              contOrderprice.clear();
                                              contOrderprice.text = null;
                                            }),
                                        contentPadding:
                                        EdgeInsets.only(left: 15.0, top: 15.0),
                                        hintText: 'Order_Cost',
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Quicksand'))),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(5.0),
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15.0),
                                        child: DropdownButton<String>(
                                            items: list_cat_name.map((String val) {
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
                                    ),
                                    IconButton(icon:Icon(Icons.refresh,color: Red_deep,
                                    ),


                                      onPressed:(){
                                        getData().then((results) {
                                          setState(() {
                                            print(widget.Order_max);
                                            contOrderid.text = widget.Order_max;
                                            cars = results;
                                            printlist();
                                          });
                                        });
                                      },),
                                    RaisedButton(
                                        elevation: 7.0,
                                        child: Text("Add Category"),
                                        textColor: Colors.white,
                                        color: Red_deep,
                                        onPressed: () {
                                          print(cat_max);
                                          Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder:  (BuildContext context) => new AddCategory(cat_max: cat_max,)),
                                          );

                                          //Navigator.pushNamed(context, '/CategoryAdd');
                                        }),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              SizedBox(height: 5.0,),
                              Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(5.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(left:15.0),
                                  child: Align(
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
                                ),
                              ),

                              SizedBox(
                                height: 10,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
//                                  RaisedButton(
//                                    elevation: 7.0,
//                                    child: Text("Compressed"),
//                                    //  Text("Upload"),
//                                    textColor: Colors.white,
//                                    color: Red_deep,
//                                    onPressed: () {
//                                      compressImage();
//                                      /* final StorageReference fbsr =FirebaseStorage.instance.ref().child('${contimage.text}.jpg');
//                   final StorageUploadTask task = fbsr.putFile(sampleimage);
//                   var downurl = fbsr.getDownloadURL();
//                  print("the URL for image= ${downurl.toString()}");
//                   */
//                                    },
//                                  ),
                                  RaisedButton(
                                    elevation: 7.0,
                                    child:   Text("Save"),
                                    textColor: Colors.white,
                                    color: Red_deep,
                                    onPressed: () {
                                      setState(() {
                                        state = 1;
                                      });




                                      final todayDate = DateTime.now();
                                      currentdate = formatDate(todayDate,
                                          [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);

                                     addimagedata();
                                      addimagedatahist();


                                    },
                                  ),


                                ],
                              ),


                            ],
                          )),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }








  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    user = await _auth.currentUser;

    //final uid = user.uid;
    //return user.email;
  }
  addimagedata() {
    getCurrentUser();
    FirebaseFirestore.instance.collection("Orders").doc().set({
      'Order_id': contOrderid.text,
      'Order_name': contOrdername.text,
      'Order_desc': contOrderdesc.text,
      'Order_price': contOrderprice.text,
      'Order_fav': "false",
      'Order_cat': _selectedCat,
      'Order_entry_date': currentdate,
      'Order_date': currentdate,
      'Order_img': url2,
      'Order_user':user.email.toString(),
      'Order_uid':user.uid,
      'Order_status':_selectedstatus
    });
//
//    setState(() {
//      contOrderid.text = (int.parse(contOrderid.text) + 1).toString();
//      contOrdername.clear();
//      contOrderdesc.clear();
//      contOrderprice.clear();
//      showInSnackBar('Save');
//
//    });
  }

  addimagedatahist() {
    getCurrentUser();
    FirebaseFirestore.instance.collection("Orders_history").doc().set({
      'Order_id': contOrderid.text,
      'Order_name': contOrdername.text,
      'Order_desc': contOrderdesc.text,
      'Order_price': contOrderprice.text,
      'Order_fav': "false",
      'Order_cat': _selectedCat,
      'Order_entry_date': currentdate,
      'Order_date': currentdate,
      'Order_img': url2,
      'Order_user':user.email.toString(),
      'Order_uid':user.uid,
      'Order_status':_selectedstatus
    });

    setState(() {
      contOrderid.text = (int.parse(contOrderid.text) + 1).toString();
      contOrdername.clear();
      contOrderdesc.clear();
      contOrderprice.clear();
      showInSnackBar('Save');

    });
  }


  void showInSnackBar(String value) {
    _scaffoldKeyOrders.currentState.showSnackBar(new SnackBar(
        content: new Text(value)

    ));
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
  getData() async {
    //return await FirebaseFirestore.instance.collection("Gym-Proding").snapshots();
    return await FirebaseFirestore.instance.collection('TypeCategory').get();
  }

  printlist(){
    if (cars != null) {
  print('inside if');
      list_cat_max_id.clear();
  list_cat_name.clear();
      for(var i =0 ;i<cars.docs.length;i++)
      {
       print('inside for');
       print(int.parse(cars.docs[i].data()['cat_id']));
       list_cat_max_id.add(int.parse(cars.docs[i].data()['cat_id']));
        list_cat_name.add(cars.docs[i].data()['cat_name']);
        catslist.add(
            {
              "cat_name":cars.docs[i].data()['cat_name'],
              "cat_desc":cars.docs[i].data()['cat_desc'],
              "cat_remark":cars.docs[i].data()['cat_remark'],
              "cat_date":cars.docs[i].data()['cat_date'].toString(),

              "cat_img":cars.docs[i].data()['cat_img'],
              "cat_doc_id"  : cars.docs[i].id.toString(),


            }

        );


      }

      print('list_cat_name ${list_cat_name}');
      catslist.removeAt(0);
      print('list=====');

      list_cat_max_id.sort();
      print(list_cat_max_id);
      var array_len = list_cat_max_id.length;
      print(array_len);
      print(list_cat_max_id[array_len-1]);
      setState(() {
        cat_max = list_cat_max_id[array_len-1]+ 1;


        print(cat_max);
        //duplicateItems = catslist;
      });
    }

    else
    {
      print("error");
    }


  }
//  printlistcat() {
//    if (cars != null) {
//      list_cat.clear();
//      for (var i = 0; i < cars.docs.length; i++) {
//        list_cat.add(cars.docs[i].data()['cat_name']);
//      }
//      }
//      else {
//      print("error");
//    }
//  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = pcolor4;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1, size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
