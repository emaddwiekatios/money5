import 'package:flutter/material.dart';

//import './Types.dart';
//import './Top_Bar.dart';
//import 'package:money5_ios_android/Category/Categoryadd.dart';
import 'package:money5_ios_android/colors.dart';
//import 'package:money5_ios_android/Products/ProductsAdd.dart';
//import 'package:money5_ios_android/home.dart';
//import 'package:firebasetwo/Home2.dart';
import './TypesADD.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import "package:collection/collection.dart";
import './TypesDetails.dart';
import 'package:grouped_list/grouped_list.dart';
import './TypesDetails.dart';

class TypeReportCategoryDetails extends StatefulWidget {
  String type_cat;
  TypeReportCategoryDetails(this.type_cat);
  @override
  _TypeReportCategoryDetailsState createState() => _TypeReportCategoryDetailsState();
}




class _TypeReportCategoryDetailsState extends State<TypeReportCategoryDetails> {
  final RefreshController _refreshController = RefreshController();


  var prod_max;
  QuerySnapshot cars;
  double sumprice = 0.0;

  void initState() {
    getData().then((results) {
      setState(() {
        cars = results;

        printlist();
      });
    });
    setState(() {
      //  printlist();
    });

    //   print("after init");

    super.initState();
  }


  var Typeslist
  = [
    {
      "type_id": "Weman Dress",
      "type_name": "Weman Dress",
      "type_desc": "Weman Dress",
      "type_price": "7.0",

      "type_entry_date": 'Weman Dress',

      "type_cat": "Weman Dress",
      "type_img": 'https://firebasestorage.googleapis.com/v0/b/fir-3af1c.appspot.com/o/t-shirt.jpg?alt=media&token=18e2c978-8386-4aaa-880c-dc8d0a5252eb',
      "type_doc_id": '1'
    }
  ];


  var list
  = [
    {
      "type_id": "Weman Dress",
      "type_name": "Weman Dress",
      "type_desc": "Weman Dress",
      "type_price": "7.0",

      "type_entry_date": 'Weman Dress',

      "type_cat": "Weman Dress",
      "type_img": 'https://firebasestorage.googleapis.com/v0/b/fir-3af1c.appspot.com/o/t-shirt.jpg?alt=media&token=18e2c978-8386-4aaa-880c-dc8d0a5252eb',
      "type_doc_id": '1',
      "flg": '0'
    }
  ];
  var dummySearchList
  = [
    {
      "type_id": "Weman Dress",
      "type_name": "Weman Dress",
      "type_desc": "Weman Dress",
      "type_price": "7.0",

      "type_entry_date": 'Weman Dress',

      "type_cat": "Weman Dress",
      "type_img": 'https://firebasestorage.googleapis.com/v0/b/fir-3af1c.appspot.com/o/t-shirt.jpg?alt=media&token=18e2c978-8386-4aaa-880c-dc8d0a5252eb',
      "type_doc_id": '1'
    }
  ];

  var duplicateItems
  = [
    {
      "type_id": "Weman Dress",
      "type_name": "Weman Dress",
      "type_desc": "Weman Dress",
      "type_price": "7.0",

      "type_entry_date": 'Weman Dress',

      "type_cat": "Weman Dress",
      "type_img": 'https://firebasestorage.googleapis.com/v0/b/fir-3af1c.appspot.com/o/t-shirt.jpg?alt=media&token=18e2c978-8386-4aaa-880c-dc8d0a5252eb',
      "type_doc_id": '1'
    }
  ];

  var dummyListData
  = [
    {
      "type_id": "Weman Dress",
      "type_name": "Weman Dress",
      "type_desc": "Weman Dress",
      "type_price": "7.0",

      "type_entry_date": 'Weman Dress',

      "type_cat": "Weman Dress",
      "type_img": 'https://firebasestorage.googleapis.com/v0/b/fir-3af1c.appspot.com/o/t-shirt.jpg?alt=media&token=18e2c978-8386-4aaa-880c-dc8d0a5252eb',
      "type_doc_id": '1'
    }
  ];


  TextEditingController contsearch = new TextEditingController();

