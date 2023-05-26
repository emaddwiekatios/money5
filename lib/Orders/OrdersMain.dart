//import 'dart:html';

import 'package:money5_ios_android/Category/CategoryMain2.dart';
import 'package:money5_ios_android/Products/ProductsEditNew.dart';
import 'package:flutter/material.dart';
import 'package:money5_ios_android/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money5_ios_android/Orders/OrdersAdd.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:money5_ios_android/AppLocalizations.dart';

import 'dart:async';
//import 'ProductsDetails.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'dart:io' as plat;

import 'OrdersDetails.dart';

class OrdersMain extends StatefulWidget {
  @override
  _OrdersMainState createState() => _OrdersMainState();
}

class _OrdersMainState extends State<OrdersMain>
    with SingleTickerProviderStateMixin {
  String Username;
  var Orders_max;
  QuerySnapshot cars;
  double sumprice = 0.0;

  var refreshKey = GlobalKey<RefreshIndicatorState>();
  int tabIndex = 0;
  TabController tabController;

  String title = "Home";

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = new TabController(length: 4, vsync: this);

    getUser().then((user) {
      if (user != null) {
        setState(() {
          Username = user.email;
          print('Username0= ${Username}');
          call_get_data();
          Orderslist.removeAt(0);
        });
      }
      ;
    });

    // setdata('ALL');
  }

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    user = await _auth.currentUser;

    return user;
    //return user.email;
  }

  Map<String, Color> colorCode = {
    "Initial": Colors.grey[200],
    "Rejected": Colors.red,
    "Accept": Colors.amberAccent,
    "Inprogress": Colors.lightGreenAccent,
    "Complete": Colors.lightGreen
  };

// List<String> list_cat = ['Initial','Accept','Inprogress','Complete'];
  call_get_data() async {
    getData().then((results) {
      setState(() {
        cars = results;

        printlist();
      });
    });
  }

  var Orderslist = [
    {
      "Order_id": " Dress",
      "Order_name": " Dress",
      "Order_desc": " Dress",
      "Order_price": "7.0",
      "Order_date": " Dress",
      "Order_Modify_date": "Order_Modify_date",
      "Order_Fav": 'True',
      "Order_cat": " Dress",
      "Order_img":
          'https://firebasestorage.googleapis.com/v0/b/fir-3af1c.appspot.com/o/t-shirt.jpg?alt=media&token=18e2c978-8386-4aaa-880c-dc8d0a5252eb',
      'Order_status': 'Initail'
    }
  ];

  var list = [
    {
      "Order_id": " Dress",
      "Order_name": " Dress",
      "Order_desc": " Dress",
      "Order_price": "7.0",
      "Order_date": " Dress",
      "Order_Modify_date": "Order_Modify_date",
      "Order_Fav": 'True',
      "Order_cat": " Dress",
      "Order_img":
          'https://firebasestorage.googleapis.com/v0/b/fir-3af1c.appspot.com/o/t-shirt.jpg?alt=media&token=18e2c978-8386-4aaa-880c-dc8d0a5252eb',
      'Order_status': 'Initail'
    }
  ];
  var dummySearchList = [
    {
      "Order_id": " Dress",
      "Order_name": " Dress",
      "Order_desc": " Dress",
      "Order_price": "7.0",
      "Order_date": " Dress",
      "Order_Modify_date": "Order_Modify_date",
      "Order_Fav": 'True',
      "Order_cat": " Dress",
      "Order_img":
          'https://firebasestorage.googleapis.com/v0/b/fir-3af1c.appspot.com/o/t-shirt.jpg?alt=media&token=18e2c978-8386-4aaa-880c-dc8d0a5252eb',
      'Order_status': 'Initail'
    }
  ];
  var duplicateItems = [
    {
      "Order_id": " Dress",
      "Order_name": " Dress",
      "Order_desc": " Dress",
      "Order_price": "7.0",
      "Order_date": " Dress",
      "Order_Modify_date": "Order_Modify_date",
      "Order_Fav": 'True',
      "Order_cat": " Dress",
      "Order_img":
          'https://firebasestorage.googleapis.com/v0/b/fir-3af1c.appspot.com/o/t-shirt.jpg?alt=media&token=18e2c978-8386-4aaa-880c-dc8d0a5252eb',
      'Order_status': 'Initail'
    }
  ];

  var dummyListData = [
    {
      "Order_id": " Dress",
      "Order_name": " Dress",
      "Order_desc": " Dress",
      "Order_price": "7.0",
      "Order_date": " Dress",
      "Order_Modify_date": "Order_Modify_date",
      "Order_Fav": 'True',
      "Order_cat": " Dress",
      "Order_img":
          'https://firebasestorage.googleapis.com/v0/b/fir-3af1c.appspot.com/o/t-shirt.jpg?alt=media&token=18e2c978-8386-4aaa-880c-dc8d0a5252eb',
      'Order_status': 'Initail'
    }
  ];

  TextEditingController contsearch = new TextEditingController();

  void gettypetotalprice() {
    sumprice = 0.0;
    int len = Orderslist.length;
    double loc_sum = 0.0;
    for (int i = 0; i < len; i++) {
      print(Orderslist[i]['Order_price']);

      loc_sum = loc_sum + double.parse(Orderslist[i]['Order_price']);
    }
    setState(() {
      sumprice = loc_sum;
    });
  }

  final _scrffordkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var pheight = MediaQuery.of(context).size.height;
    var pwidth = MediaQuery.of(context).size.width;

    var appLanguage = Provider.of<AppLanguage>(context);
    return SafeArea(
      child: Scaffold(
        key: _scrffordkey,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
//background
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  //borderRaOdius: BorderRadius.circular(200),
                  color: pcolor2,
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
                  color: pcolor3, // Color(getColorHexFromStr('#FDD110')),
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
                  color: pcolor1, //red2,
                  //      )
                ),
              ),
            ),
            Positioned(
              bottom: -40,
              left: -30,
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: pcolor4, //red2,
                  //),
                ),
              ),
            ),
