import 'package:flutter/material.dart';
import 'package:money5_ios_android/colors.dart';
//import './Types.dart';
import 'package:date_format/date_format.dart';
//import 'package:money5_ios_android/Category/Categoryadd.dart';
import 'package:money5_ios_android/colors.dart';
import './TypesADD.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import './TypesDetails.dart';
import 'dart:async';
class TypeMain extends StatefulWidget {
  @override
  _TypeMainState createState() => _TypeMainState();
}




class _TypeMainState extends State<TypeMain> {
  //final RefreshController _refreshController = RefreshController();


  var prod_max;
  QuerySnapshot cars;
  double sumprice=0.0;
  List<String> list_cat = ['All','1','2','3','4','5','6','7','8','9','10','11','12'];
  String _selectedCat = 'All';

  var refreshKeytype = GlobalKey<RefreshIndicatorState>();


  void initState() {


    getData().then((results) {
      setState(() {

        cars = results;

        printlist();
      });
    });
    setState(() {
      Typeslist.removeAt(0);
    });

    //   print("after init");

    super.initState();
  }


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


  var list
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
  var dummySearchList
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

  var duplicateItems
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

  var dummyListData
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


  TextEditingController contsearch = new TextEditingController();


  void gettypetotalprice()
  {
    sumprice=0.0;
  int len =Typeslist.length;
  double loc_sum =0.0;
  for (int i=0 ;i< len ;i++) {
    print(Typeslist[i]['type_price']);

    loc_sum=loc_sum+double.parse(Typeslist[i]['type_price']);
  }
    setState(() {
      sumprice=loc_sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*
      bottomNavigationBar: Material(
          elevation: 7.0,
          color: Colors.white,
          child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Total: \$'  +sumprice.toString()),
                  SizedBox(width: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {

                      },
                      elevation: 0.5,
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          'Pay Now',
                        ),
                      ),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ))),


      appBar: AppBar(title: Text("Types"),backgroundColor: firstColor,
        leading: IconButton(icon: Icon(Icons.home),onPressed:() {
          /*  Navigator.of(context).pushReplacement(new MaterialPageRoute(
                        builder: (BuildContext context) => new Home()
                        ),);
                        */
          Navigator.pushNamed(context, "/main_page");
          // Navigator.pop(context);
          /*       Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder:  (BuildContext context) => new Home2()),
                      );
                      */
        }),

        /*   actions: <Widget>[
                       IconButton(icon: Icon(Icons.arrow_back_ios),onPressed:() {
                          Navigator.pushNamed(context, "/homepage");
                       }),

                     ],
                     */
      ),
*/
      body:
           Stack(
             children: <Widget>[
//background
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
                     color: Color(getColorHexFromStr('#FDD110')),
                   ),
                 ),
               ),
               Positioned(
                 top: 125,
                 left: -150,
                 child: Container(
                   height: 450, //MediaQuery.of(context).size.height / 4,
                   width: 450, //MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(250),
                     color: Color(getColorHexFromStr('#FDD110')),
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
                       color: Color(
                         getColorHexFromStr('#FEE16D'),
                       )),
                 ),
               ),
               Positioned(
                 bottom: -40,
                 left: -30,
                 child:  Container(
                   height: MediaQuery.of(context).size.height / 3.5,
                   width: MediaQuery.of(context).size.width/1.5,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(200),
                     color: Color(getColorHexFromStr('#FEE16D'),
                     ),
                   ),
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
                   'Types List',
                   style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                 ),
               ),
               //menu
               Positioned(
                 top: MediaQuery
                     .of(context)
                     .size
                     .height/40,
                 left: 20,
                 child: IconButton(
                   icon: Icon(Icons.menu),
                   onPressed: () {
                     print('inside button');
                    // _scaffoldKey.currentState.openDrawer();

                      Navigator.pushNamed(context, "/ProductsMain");
                   },
                 ),
               ),
               Positioned(
                 top: MediaQuery
                     .of(context)
                     .size
                     .height/40,
                 right: 20,
                 child: IconButton(
                   icon: Icon(Icons.add),
                   onPressed: () {
                     print('inside button');
                     // _scaffoldKey.currentState.openDrawer();

                     Navigator.of(context).push(
                       new MaterialPageRoute(
                           builder:  (BuildContext context) => new TypesADD(prod_max)),
                     );

                   },
                 ),
               ),
