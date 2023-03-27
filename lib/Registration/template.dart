import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:money5_ios_android/AppLocalizations.dart';
import 'package:money5_ios_android/colors.dart';

class template extends StatefulWidget {
  @override
  _templateState createState() => _templateState();
}

const CURVE_HEIGHT = 160.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;
Color colorOne = Colors.amber;
Color colorTwo = Colors.amber[300];
Color colorThree = Colors.amber[100];

class _templateState extends State<template> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // Color pyellow = Color(Colors.amber);

  Widget build(BuildContext context) {
    var pheight = MediaQuery.of(context).size.height;
    var pwidth = MediaQuery.of(context).size.width;

    var appLanguage = Provider.of<AppLanguage>(context);

    return Scaffold(
      key: _scaffoldKey,
      // drawer: Appdrawer(),
      body:
      GestureDetector(
        onTap: (){
          print('ontap');
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
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
            /*
            Positioned(
              top: 125,
              left: -150,
              child: Container(
                height: 450, //MediaQuery.of(context).size.height / 4,
                width: 450, //MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(250),
                  color: Colors.amber,
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
                    color: Colors.amber),
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
                  color: pcolor1,
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
                    color: pcolor2),
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
              top: pheight/10,
              right: 0,
              bottom: 20,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height >= 775.0
                      ? MediaQuery.of(context).size.height
                      : 775.0,
                  /* decoration: new BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [
                              Colors.red,
                            Colors.orange

                            //Color(getColorHexFromStr('#FDD100')),
                             //Color(getColorHexFromStr('#FDD120'))
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
*/
                  child:Center(child: Text('Welcome'))
/*
FutureBuilder<List<UserModel>>(
future: db.getUserModelData(),
builder: (context, snapshot) {
if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
*/


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

}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = pcolor3;
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
