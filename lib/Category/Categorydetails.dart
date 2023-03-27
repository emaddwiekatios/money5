import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money5_ios_android/colors.dart';
import './CategoryMain.dart';
import './categoryedite.dart';
import 'package:provider/provider.dart';
import 'package:money5_ios_android/AppLocalizations.dart';

//import './editproductcom.dart';
//import './editeproducts.dart';
//import './image_all.dart';

class categorysdetails extends StatefulWidget {
  final String cat_id;
  final String cat_name;
  final String cat_desc;
  final String cat_remark;
  final String cat_img;
  final String cat_date;
  final String cat_doc_id;

  categorysdetails(
      {this.cat_id,
      this.cat_name,
      this.cat_desc,
      this.cat_remark,
      this.cat_img,
      this.cat_date,
      this.cat_doc_id});

  @override
  categorysdetailsState createState() => categorysdetailsState();
}


const CURVE_HEIGHT = 160.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;
Color colorOne = Colors.amber;
Color colorTwo = Colors.amber[300];
Color colorThree = Colors.amber[100];

class categorysdetailsState extends State<categorysdetails> {
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
                color:pcolor3,
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
                  color: pcolor6),
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

                child:Container(
                  //  height: 500,
                    padding: EdgeInsets.all(5.0),
                    child: new Card(
                      elevation: 12,
                      child: new Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left:20.0,right: 20),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.all(10.0),
                                ),

                                new Text(
                                  '${AppLocalizations.of(context).translate('Cat No') } :  ${widget.cat_id}',
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                new Text(
                                  '${AppLocalizations.of(context).translate('Cat Name') } :  ${widget.cat_name}',
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                new Text(
                                  '${AppLocalizations.of(context).translate('Cat Desc') } :  ${widget.cat_desc}',
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                new Text(
                                  '${AppLocalizations.of(context).translate('Date') } :  ${widget.cat_date}',
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
//                                Center(
//                                  child: Image.network(
//                                    widget.cat_img,
//                                    height: pheight/3,
//                                    width: pwidth-20,
//                                  ),
//                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0,bottom:8),
                                  child: Container(

                                    height: MediaQuery.of(context).size.height/2,
                                    width: MediaQuery.of(context).size.width-30,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image:  NetworkImage(widget.cat_img),
                                          fit: BoxFit.cover,

                                        ),
                                        borderRadius: BorderRadius.circular(10)


                                    ),
//                                  child: Image.network(
//                                    widget.Docs_img,
//                                   // height: pheight/2,
//                                 //   width: pwidth-20,
//                                  ),
                                  ),
                                ) ,
                                new Padding(
                                  padding: EdgeInsets.only(top: 20.0),
                                ),
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Center(
                                      child: new RaisedButton(
                                          child: new Text(
                                              AppLocalizations.of(context).translate('Edit')),
                                          color: Red_deep,
                                          // onPressed: ()
                                          onPressed: () {
                                            // print("widget.pcarnameg = ${widget.pcarnameg}");
                                            Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder: (BuildContext context) =>
                                                  new EditCategory(
                                                    cat_id: widget.cat_id,
                                                    cat_name: widget.cat_name,
                                                    cat_desc: widget.cat_desc,
                                                    cat_remark: widget.cat_remark,
                                                    cat_date: widget.cat_date,
                                                    cat_img: widget.cat_img,
                                                    cat_doc_id: widget.cat_doc_id,
                                                  )),
                                            );
                                          }),

                                    ),
                                    new RaisedButton(
                                      child: new Text(
                                          AppLocalizations.of(context).translate('Delete')),
                                      color: Red_deep,
                                      onPressed: () {
                                        print("widget.pproductdocid ${widget.cat_doc_id}");
                                        //   deleteData(widget.pproductdocid) ;
                                        // comfirm();
                                        deleteData(widget.cat_doc_id);
                                        //  updatedata();
                                        /*  Navigator.of(context).push(
                              new MaterialPageRoute(
                                 builder: (BuildContext context)=> new CategoryMain()
                                 ),
                               );
                     */

                                        Navigator.pushNamed(context, '/CategoryMain2');
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ))
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
    );

  }
  deleteData(docId) {
    FirebaseFirestore.instance
        .collection('Category')
        .doc(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
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
