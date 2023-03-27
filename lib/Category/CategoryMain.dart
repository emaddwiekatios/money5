import 'package:flutter/material.dart';
import 'Category.dart';
//import './Top_Bar.dart';
import './categoryedite.dart';
import 'package:money5_ios_android/colors.dart';
//import 'package:money5_ios_android/home.dart';
import './categoryAdd.dart';
class CategoryMain extends StatefulWidget {
  @override
  _CategoryMainState createState() => _CategoryMainState();
}

class _CategoryMainState extends State<CategoryMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category"),backgroundColor: Color(getColorHexFromStr('#FDD148'),),
     leading: IconButton(icon: Icon(Icons.home),onPressed:() {
       //Navigator.of(context).pop();
     //   Navigator.pushNamed(context, '/ProductsMain');
       /* Navigator.of(context).pushReplacement(
                        new MaterialPageRoute(
                        builder: (BuildContext context) => new Home()

                        
                        ),
                        );*/
                        
                        }
           ),
      ),
      body: Category(),
       
     
       floatingActionButton: new  FloatingActionButton(
        onPressed: ()
        {
          Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder:  (BuildContext context) => new AddCategory()),
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
}