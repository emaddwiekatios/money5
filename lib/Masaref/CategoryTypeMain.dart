import 'package:flutter/material.dart';
import 'CategoryType.dart';
//import './Top_Bar.dart';
//import './categoryedite.dart';
import 'package:money5_ios_android/colors.dart';
import './CategoryTypeAdd.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


class CategoryTypeMain extends StatefulWidget {
  @override
  _CategoryTypeMainState createState() => _CategoryTypeMainState();
}

class _CategoryTypeMainState extends State<CategoryTypeMain> {

  var cat_max;
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category"),backgroundColor: Color(getColorHexFromStr('#FDD148'),),
        leading: IconButton(icon: Icon(Icons.home),onPressed:() {
          Navigator.pushNamed(context, '/ProductsMain');
          /* Navigator.of(context).pushReplacement(
                        new MaterialPageRoute(
                        builder: (BuildContext context) => new Home()

                        
                        ),
                        );*/

        }
        ),
      ),
      body: CategoryType(),


      floatingActionButton: new  FloatingActionButton(
        onPressed: ()
        {
          Navigator.of(context).push(
            new MaterialPageRoute(
                builder:  (BuildContext context) => new AddCategoryType(cat_max: cat_max)),
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
    );
  }

  getData() async {
    //return await FirebaseFirestore.instance.collection("Gym-Category").snapshots();


    return await FirebaseFirestore.instance.collection('TypeCategory').get();

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