//title
            Positioned(
              top: MediaQuery.of(context).size.height / 22,
              left: MediaQuery.of(context).size.width / 2 - 40,
              child: Text(
                AppLocalizations.of(context).translate('Orders'),
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
            ),
            //menu
            Positioned(
              top: pheight / 30,
              left: pwidth / 20,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
                onPressed: () {
                  print('inside menu');
                 // Navigator.pop(context);
                  // _scrffordkey.currentState.openDrawer();
                  //   FirebaseAuth.instance.signOut();
                   Navigator.pushReplacementNamed(context, "/ProductsMain");
                },
              ),
            ),
            Positioned(
              top: pheight / 30,
              right: pwidth / 20,
              child: IconButton(
                icon: Icon(Icons.add, size: 30),
                onPressed: () {
                  // _scaffoldKey.currentState.openDrawer();

                  Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new OrdersAdd(Order_max: Orders_max)),
                  );
                },
              ),
            ),
//list
            Positioned(
              top: MediaQuery.of(context).size.height / 5.5,
              left: 5,
              right: 5,
              bottom: 10,
              child: DefaultTabController(
                length: 4,
                child: new Scaffold(
                  appBar: new PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: new Container(
                      color: pcolor4,
                      child: new SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // new Expanded(child: new Container(height: 5,)),
                            new TabBar(

                              controller: tabController,
                              labelColor: Colors.redAccent,
                              unselectedLabelColor: Colors.white,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: Colors.white),

                              tabs: [
                                new Tab(
                                    icon: IconButton(
                                    icon: Text('All',style: TextStyle(fontSize: 15),

                                  ),
                                  onPressed: () {
                                    setdata2('','');
                                    setState(() {
                                      tabController.index=0;
                                    });
                                  },
                                )),
                                IconButton(
                                  icon: Text('Init',style: TextStyle(fontSize: 15),),
                                  onPressed: () {
                                    setdata2('Initial','X');
                                    setState(() {
                                      tabController.index=1;
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Text('Acc',style: TextStyle(fontSize: 15),),
                                  onPressed: () {
                                    setdata2('Accept','Inprogress');
                                    setState(() {
                                      tabController.index=2;
                                    });

                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 100,
                                  child: IconButton(
                                    color: Colors.deepOrange,
                                    icon: Text('Done',style: TextStyle(fontSize: 15),),
                                    onPressed: () {
                                      setdata2('Complete','Rejected');
                                      setState(() {
                                        tabController.index=3;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height - 30,
                        width: MediaQuery.of(context).size.width - 30,
                        child: _BuildList('All'),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 30,
                        width: MediaQuery.of(context).size.width - 30,
                        child: _BuildList('Initial'),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 30,
                        width: MediaQuery.of(context).size.width - 30,
                        child: _BuildList('Accept'),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 30,
                        width: MediaQuery.of(context).size.width - 30,
                        child: _BuildList('Rejected'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //search
            Positioned(
              top: MediaQuery.of(context).size.height / 11,
              left: 10,
              right: 10,

              // left: MediaQuery.of(context).size.width / 2 - 70,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 30,
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
                          prefixIcon:
                              Icon(Icons.search, color: pcolor2, size: 30.0),
                          suffixIcon: IconButton(
                              icon:
                                  Icon(Icons.cancel, color: pcolor2, size: 30.0),
                              onPressed: () {
                                print('inside clear');
                                contsearch.clear();
                                contsearch.text = null;
                                filterSearchResults(contsearch.text);
                                gettypetotalprice();
                              }),
                          contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                          hintText:
                              AppLocalizations.of(context).translate('Search'),
                          hintStyle: TextStyle(
                              color: Colors.grey, fontFamily: 'Quicksand'))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _BuildList(String pStatus) {
    return //Orderslist.length > 0
        //    ?
        RefreshIndicator(
            // key: refreshKey,
            child: ListView.builder(
                itemCount: Orderslist.length,
                itemBuilder: (BuildContext context, int index) {
                  return build_item(context, index);
                }),
            onRefresh: refreshList);
    // : Center(child: CircularProgressIndicator());
  }

  ///

  Future<Null> refreshList() async {
    setState(() {
      tabController.index=0;
    });
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      getUser().then((user) {
        if (user != null) {
          setState(() {
            //Username = user.email;
            // print('Username0= ${Username}');
            call_get_data();
          });
        }
        ;
      });
    });

    return null;
  }

  getData() async {
    return await FirebaseFirestore.instance
        .collection('Orders')
        //  .where("Order_user", isEqualTo:Username.toString())
        .get();
  }

  printlist() {
    if (cars != null) {
      Orderslist.clear();
      for (var i = 0; i < cars.docs.length; i++) {
       // print(cars.docs[i].data()['Order_status']);
        Orderslist.add({
          "Order_id": cars.docs[i].data()['Order_id'].toString(),
          "Order_name": cars.docs[i].data()['Order_name'],
          "Order_desc": cars.docs[i].data()['Order_desc'],
          "Order_price": cars.docs[i].data()['Order_price'],
          "Order_fav": cars.docs[i].data()['rod_fav'].toString(),
          "Order_cat": cars.docs[i].data()['Order_cat'],
          "Order_date": cars.docs[i].data()['Order_entry_date'].toString(),
          "Order_Modify_date": cars.docs[i].data()['Order_date'].toString(),
          "Order_img": cars.docs[i].data()['Order_img'],
          "Order_doc_id": cars.docs[i].id,
          "Order_status": cars.docs[i].data()['Order_status']
        });
      }

      Orderslist.sort(
              (a, b) => int.parse(a['Order_id']).compareTo(int.parse(b['Order_id'])));
      var array_len = Orderslist.length;
      setState(() {
        Orders_max = ((int.parse(Orderslist[array_len - 1]['Order_id']) + 1)
            .toString());
        Orderslist.sort((b, a) =>
            int.parse(a['Order_id']).compareTo(int.parse(b['Order_id']))
    );

        duplicateItems = Orderslist;
      });

      duplicateItems = Orderslist;
      Orderslist = Orderslist;
    } else {
      print("error");
    }
  }

  Widget build_item(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new OrdersDetails(
                          Order_id: Orderslist[index]['Order_id'],
                          Order_name: Orderslist[index]['Order_name'],
                          Order_desc: Orderslist[index]['Order_desc'],
                          Order_img: Orderslist[index]['Order_img'],
                          Order_price: Orderslist[index]['Order_price'],
                          Order_cat: Orderslist[index]['Order_cat'],
                          Order_status: Orderslist[index]['Order_status'],
                          Order_date: Orderslist[index]['Order_date'],
                          Order_Modify_date: Orderslist[index]
                              ['Order_Modify_date'],
                          Order_doc_id:
                              Orderslist[index]['Order_doc_id'].toString(),
                        )),
              );
            },
            child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 20,
                    child: Container(
                        padding: EdgeInsets.only(left: 10.0, right: 0.0),
                        width: MediaQuery.of(context).size.width - 20.0,
                        height: MediaQuery.of(context).size.height / 5.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
//                            Row(
//                              children: <Widget>[
////                                Container(
////                                  alignment: Alignment.topLeft,
////                                  height:
////                                  MediaQuery.of(context).size.height / 6.5,
////                                  width:
////                                  MediaQuery.of(context).size.width / 3.5,
////                                  decoration: BoxDecoration(
////                                      borderRadius: BorderRadius.circular(10.0),
////                                      image: DecorationImage(
////                                          fit: BoxFit.cover,
////
////                                          image: NetworkImage(user_img),
////                                          image: Orderslist[index]
////                                          ['Order_img']
////                                              .toString() !=
////                                              null
////                                              ? NetworkImage(
////                                              Orderslist[index]
////                                              ['Order_img'])
////                                              : AssetImage('images/chris.jpg')
////
////                                        // image: AssetImage('images/chris.jpg')
////                                      )),
////                                ),
//
//                                //  SizedBox(width: 10.0),
//
//                                //   SizedBox(width: 20),
//                              ],
//                            ),
                              //SizedBox(width: 0),
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
                                        'Name: ' +
                                            Orderslist[index]['Order_name'],
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(width: 15.0),
                                    ],
                                  ),
                                  SizedBox(height: 0.0),
                                  Text(
                                    'Desc : ' + Orderslist[index]['Order_desc'],
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Id: ' + Orderslist[index]['Order_id'],
                                      ),
                                      SizedBox(width: 10.0),
                                    ],
                                  ),
                                  //SizedBox(height: 7.0),
                                  //
                                  Text(
                                    'Cost :\$ ' +
                                        Orderslist[index]['Order_price'],
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                        color: Color(0xFFFDD34A)),
                                  ),
//                                Text(
//                                  Orderslist[index]['Order_cat'],
//                                  style: TextStyle(
//                                      fontFamily: 'Montserrat',
//                                      //fontWeight: FontWeight.bold,
//                                      fontSize: 18.0,
//                                      color: Colors.black),
//                                ),
                                  Text(
                                    Orderslist[index]['Order_date'].length > 19
                                        ? Orderslist[index]['Order_date']
                                            .substring(0, 19)
                                        : Orderslist[index]['Order_date'],
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: colorCode[
                                            '${Orderslist[index]['Order_status'].toString()}'],
                                        //  color:(Orderslist[index]['Order_status'].toString() == 'Accept' ?  Colors.orangeAccent: Colors.lightGreenAccent),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Center(
                                        child: Text(
                                            Orderslist[index]['Order_status'],
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold))),
                                  ),
                            Text(
                                Orderslist[index]['Order_cat'],
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10,),
                                  Text('$index'),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      IconButton(
                                        icon: Icon(
                                          Icons.delete_sweep,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            print(
                                                Orderslist[index]['Order_id']);
                                            deleteData(
                                                Orderslist[index]
                                                        ['Order_doc_id']
                                                    .toString(),
                                                null);
                                            Orderslist.removeAt(index);
                                            gettypetotalprice();
                                            call_get_data();
                                          });
                                        },
                                      ),
                                      IconButton(
                                        icon:
                                            Icon(Icons.edit, color: Colors.red),
                                        onPressed: () {
                                          print(Orderslist);

//                                        Navigator.of(context).push(
//                                          new MaterialPageRoute(
//                                              builder: (BuildContext context) =>
//                                              new ProductsEditNew(
//                                                Orders_id: Orderslist[index]['Order_id'],
//                                                Orders_name: Orderslist[index]['Order_name'],
//                                                Orders_desc: Orderslist[index]['Order_desc'],
//                                                Orders_img: Orderslist[index]['Order_img'],
//                                                Orders_price: Orderslist[index]['Order_price'],
//                                                Orders_cat: Orderslist[index]['Order_cat'],
//                                                Orders_date: Orderslist[index]['Order_date'],
//                                                Orders_doc_id: Orderslist[index]['Order_doc_id'].toString(),
//
//                                              )),);
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )))),
          ),
        ),
        Positioned(
          top: 15,
          right: 10,
          child: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        )
      ],
    );
  }

  deleteData(docId, imageurl) async {
    if (imageurl != null) {
      StorageReference storageReference =
          await FirebaseStorage.instance.getReferenceFromUrl(imageurl);

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
  }

  Future<User> getUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return await _auth.currentUser;
  }

  void filterSearchResults(String query) {


    setState(() {
      tabController.index=0;
    });
      dummySearchList = duplicateItems;

    if (query.isNotEmpty) {
      print('inside if');
      dummyListData.clear();
      // List<Clients> dummyListData = List<Clients>();
      dummySearchList.forEach((item) {
        //print(item['Order_name']);
        if (item['Order_name'].toUpperCase().contains(query.toUpperCase()) ||
            item['Order_name'].contains(query)) {
          print('inside if ${item['Order_name']}');
          dummyListData.add(item);
        }
      });
      setState(() {
        //  Orderslist=null;
        Orderslist = dummyListData;
      });
      print('the list search${Orderslist}');
      return;
    }

    else {
      setState(() {
        //Orderslist.clear();
        Orderslist = duplicateItems;
      });
    }

    print('the list search${Orderslist}');
  }

  void setdata2(String query,String query2) {
    print(duplicateItems);
    dummySearchList = duplicateItems;
    if (query.isNotEmpty) {
      print('inside if');
      dummyListData.clear();
      // List<Clients> dummyListData = List<Clients>();
      dummySearchList.forEach((item) {
        //print(item['Order_name']);
        if (item['Order_status'].toUpperCase() == query.toUpperCase()
         || item['Order_status'].toUpperCase() == query2.toUpperCase()) {
          dummyListData.add(item);
        }
      });
      setState(() {
        //  Orderslist=null;
        Orderslist = dummyListData;
      });
      print('the list search${Orderslist}');
      return;
    } else {
      setState(() {
        //Orderslist.clear();
        Orderslist = duplicateItems;
      });
    }

    print('the list search${Orderslist}');
  }
}