  void gettypetotalprice() {
    sumprice = 0.0;
    int len = Typeslist.length;
    double loc_sum = 0.0;
    for (int i = 0; i < len; i++) {
      print(Typeslist[i]['type_price']);

      loc_sum = loc_sum + double.parse(Typeslist[i]['type_price']);
    }
    setState(() {
      sumprice = loc_sum;
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
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 3.5,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.5,
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
                .height / 25,
            left: MediaQuery
                .of(context)
                .size
                .width / 2 - 75,
            child: Text(
              '${widget.type_cat}',
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
            ),
          ),
          //menu
          Positioned(
            top: MediaQuery
                .of(context)
                .size
                .height / 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                print('inside button');
                // _scaffoldKey.currentState.openDrawer();
                Navigator.pop(context);
               // Navigator.pushNamed(context, "/main_page");
              },
            ),
          ),
          Positioned(
            top: MediaQuery
                .of(context)
                .size
                .height / 40,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print('inside button');
                // _scaffoldKey.currentState.openDrawer();

                Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new TypesADD(prod_max)),
                );
              },
            ),
          ),
//list
          Positioned(
            top: MediaQuery
                .of(context)
                .size
                .height / 6,
            left: 5,
            right: 5,
            bottom:50,
            child: Container(
              //color: Colors.red,
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 30,
              width: MediaQuery
                  .of(context)
                  .size
                  .width ,//- 10,
              child: GroupedListView(
                elements: Typeslist,
                padding: EdgeInsets.all(5),
                groupBy: (element) =>
                element['type_cat'],
                // separator: Container(height: 10,width: 400,color: Colors.blue,),

                itemBuilder: (context, element) {
                  return Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 4.0),

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),

                    child: Container(

                        width: MediaQuery
                            .of(context)
                            .size
                            .width -10,
                        child: ListTile(
                          contentPadding:
                          EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          title: Text('Type :${element['type_name']}',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          trailing: Text('Price :${element['type_price']}',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          subtitle: Text('Date :${element['type_entry_date']}',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),


                        )
/*
                            Text('Type :${element['type_name']} '
                                '\nPrice:${element['type_price']}'
                                '\nDate:${element['type_entry_date']}'),
                    */
                    ),
                  );

                  /*
                          Container(

                              height: 100,
                              width: 100,
                              child:Card(
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            color:Colors.amber,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))
                                        ),
                                        height: 35,
                                        width: 200,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:Center(child: Text('Type cat :${Typeslist[index]['type_cat']}')),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Align( alignment: Alignment.topLeft,
                                            child: Text('Date :${Typeslist[index]['type_cat']}')),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text('Customer :${Typeslist[index]['type_cat']}'),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text('Disc :${Typeslist[index]['type_cat']}'),
                                      ),


                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text('Total :${Typeslist[index]['type_cat']}'),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text('Payment :${Typeslist[index]['type_cat']}'),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color:Colors.grey[200],
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))
                                        ),
                                        height: 35,
                                        width: 200,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            IconButton(onPressed: (){
                                              setState(() {
                                              //  delete_invoice(int.parse(Typeslist[index].InvoiceNo));
                                                Typeslist.removeAt(index);
                                                print('record deleted');
                                              });

                                            },
                                                icon:Icon(Icons.delete, color: Colors.green)),
                                            IconButton(onPressed: null,
                                                icon:Icon(Icons.edit, color: Colors.green)),
                                            IconButton(onPressed: null,
                                                icon:Icon(Icons.details, color: Colors.green)),

                                          ],
                                        ),


                                      ),

                                    ],
                                  )

                              )
                          );
                          */


                },
                groupSeparatorBuilder: _buildGroupSeparator,
              ),

              /*  GroupedListView<dynamic, String>(
                groupBy: (element) => element['group'],
                elements: _elements,
                sort: true,
                groupSeparatorBuilder: (String value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ),
                itemBuilder: (c, element) {
                  return Card(
                    elevation: 0.5,
                    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      child: ListTile(
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        leading: Icon(Icons.account_circle),
                        title: Text(element['name']),
                        trailing: Icon(Icons.arrow_forward),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
             */
              /*GridView.builder(

                  itemCount: Typeslist.length,
                  gridDelegate:
                  new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: ()
                      {
                        print(Typeslist[index]['type_cat']);
                      },
                      child: (
                          Container(

                              height: 100,
                              width: 100,
                              child:Card(
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            color:Colors.amber,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))
                                        ),
                                        height: 35,
                                        width: 200,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:Center(child: Text('Type cat :${Typeslist[index]['type_cat']}')),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Align( alignment: Alignment.topLeft,
                                            child: Text('Date :${Typeslist[index]['type_cat']}')),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text('Customer :${Typeslist[index]['type_cat']}'),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text('Disc :${Typeslist[index]['type_cat']}'),
                                      ),


                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text('Total :${Typeslist[index]['type_cat']}'),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text('Payment :${Typeslist[index]['type_cat']}'),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color:Colors.grey[200],
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))
                                        ),
                                        height: 35,
                                        width: 200,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            IconButton(onPressed: (){
                                              setState(() {
                                              //  delete_invoice(int.parse(Typeslist[index].InvoiceNo));
                                                Typeslist.removeAt(index);
                                                print('record deleted');
                                              });

                                            },
                                                icon:Icon(Icons.delete, color: Colors.green)),
                                            IconButton(onPressed: null,
                                                icon:Icon(Icons.edit, color: Colors.green)),
                                            IconButton(onPressed: null,
                                                icon:Icon(Icons.details, color: Colors.green)),

                                          ],
                                        ),


                                      ),

                                    ],
                                  )

                              )
                          )),
                    );


                  }

              )*/
              /*TypeslistView.builder(
                  itemCount: Typeslist.length,
                  itemBuilder: (BuildContext context,int index){
                    return build_item(context,index);
                  }

              ),*/
            ),
          ),


          //search
          Positioned(
            top: MediaQuery
                .of(context)
                .size
                .height / 10,
            left: 10,
            right: 10,

            // left: MediaQuery.of(context).size.width / 2 - 70,
            child:

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
                      print('inside change${contsearch}');

                      print('inside change$value');
                      filterSearchResults(value);
                      gettypetotalprice();
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search,
                            color: Color(getColorHexFromStr('#FEE16D')),
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
                            fontFamily: 'Quicksand')
                    )
                ),
              ),
            ),

          ),


          Positioned(
            bottom: 0,
            child: Material(
                elevation: 7.0,
                color: Colors.white,
                child: Container(
                    height: 50.0,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('Total: \$' + sumprice.toString()),
                        SizedBox(width: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {
                              getlisttypecat();
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
          )

        ],
      ),


      /*
      floatingActionButton: new  FloatingActionButton(
        onPressed: ()
        {
        // print('Types().typelistmax =${Types().typelistmax}');
          Navigator.of(context).push(
            new MaterialPageRoute(
                builder:  (BuildContext context) => new TypesADD(prod_max)),
          );



          /*  Firestore.instance.collection("cars").document().setData({
            'carname':'bmw1',
             'color':'red2'
          });
          */
        },
        tooltip: 'Increement',
        child: new Icon(Icons.add),
      ),

   */);
  }


  ///
  getData() async {
    //return await Firestore.instance.collection("Gym-Types").snapshots();


    return await Firestore.instance.collection('Type').getDocuments();
  }


  printlist() {
    if (cars != null) {
      for (var i = 0; i < cars.documents.length; i++) {
        var temp_date;
        if (cars.docs[i].data()['type_entry_date'] != null) {
          temp_date =
              cars.docs[i].data()['type_entry_date'].toString().substring(
                  0, 10);
        }
        else {
          temp_date = cars.docs[i].data()['type_entry_date'].toString();
        }
        // DateTime todayDate = DateTime.parse(cars.docs[i].data()['type_entry_date']);
        //print(todayDate);
        //var date_temp=(formatDate(todayDate, [yyyy, '/', mm, '/', dd])).toString();

        // print(cars.documents[i].documentID);
        //print(date_temp);
        if(cars.docs[i].data()['type_cat']==widget.type_cat) {
          Typeslist.add(
              {
                "type_id": cars.docs[i].data()['type_id'].toString(),
                "type_name": cars.docs[i].data()['type_name'],
                "type_desc": cars.docs[i].data()['type_desc'],
                "type_price": cars.docs[i].data()['type_price'],
                "type_cat": cars.docs[i].data()['type_cat'],
                "type_entry_date": temp_date,
                //"type_entry_date":cars.docs[i].data()['type_entry_date'].toString(),
                "type_img": cars.docs[i].data()['type_img'],
                "type_doc_id": cars.documents[i].documentID,
              });
              }
      }
      Typeslist.removeAt(0);
      //print("the value${Typeslist}");
    }

    else {
      print("error");
    }

    Typeslist.sort((a, b) =>
        int.parse(a['type_id']).compareTo(int.parse(b['type_id'])));
    var array_len = Typeslist.length;
    setState(() {
      prod_max =
      ((int.parse(Typeslist[array_len - 1]['type_id']) + 1).toString());
      Typeslist.sort((b, a) =>
          int.parse(a['type_id']).compareTo(int.parse(b['type_id'])));

      duplicateItems = Typeslist;
    });


    setState(() {
      duplicateItems = Typeslist;
      list=Typeslist;

      var groupByData = groupBy(Typeslist, (obj) => obj['type_cat']);
      //var newMap = groupBy(data, (obj) => obj['release_date'] == "10/01/2019");
      print(groupByData);
    });

   // filterSearchResults(widget.type_cat);
    gettypetotalprice();
  }


  Widget build_item(BuildContext context, int index) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            new MaterialPageRoute(
                builder: (BuildContext context) =>
                new TypesDetails(

                  type_id: Typeslist[index]['type_id'],
                  type_name: Typeslist[index]['type_name'],
                  type_desc: Typeslist[index]['type_desc'],
                  type_img: Typeslist[index]['type_img'],
                  type_price: Typeslist[index]['type_price'],
                  type_cat: Typeslist[index]['type_cat'],
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 20.0,
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
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 8,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 3.5,
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
                                      image: Typeslist[index]['type_img']
                                          .toString() != null
                                          ? NetworkImage(
                                          Typeslist[index]['type_img'])
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
                                  'Id: ' + Typeslist[index]['type_id'],
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
                              Typeslist[index]['type_entry_date'],
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
                                  icon: Icon(
                                    Icons.delete_sweep, color: Colors.red,),
                                  onPressed: () {
                                    setState(() {
                                      print('index=$index');
                                      print(Typeslist[index]['type_doc_id']
                                          .toString());
                                      print(Typeslist[index]['type_id']
                                          .toString());
                                      print(Typeslist[index]['type_doc_id']
                                          .toString());
                                      deleteData(Typeslist[index]['type_doc_id']
                                          .toString());
                                      Typeslist.removeAt(index);

                                      // printlist();
                                      gettypetotalprice();
                                    });
                                  },

                                ),
                                IconButton(
                                  icon: Icon(Icons.more, color: Colors.red),
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

  void filterSearchResults(String query) {
    print(duplicateItems);
    // duplicateItems.removeAt(0);
    //dummyListData.removeAt(0);
    //Typeslist.clear();
    // List<Clients> dummySearchList = List<Clients>();
    dummySearchList = duplicateItems;
    if (query.isNotEmpty) {
      print('inside if');
      dummyListData.clear();
      // List<Clients> dummyListData = List<Clients>();
      dummySearchList.forEach((item) {
        //print(item['type_name']);
        if (item['type_name'].toUpperCase().contains(query.toUpperCase())
            ||
            item['type_name'].contains(query)) {
        //  print('inside if ${item['type_name']}');
          dummyListData.add(item);
        }
      });
      setState(() {
        //  Typeslist=null;
        Typeslist = dummyListData;
      });
      print('the list search${Typeslist}');
      return;
    }
    else {
      setState(() {
        //Typeslist.clear();
        Typeslist = duplicateItems;
      });
    }

    print('the list search${Typeslist}');
  }

  void getlisttypecat() {
    List<typetotal> totaltype;
    typetotal onetotal;

    double sum1=0;
    int cnt=0;
    String type_cat;
    for (int t =0;t<list.length;t++)
    {
      list[t]['flg']='1';

    }
    print(list);
    for (int i =0 ;i<list.length;i++)
    {
      sum1=0;
      cnt=0;
      for (int c=0;c<list.length;c++)
      {
        if(list[c]['type_cat']==list[i]['type_cat'] && list[c]['flg']=='1' )
        {
          // print(list[c]['flg']);
          list[c]['flg']='0';
          cnt=cnt+1;
          sum1=sum1+double.parse(list[c]['type_price']);
        }

      }


      if(sum1>0.0) {
        print(Typeslist[i]['type_cat']);
        print(sum1);

        print(cnt);
      }
    }

  }

}


class typetotal
{
  String type_cat;
  double type_total_price;
  typetotal(this.type_cat,this.type_total_price);
}

Widget _buildGroupSeparator(dynamic groupByValue) {
  //return Text('$groupByValue');

  return  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
        child: Text(
          groupByValue,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
  );

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


/*
class Type {
 List<Address> type_cat;

  Type({
    this.type_cat,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return new Type(
        type_cat: json['type_cat'].map((value) => new Address.fromJson(value)).toList()
    );
  }
}

class Address {
  String address, city, state, country, zipcode;

  Address({
    this.address,
    this.city,
    this.state,
    this.country,
    this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return new Address(
        address: json['address'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        zipcode: json['zipcode']);
  }
}
*/