//list
               Positioned(
                 top: MediaQuery
                     .of(context)
                     .size
                     .height/5,
                 left: 5,
                 right: 5,
                 bottom:50,
                 child:
                      Container(
                       height: MediaQuery
                           .of(context)
                           .size.height-30,
                       width: MediaQuery
                           .of(context)
                           .size.width-30,
                       child:_BuildList(),
//                       ListView.builder(
//                        itemCount: Typeslist.length,
//                        itemBuilder: (BuildContext context,int index){
//                          return build_item(context,index);
//
                      //  }

                     //),


                 ),
               ),


            //search
               Positioned(
                 top:  MediaQuery
                     .of(context)
                     .size
                     .height/9,
                 left: 10,
                 right: 10,

                 // left: MediaQuery.of(context).size.width / 2 - 70,
                 child:

                 Column(
                   children: [
                 Container(
                       height: 50,
                       width: MediaQuery
                           .of(context)
                           .size
                           .width - 30,
                       child: Material(

                         elevation: 5.0,
                         borderRadius: BorderRadius.circular(5.0),
                         child: TextField(
                           controller: contsearch,
                             onChanged: (value) {
                               print('inside change$value');
                               filterSearchResults(value);
                               gettypetotalprice();
                             },
                             decoration: InputDecoration(
                                 border: InputBorder.none,
                                 prefixIcon: Icon(Icons.search,
                                     color:Color(getColorHexFromStr('#FEE16D')),
                                     size: 30.0),
                                 suffixIcon: IconButton(icon: Icon(Icons.cancel,
                                     color: Color(getColorHexFromStr('#FEE16D')),
                                     size: 30.0)
                                     , onPressed: (){
                                       print('inside clear');
                                       contsearch.clear();
                                       contsearch.text=null;
                                       filterSearchResults(contsearch.text);
                                       gettypetotalprice();

                                     }),
                                 contentPadding:
                                 EdgeInsets.only(left: 15.0, top: 15.0),
                                 hintText: 'Search',
                                 hintStyle: TextStyle(
                                     color: Colors.grey,
                                     fontFamily: 'Quicksand'))),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left:8.0,bottom:8),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text('Month : '),
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
                                     filterSearchMonth(_selectedCat.toString());
                                   });
                                 }),
                           ),
                         ],
                       ),
                     ),
                   ],

                 ),

               ),
               Positioned(
                 bottom: 0,
                 child: Material(
                     elevation: 7.0,
                     color: Colors.white,
                     child: Container(
                         height: 55.0,
                         width: MediaQuery.of(context).size.width,
                         color: Colors.white,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: <Widget>[



                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: RaisedButton(
                                 onPressed: () {

                                 },
                                 elevation: 0.5,
                                 color: Colors.red,
                                 child: Center(
                                   child: Text(
                                       'Total: \$'  +sumprice.toString(),
                                   ),
                                 ),
                                 textColor: Colors.white,
                               ),
                             ),

                           ],
                         ))),
               )

    ],
      ),


);


  }
  Widget _BuildList() {
    return //docslist.length > 0
      //    ?
      RefreshIndicator(
        // key: refreshKey,
          child: ListView.builder(
              itemCount: Typeslist.length,
              itemBuilder: (BuildContext context,int index){
                return build_item(context,index);

              }),
          onRefresh: refreshList
      );
    // : Center(child: CircularProgressIndicator());
  }
  ///

  Future<Null> refreshList() async {


    refreshKeytype.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _selectedCat='All';

      filterSearchMonth(_selectedCat);
      getData().then((results) {
        setState(() {
          cars = results;
          printlist();
          gettypetotalprice();
        });
      });

    });

    return null;
  }


  ///
  getData() async {
    //return await FirebaseFirestore.instance.collection("Gym-Types").snapshots();


    return await FirebaseFirestore.instance.collection('Type').get();
  }


  printlist(){
    if (cars != null) {

     Typeslist.clear();


      for(var i =0 ;i<cars.docs.length;i++)
      {
        print('the name${cars.docs[i].data()['type_name']}');
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

      duplicateItems=Typeslist;
    });


    setState(() {


        duplicateItems=Typeslist;
        print(duplicateItems);

        filterSearchMonth('All');
        _selectedCat='All';
        gettypetotalprice();
    });



  }


  Widget build_item(BuildContext context,int index) {
    return   Stack(
      children: <Widget>[
          Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0.0,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child:    InkWell(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder:  (BuildContext context) => new TypesDetails(

                      type_id:Typeslist[index]['type_id'],
                      type_name: Typeslist[index]['type_name'],
                      type_desc:Typeslist[index]['type_desc'],
                      type_img:Typeslist[index]['type_img'] ,
                      type_price:Typeslist[index]['type_price'],
                      type_cat:Typeslist[index]['type_cat'] ,
                      type_date: Typeslist[index]['type_entry_date'],
                      type_doc_id: Typeslist[index]['type_doc_id'].toString(),


                    )
                ),
              );


/*
                  Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    builder: (BuildContext context) => new CartesDetails()
                  ),
                  );
*/
            },
            child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 20,
                    child: Container(
                        padding: EdgeInsets.only(left: 15.0, right: 10.0),
                        width: MediaQuery.of(context).size.width - 20.0,
                        height: 130.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[

                                Container(
                                  alignment: Alignment.topLeft,
                                  height: MediaQuery.of(context).size.height/8,
                                  width: MediaQuery.of(context).size.width/3.5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      /*border: Border.all(
                                              color: Colors.white,
                                              style: BorderStyle.solid,
                                              width: 2.0),
                                              */
                                      //shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,

                                          //image: NetworkImage(user_img),
                                          image: Typeslist[index]['type_img'].toString() != null
                                              ? NetworkImage(Typeslist[index]['type_img'])
                                              : AssetImage('images/chris.jpg')

                                        // image: AssetImage('images/chris.jpg')
                                      )),
                                ),

                                //  SizedBox(width: 10.0),

                                //   SizedBox(width: 20),
                              ],
                            ),
                            //name
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 0,
                                    ),
                                    Text(
                                      Typeslist[index]['type_name'],
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    SizedBox(width: 15.0),
                                  ],
                                ),
                                SizedBox(height: 0.0),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Id: '+ Typeslist[index]['type_id'] ,
                                      /*
                                                    + color,
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0,
                                                    color: Colors.grey),
                                          */
                                    )
                                    /*
                                                : OutlineButton(
                                              onPressed: () {},
                                              borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 1.0,
                                                  style: BorderStyle.solid),
                                              child: Center(
                                                child: Text('Find Similar',
                                                    style: TextStyle(
                                                        fontFamily: 'Quicksand',
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 12.0,
                                                        color: Colors.red)),
                                              ),
                                            ),
                                            */,

                                    SizedBox(width: 10.0),
                                    /* available
                                            ? Text(
                                          '\$' + price,
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                              color: Color(0xFFFDD34A)),
                                        )
                                            : Container(),
                                        */
                                  ],
                                ),
                                //SizedBox(height: 7.0),
                                //
                                Text(
                                  'Price :\$ ' + Typeslist[index]['type_price'],
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Color(0xFFFDD34A)),
                                ),
                                Text(
                                  Typeslist[index]['type_cat'],
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.black),
                                ),
                                Text(
                                  Typeslist[index]['type_entry_date'] ,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.black),
                                ),




                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                /* available
                                          ? Typeslist[index]
                                                  ['type_selected'] //picked[i]
                                              ?
                                              //
                                              Column(
                                                  children: <Widget>[
                                                    SizedBox(height: 10,),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          int temp = Typeslist[index]
                                                              ['type_num'];
                                                          temp = temp + 1;
                                                          Typeslist[index]
                                                              ['type_num'] = temp;
                                                          getTotalAmount2();
                                                          // Typeslist[index]['type_num']=temp;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.add_circle,color: Colors.amber,
                                                        // size: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      'X ' +
                                                          Typeslist[index]['type_num']
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontFamily: 'Montserrat',
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14.0,
                                                          color: Colors.grey),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        int temp = Typeslist[index]
                                                            ['type_num'];
                                                        if (temp > 1) {
                                                          setState(() {
                                                            int temp = Typeslist[index]
                                                                ['type_num'];
                                                            temp = temp - 1;
                                                            Typeslist[index]
                                                                ['type_num'] = temp;

                                                            getTotalAmount2();
                                                          });
                                                        }
                                                      },
                                                      icon: Icon(Icons.do_not_disturb_on,color: Colors.amber,),
                                                    ),
                                                  ],
                                                )

                                              //

                                              : Container()
                                          : Container(),
                                          */
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('$index'),
                                    IconButton(
                                      icon: Icon(Icons.delete_sweep,color: Colors.red,),
                                      onPressed: () {
                                        setState(() {
                                          print('index=$index');
                                          print(Typeslist[index]['type_doc_id'].toString());
                                          print(Typeslist[index]['type_id'].toString());
                                          print(Typeslist[index]['type_doc_id'].toString());
                                          deleteData(Typeslist[index]['type_doc_id'].toString());
                                          Typeslist.removeAt(index);

                                          // printlist();
                                          gettypetotalprice();
                                        });
                                      },

                                    ),
                                    IconButton(
                                      icon: Icon(Icons.more,color: Colors.red),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              ],
                            ),

                          ],
                        )))),
          ),







        ),
            Positioned(
              top: 10,
               left: 20,
                child: Icon(Icons.favorite,color: Colors.red,),
    )
      ],
    );
  }
