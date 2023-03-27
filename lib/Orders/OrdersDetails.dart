
import 'package:flutter/material.dart';
import 'package:money5_ios_android/Products/ProductsEditNew.dart';
import 'package:money5_ios_android/Orders/OrdersMain.dart';
import 'dart:ui';
import 'dart:math';
import 'package:money5_ios_android/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:money5_ios_android/AppLocalizations.dart';
import 'package:date_format/date_format.dart';
import 'OrdersEdit.dart';

class OrdersDetails extends StatefulWidget {
  final String Order_id;
  final String Order_name;
  final String Order_desc;
  final String Order_price;
  final String Order_fav;
  final String Order_cat;
  final String Order_img;
  final String Order_status;
  final String Order_date;
  final String  Order_Modify_date;
  final String Order_doc_id;

  OrdersDetails(
      {
        this.Order_id,
        this.Order_name,
        this.Order_desc,
        this.Order_price,
        this.Order_fav,
        this.Order_cat,
        this.Order_img,
        this.Order_status,
        this.Order_date,
        this.Order_Modify_date,
        this.Order_doc_id});
  @override
  _OrdersDetailsState createState() => _OrdersDetailsState();
}

const CURVE_HEIGHT = 160.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;
Color colorOne = pcolor2;
Color colorTwo = pcolor3;
Color colorThree = pcolor4;


class _OrdersDetailsState extends State<OrdersDetails> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colorOne = pcolor2;
    colorTwo = pcolor3;
    colorThree = pcolor4;
  }
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // Color pyellow = Color(Colors.amber);
  bool data_deleted =false;


  Widget build(BuildContext context) {
    var pheight = MediaQuery.of(context).size.height;
    var pwidth = MediaQuery.of(context).size.width;

    var appLanguage = Provider.of<AppLanguage>(context);


    return Scaffold(
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

                Navigator.pushReplacementNamed(context, "/OrdersMain");
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
            top: MediaQuery.of(context).size.height/10,
            bottom: MediaQuery.of(context).size.height/30,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height >= 775.0
                    ? MediaQuery.of(context).size.height
                    : 775.0,

                child:Container(

                    padding: EdgeInsets.all(5.0),
                    child: new Card(
                      child: new Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left:10.0,right:10),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.all(5.0),
                                ),
                                new Text(
                                  '${AppLocalizations.of(context).translate('No') } :  ${widget.Order_id}',
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                new Text(
                                  '${AppLocalizations.of(context).translate('Name')} :  ${widget.Order_name}',
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                new Text(
                                  '${AppLocalizations.of(context).translate('Desc') } :  ${widget.Order_desc}',
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                new Text(
                                  '${AppLocalizations.of(context).translate('Date') }  :  ${widget.Order_date}',
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                new Text(
                                  '${AppLocalizations.of(context).translate('Date') }  :  ${widget.Order_Modify_date}',
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                new Text(
                                  '${AppLocalizations.of(context).translate('Progress') }  :  ${widget.Order_status}',
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                new Text(
                                  '${AppLocalizations.of(context).translate('Category') }  :  ${widget.Order_cat}',
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
//                                Padding(
//                                  padding: const EdgeInsets.only(top:8.0,bottom:8),
//                                  child: Container(
//
//                                    height: MediaQuery.of(context).size.height/2.5,
//                                    width: MediaQuery.of(context).size.width-30,
//                                    decoration: BoxDecoration(
//                                        image: DecorationImage(
//                                          image:  NetworkImage(widget.Order_img),
//                                          fit: BoxFit.cover,
//
//                                        ),
//                                        borderRadius: BorderRadius.circular(10)
//
//
//                                    ),
////                                  child: Image.network(
////                                    widget.Order_img,
////                                   // height: pheight/2,
////                                 //   width: pwidth-20,
////                                  ),
//                                  ),
//                                ),
                                new Padding(
                                  padding: EdgeInsets.only(top: 0.0),
                                ),
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  //  crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Center(
                                      child: new RaisedButton(
                                          child: new Text(AppLocalizations.of(context).translate('Edit')),
                                          color: Red_deep,
                                          // onPressed: ()
                                          onPressed: () {
                                            // print("widget.pcarnameg = ${widget.pcarnameg}");
                                            Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder: (BuildContext context) =>
                                                  new OrdersEdit(

                                                    Order_id: widget.Order_id,
                                                    Order_name: widget.Order_name,
                                                    Order_desc: widget.Order_desc,
                                                    Order_price: widget.Order_price,
                                                    Order_fav: widget.Order_fav,
                                                    Order_cat: widget.Order_cat,
                                                    Order_date: widget.Order_date,
                                                    Order_img: widget.Order_img,
                                                    Order_doc_id: widget.Order_doc_id,
                                                    Order_status: widget.Order_status,
                                                  )),

                                            );

                                          }),
                                    ),
                                    new RaisedButton(
                                      child: new Text(AppLocalizations.of(context).translate('Delete')),
                                      color: Red_deep,
                                      onPressed: () {
                                        print("widget.pproductdocid ${widget.Order_doc_id}");
                                        deleteData(widget.Order_doc_id) ;
                                        Navigator.of(context).pushReplacement(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) => new OrdersMain()),
                                        );




                                      },
                                    ),
                                    new RaisedButton(
                                      child: new Text(AppLocalizations.of(context).translate('Tranfer')),
                                      color: Red_deep,
                                      onPressed: () {
                                        transferorderdata();
                                        Navigator.of(context).pushReplacement(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) => new OrdersMain()),
                                        );




                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ))



            ),
          ),

//title
          Positioned(
            top: MediaQuery
                .of(context)
                .size
                .height/20,
            left: MediaQuery
                .of(context)
                .size
                .width / 2 - 70,
            child: Text(
              ' ${widget.Order_name}',
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
            ),
          ),



        ],
      ),
    );






  }

  deleteData(docId) async {
    if (widget.Order_img != null) {
      StorageReference storageReference =
      await FirebaseStorage.instance.getReferenceFromUrl(widget.Order_img);

      print(storageReference.path);

      await storageReference.delete();

      print('image deleted');
    }
    FirebaseFirestore.instance
        .collection('Orders')
        .doc(docId)
        .delete()
        .catchError((e) {
      print(e);
    });

//    Navigator.of(context).pushReplacement(
//      new MaterialPageRoute(
//          builder: (BuildContext context) => new SocialHome()),
//    );
  }

  transferorderdata() {
    var url2;
    final todayDate = DateTime.now();
    var currentdate=formatDate(todayDate, [yyyy, '-', mm, '-', dd, ' ', hh, ':', nn, ':', ss, ' ', am]);

    FirebaseFirestore.instance.collection("Type").doc().set({
      'type_id': widget.Order_id,
      'type_name': widget.Order_name,
      'type_desc': widget.Order_desc,
      'type_price': widget.Order_price,


      'type_cat': widget.Order_cat,
      'type_entry_date': currentdate,
      'type_date': currentdate,
      'type_img': url2 == null ? 'no image': url2
    });


  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = colorTwo;
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

