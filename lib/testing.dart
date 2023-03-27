import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}
QuerySnapshot cars;
class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('test'),),
      body: RaisedButton(onPressed: (){
        _onPressedall();
      }),
    );
  }


//    void _onPressedall() async {
//    var order = FirebaseFirestore.instance.collection('users').get().then((value){
//      print(value.docs);
//    });
//
//      FirebaseFirestore.instance
//          .collection('users')
//          .doc('1')
//          .collection('tokens')
//          .get().then((value) {
//        print('inside for each =${value.docs}');
////        value.docs.forEach((element) {
////        print('inside for each iiiiii');
////        print(element.data());
////      });
//        //   });
//
//      });
//    }




  void _onPressedall() async {
    FirebaseFirestore.instance.collection('users').get().then((results) {
      setState(() {
        cars = results;
        if (cars != null) {
          for (var i = 0; i < cars.docs.length; i++) {
            var puid=cars.docs[i].id;
           print(cars.docs[i].id);
            var querySnapshot =  FirebaseFirestore.instance
                .collection('users')
                .doc(cars.docs[i].id)
                .collection('tokens')
                .get();

           querySnapshot.then((value) {
             for (int c =0 ;c<value.docs.length;c++) {
               print(value.docs[c]['token']);
               print(value.docs[c]['platform']);
               print(value.docs[c]['username']);
             }
            });
           // var tokens = querySnapshot.docs.map(snap => snap.id);
          // print(tokens);
          }

        }
      });
    });





  }






  }