/*
  Widget build_item(BuildContext context,int index) {
    return   Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0.0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child:    InkWell(
        onTap: () {
          Navigator.of(context).push(
            new MaterialPageRoute(
                builder:  (BuildContext context) => new TypesDetails(

                  type_id:Typeslist[index]['type_id'],
                  type_name: Typeslist[index]['type_name'],
                  type_desc:Typeslist[index]['type_desc'],
                  type_img:Typeslist[index]['type_img'] ,
                  type_price:Typeslist[index]['type_price'],
                  type_cat:Typeslist[index]['type_cat'] ,
                  type_date: Typeslist[index]['type_entry_date'],
                  type_doc_id: Typeslist[index]['type_doc_id'].toString(),


                )
            ),
          );


/*
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                builder: (BuildContext context) => new CartesDetails()
              ),
              );
*/
        },
        child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Material(
                borderRadius: BorderRadius.circular(10.0),
                elevation: 20,
                child: Container(
                    padding: EdgeInsets.only(left: 15.0, right: 10.0),
                    width: MediaQuery.of(context).size.width - 20.0,
                    height: 130.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[

                            Container(
                              alignment: Alignment.topLeft,
                              height: MediaQuery.of(context).size.height/8,
                              width: MediaQuery.of(context).size.width/3.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  /*border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 2.0),
                                          */
                                  //shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,

                                      //image: NetworkImage(user_img),
                                      image: Typeslist[index]['type_img'].toString() != null
                                          ? NetworkImage(Typeslist[index]['type_img'])
                                          : AssetImage('images/chris.jpg')

                                    // image: AssetImage('images/chris.jpg')
                                  )),
                            ),

                            //  SizedBox(width: 10.0),

                            //   SizedBox(width: 20),
                          ],
                        ),
                        //name
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 0,
                                ),
                                Text(
                                  Typeslist[index]['type_name'],
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                SizedBox(width: 15.0),
                              ],
                            ),
                            SizedBox(height: 0.0),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Id: '+ Typeslist[index]['type_id'] ,
                                  /*
                                                + color,
                                            style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: Colors.grey),
                                      */
                                )
                                /*
                                            : OutlineButton(
                                          onPressed: () {},
                                          borderSide: BorderSide(
                                              color: Colors.red,
                                              width: 1.0,
                                              style: BorderStyle.solid),
                                          child: Center(
                                            child: Text('Find Similar',
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.0,
                                                    color: Colors.red)),
                                          ),
                                        ),
                                        */,

                                SizedBox(width: 10.0),
                                /* available
                                        ? Text(
                                      '\$' + price,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Color(0xFFFDD34A)),
                                    )
                                        : Container(),
                                    */
                              ],
                            ),
                            //SizedBox(height: 7.0),
                            //
                            Text(
                              'Price :\$ ' + Typeslist[index]['type_price'],
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Color(0xFFFDD34A)),
                            ),
                            Text(
                              Typeslist[index]['type_cat'],
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.black),
                            ),
                            Text(
                              Typeslist[index]['type_entry_date'] ,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.black),
                            ),




                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            /* available
                                      ? Typeslist[index]
                                              ['type_selected'] //picked[i]
                                          ?
                                          //
                                          Column(
                                              children: <Widget>[
                                                SizedBox(height: 10,),
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      int temp = Typeslist[index]
                                                          ['type_num'];
                                                      temp = temp + 1;
                                                      Typeslist[index]
                                                          ['type_num'] = temp;
                                                      getTotalAmount2();
                                                      // Typeslist[index]['type_num']=temp;
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.add_circle,color: Colors.amber,
                                                    // size: 15,
                                                  ),
                                                ),
                                                Text(
                                                  'X ' +
                                                      Typeslist[index]['type_num']
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14.0,
                                                      color: Colors.grey),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    int temp = Typeslist[index]
                                                        ['type_num'];
                                                    if (temp > 1) {
                                                      setState(() {
                                                        int temp = Typeslist[index]
                                                            ['type_num'];
                                                        temp = temp - 1;
                                                        Typeslist[index]
                                                            ['type_num'] = temp;

                                                        getTotalAmount2();
                                                      });
                                                    }
                                                  },
                                                  icon: Icon(Icons.do_not_disturb_on,color: Colors.amber,),
                                                ),
                                              ],
                                            )

                                          //

                                          : Container()
                                      : Container(),
                                      */
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('$index'),
                                IconButton(
                                  icon: Icon(Icons.delete_sweep,color: Colors.red,),
                                  onPressed: () {
                                    setState(() {
                                      print('index=$index');
                                      print(Typeslist[index]['type_doc_id'].toString());
                                      print(Typeslist[index]['type_id'].toString());
                                      print(Typeslist[index]['type_doc_id'].toString());
                                      deleteData(Typeslist[index]['type_doc_id'].toString());
                                      Typeslist.removeAt(index);

                                     // printlist();
                                      gettypetotalprice();
                                    });
                                  },

                                ),
                                IconButton(
                                  icon: Icon(Icons.more,color: Colors.red),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ],
                        ),

                      ],
                    )))),
      ),







    );
  }
