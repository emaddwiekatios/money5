import 'package:flutter/material.dart';
import 'package:money5_ios_android/colors.dart';
import 'dart:ui';
import 'dart:math';
//import 'package:flutter_app_vetagable/Pages/colors.dart';
import 'Category.dart';
import 'package:money5_ios_android/Category/categoryAdd.dart';
import 'package:money5_ios_android/Products/Drawer.dart';

import 'package:provider/provider.dart';
import 'package:money5_ios_android/AppLocalizations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CategoryMain2 extends StatefulWidget {
  @override
  _CategoryMain2State createState() => _CategoryMain2State();
}

const CURVE_HEIGHT = 160.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;
Color colorOne = pcolor1;
Color colorTwo = pcolor4;
Color colorThree = pcolor6;
var cat_max;
QuerySnapshot cars;
List<int> list_cat = [];
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

class _CategoryMain2State extends State<CategoryMain2> {

  @override
  void initState() {
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // Color pyellow = Color(Colors.amber);

  Widget build(BuildContext context) {

    var pheight = MediaQuery.of(context).size.height;
    var pwidth = MediaQuery.of(context).size.width;

    var appLanguage = Provider.of<AppLanguage>(context);


    return Scaffold(
      key: _scaffoldKey,
       drawer: Appdrawer(),
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
            top: 75,
            right: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height >= 775.0
                    ? MediaQuery.of(context).size.height
                    : 775.0,

                child:Category(),


            ),
          ),
          //header title
          Positioned(
            top: MediaQuery.of(context).size.height / 18,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: Text(
              AppLocalizations.of(context).translate('Category'),
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
            ),
          ),







        ],
      ),

      floatingActionButton: new  FloatingActionButton(
        onPressed: ()
        {
          print(cat_max);
          Navigator.of(context).push(
            new MaterialPageRoute(
                builder:  (BuildContext context) => new AddCategory(cat_max: cat_max,)),
          );
          /*  FirebaseFirestore.instance.collection("cars").doc().setData({
            'carname':'bmw1',
             'color':'red2'
          });
          */
        },
        tooltip: 'Increement',
        child: new Icon(Icons.add),
      ),

    );






  }

  getData() async {
    //return await FirebaseFirestore.instance.collection("Gym-Category").snapshots();


    return await FirebaseFirestore.instance.collection('Category').get();

  }


  printlist(){
    if (cars != null) {
      list_cat.clear();
      for(var i =0 ;i<cars.docs.length;i++)
      {

          print(cars.docs[i].data()['cat_id']);
          list_cat.add(int.parse(cars.docs[i].data()['cat_id']));
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
      catslist.removeAt(0);
      print('list=====');

      list_cat.sort();
      print(list_cat);
      var array_len = list_cat.length;
      print(array_len);
      print(list_cat[array_len-1]);
      setState(() {
        cat_max = list_cat[array_len-1]+ 1;


      print(cat_max);
        //duplicateItems = catslist;
      });
    }

    else
    {
      print("error");
    }


  }


}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = colorThree;
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
/*
class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = Colors.purple[700];

    Offset circleCenter = Offset(size.width / 2, size.height - AVATAR_RADIUS);

    Offset topLeft = Offset(0, 0);
    Offset bottomLeft = Offset(0, size.height * 0.25);
    Offset topRight = Offset(size.width, 0);
    Offset bottomRight = Offset(size.width, size.height * 0.5);

    Offset leftCurveControlPoint = Offset(circleCenter.dx * 0.5, size.height - AVATAR_RADIUS * 1.5);
    Offset rightCurveControlPoint = Offset(circleCenter.dx * 1.6, size.height - AVATAR_RADIUS);

    final arcStartAngle = 200 / 180 * pi;
    final avatarLeftPointX = circleCenter.dx + AVATAR_RADIUS * cos(arcStartAngle);
    final avatarLeftPointY = circleCenter.dy + AVATAR_RADIUS * sin(arcStartAngle);
    Offset avatarLeftPoint = Offset(avatarLeftPointX, avatarLeftPointY); // the left point of the arc

    final arcEndAngle = -5 / 180 * pi;
    final avatarRightPointX = circleCenter.dx + AVATAR_RADIUS * cos(arcEndAngle);
    final avatarRightPointY = circleCenter.dy + AVATAR_RADIUS * sin(arcEndAngle);
    Offset avatarRightPoint = Offset(avatarRightPointX, avatarRightPointY); // the right point of the arc

    Path path = Path()
      ..moveTo(topLeft.dx, topLeft.dy) // this move isn't required since the start point is (0,0)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..quadraticBezierTo(leftCurveControlPoint.dx, leftCurveControlPoint.dy, avatarLeftPoint.dx, avatarLeftPoint.dy)
      ..arcToPoint(avatarRightPoint, radius: Radius.circular(AVATAR_RADIUS))
      ..quadraticBezierTo(rightCurveControlPoint.dx, rightCurveControlPoint.dy, bottomRight.dx, bottomRight.dy)
      ..lineTo(topRight.dx, topRight.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
*/