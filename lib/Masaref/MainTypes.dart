import 'package:flutter/material.dart';
import './TypeMain.dart';
import './TypeReport.dart';
import './TypeReportTotalPrice.dart';
import './Profile.dart';
//import 'package:money5_ios_android/Masaref/ProductSearch.dart';
import 'package:money5_ios_android/colors.dart';

class MainTypes extends StatefulWidget {
  static String tag = 'ana-sayfa';
  @override
  _MainTypesState createState() => _MainTypesState();
}

class _MainTypesState extends State<MainTypes> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          children: <Widget>[
            new TypeMain(),
            new TypeReport(),
            new TypeReportTotalPrice(),
            new Profile(),
          ],
        ),
        bottomNavigationBar: new TabBar(
          indicatorWeight: 2.0,
          tabs: [
            Tab(icon: Icon(Icons.event_seat, color: Colors.amber)),
            Tab(icon: Icon(Icons.search, color: Colors.amber)),
            Tab(icon: Icon(Icons.shopping_cart, color: Colors.amber)),
            Tab(icon: Icon(Icons.person_outline, color: Colors.amber)),
          ],
          labelColor: Colors.grey,
          unselectedLabelColor: Colors.white30,
          indicatorColor: Colors.yellow,
        ),
      ),
    );
  }
}