*/
  deleteData(docId) {
    Firestore.instance
        .collection('Type')
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

  void filterSearchResults(String query) {
    dummySearchList=duplicateItems;
    if (query.isNotEmpty) {
      dummyListData.clear();
      dummySearchList.forEach((item) {
        if (item['type_name'].toUpperCase().contains(query.toUpperCase())
         ||
            item['type_name'].contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        Typeslist = dummyListData;

      });
      return;
    }
    else {
      setState(() {
        //Typeslist.clear();
        Typeslist=duplicateItems;
      });
    }
  }


  void filterSearchMonth(String query) {


    print(duplicateItems);
   dummySearchList=duplicateItems;
    if (query.isNotEmpty && query !='All' ) {
      var now = new DateTime.now();
      var st_month = new DateTime(now.year, int.parse(query), 01);
      var next_month = new DateTime(now.year, int.parse(query)+1, 01);
      int a =int.parse(query);
      if (a>=10)
      {
        query=query.toString();
      }
      else
      {
        query='${'0'}'+'${query}';
      }
      dummyListData.clear();
      dummySearchList.forEach((item) {
        DateTime parseDt = DateTime.parse(item['type_entry_date']);
        if (parseDt.compareTo(st_month)>=0 &&
            parseDt.compareTo(next_month)<0) {
          dummyListData.add(item);
        }
      });
      setState(() {
        Typeslist = dummyListData;
        gettypetotalprice();

      });
      return;
    }
    else {
      setState(() {

        Typeslist=duplicateItems;
      });

      }



  }


}


/*
class typelist extends StatefulWidget {
  final type_id;
  final type_name;
  final type_img;
  final type_desc;
  final type_price;
  final type_cat;
  final type_entry_date;
  final type_doc_id;
  typelist({
    this.type_id,
    this.type_name,
    this.type_img,
    this.type_desc,
    this.type_price,
    this.type_cat,
    this.type_entry_date,
    this.type_doc_id
  });

  @override
  _typelistState createState() => _typelistState();
}

class _typelistState extends State<typelist> {
  @override
  Widget build(BuildContext context) {
    return   Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0.0,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child:    InkWell(
        onTap: () {
          Navigator.of(context).push(
            new MaterialPageRoute(
                builder:  (BuildContext context) => new TypesDetails(

                  type_id:widget.type_id,
                  type_name: widget.type_name,
                  type_desc:widget.type_desc ,
                  type_img:widget.type_img ,
                  type_price:widget.type_price ,
                  type_cat:widget.type_cat ,
                  type_date: widget.type_entry_date,
                  type_doc_id: widget.type_doc_id,


                )
            ),
          );


/*
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                builder: (BuildContext context) => new CartesDetails()
              ),
              );
*/
        },
        child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Material(
                borderRadius: BorderRadius.circular(10.0),
                elevation: 20,
                child: Container(
                    padding: EdgeInsets.only(left: 15.0, right: 10.0),
                    width: MediaQuery.of(context).size.width - 20.0,
                    height: 130.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[

                            Container(
                              alignment: Alignment.topLeft,
                              height: MediaQuery.of(context).size.height/8,
                              width: MediaQuery.of(context).size.width/3.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  /*border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 2.0),
                                          */
                                  //shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,

                                      //image: NetworkImage(user_img),
                                      image: widget.type_img != null
                                          ? NetworkImage(widget.type_img)
                                          : AssetImage('images/chris.jpg')

                                    // image: AssetImage('images/chris.jpg')
                                  )),
                            ),

                            //  SizedBox(width: 10.0),

                            //   SizedBox(width: 20),
                          ],
                        ),
                        //name
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 0,
                                ),
                                Text(
                                  widget.type_name,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                SizedBox(width: 15.0),
                              ],
                            ),
                            SizedBox(height: 0.0),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Id: '+ widget.type_id ,
                                  /*
                                                + color,
                                            style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: Colors.grey),
                                      */
                                )
                                /*
                                            : OutlineButton(
                                          onPressed: () {},
                                          borderSide: BorderSide(
                                              color: Colors.red,
                                              width: 1.0,
                                              style: BorderStyle.solid),
                                          child: Center(
                                            child: Text('Find Similar',
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.0,
                                                    color: Colors.red)),
                                          ),
                                        ),
                                        */,

                                SizedBox(width: 10.0),
                                /* available
                                        ? Text(
                                      '\$' + price,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Color(0xFFFDD34A)),
                                    )
                                        : Container(),
                                    */
                              ],
                            ),
                            //SizedBox(height: 7.0),
                            //
                            Text(
                              'Price :\$ ' + widget.type_price,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Color(0xFFFDD34A)),
                            ),
                            Text(
                              widget.type_cat,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.black),
                            ),
                            Text(
                              widget.type_entry_date,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.black),
                            ),




                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            /* available
                                      ? Typeslist[index]
                                              ['type_selected'] //picked[i]
                                          ?
                                          //
                                          Column(
                                              children: <Widget>[
                                                SizedBox(height: 10,),
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      int temp = Typeslist[index]
                                                          ['type_num'];
                                                      temp = temp + 1;
                                                      Typeslist[index]
                                                          ['type_num'] = temp;
                                                      getTotalAmount2();
                                                      // Typeslist[index]['type_num']=temp;
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.add_circle,color: Colors.amber,
                                                    // size: 15,
                                                  ),
                                                ),
                                                Text(
                                                  'X ' +
                                                      Typeslist[index]['type_num']
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14.0,
                                                      color: Colors.grey),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    int temp = Typeslist[index]
                                                        ['type_num'];
                                                    if (temp > 1) {
                                                      setState(() {
                                                        int temp = Typeslist[index]
                                                            ['type_num'];
                                                        temp = temp - 1;
                                                        Typeslist[index]
                                                            ['type_num'] = temp;

                                                        getTotalAmount2();
                                                      });
                                                    }
                                                  },
                                                  icon: Icon(Icons.do_not_disturb_on,color: Colors.amber,),
                                                ),
                                              ],
                                            )

                                          //

                                          : Container()
                                      : Container(),
                                      */
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.delete_sweep,color: Colors.red,),
                                  onPressed: () {
                                      setState(() {
                                        ;
                                              deleteData(widget.type_doc_id);
                                            });
                                  },

                                ),
                                IconButton(
                                  icon: Icon(Icons.more,color: Colors.red),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ],
                        ),

                      ],
                    )))),
      ),







    );
  }

  deleteData(docId) {
    Firestore.instance
        .collection('Type')
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}

*/

