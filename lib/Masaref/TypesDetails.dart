import 'package:money5_ios_android/Products/ProductsEdit.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money5_ios_android/Masaref/TypesEdit.dart';


import 'package:money5_ios_android/colors.dart';
import './TypesEdit.dart';
//import './editeproducts.dart';
//import './image_all.dart';

class TypesDetails extends StatefulWidget {
  final String type_id;
  final String type_name;
  final String type_desc;
  final String type_price;
  
  final String type_cat;
  final String type_img;
  final String type_date;
  final String type_doc_id;

  TypesDetails(
      {this.type_id,
        this.type_name,
        this.type_desc,
        this.type_price,
        this.type_cat,
        this.type_img,
        this.type_date,
        this.type_doc_id});

  @override
  TypesDetailsState createState() => TypesDetailsState();
}

class TypesDetailsState extends State<TypesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Type Details"),
          backgroundColor: Color(getColorHexFromStr('#FDD148')),
          leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
    Navigator.pop(context);
    },
        ),),
        body: new Container(
          //  height: 500,
            padding: EdgeInsets.all(5.0),
            child: new Card(
              child: new Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.all(5.0),
                        ),

                        new Text(
                          "No      :${widget.type_id}",
                          style: new TextStyle(
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        new Text(
                          "Name    :${widget.type_name}",
                          style: new TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        new Text(
                          "Desc     :${widget.type_desc}",
                          style: new TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        new Text(
                          "Date     :${widget.type_date}",
                          style: new TextStyle(
                            fontSize: 20.0,
                          ),
                        ),

                        new Text(
                          "Price Small     :${widget.type_price.toString()}",
                          style: new TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        
                        

                       
                        new Text(
                          "Category     :${widget.type_cat}",
                          style: new TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Center(
                          child: Image.network(
                            widget.type_img,
                            height: 250,
                            width: 250,
                          ),
                        ),
                        //new Text("typeTran  :${widget.list[widget.index]['typeTran']}",style: new TextStyle( fontSize: 20.0),),
                        // new Text("typeunit  :${widget.list[widget.index]['typeunit']}",style: new TextStyle( fontSize: 20.0),),
                        // new Text(" typeprice  :${widget.list[widget.index]['typeprice']}",style: new TextStyle( fontSize: 20.0),),
                        // new Text(" typeremark  :${widget.list[widget.index]['typeremark']}",style: new TextStyle( fontSize: 20.0),),
                        new Padding(
                          padding: EdgeInsets.only(top: 5.0),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Center(
                              child: new RaisedButton(
                                  child: new Text("Edit"),
                                  color: Colors.green,
                                  // onPressed: ()
                                  onPressed: () {
                                    // print("widget.pcarnameg = ${widget.pcarnameg}");
                                   Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                          new TypeEdit(

                                            type_id: widget.type_id,
                                            type_name: widget.type_name,
                                            type_desc: widget.type_desc,
                                            type_price: widget.type_price,
                                            type_cat: widget.type_cat,
                                            type_date: widget.type_date,
                                            type_img: widget.type_img,
                                            type_doc_id: widget.type_doc_id,
                                          )),

                                    );

                                  }
                                  ),
                            ),
                            new RaisedButton(
                              child: new Text("Delete"),
                              color: Color(getColorHexFromStr('#FDD148')),
                              onPressed: () {
                                print("widget.pproductdocid ${widget.type_doc_id}");
                                //   deleteData(widget.pproductdocid) ;
                                // comfirm();
                                deleteData(widget.type_doc_id);
                                //  updatedata();
                                /*  Navigator.of(context).push(
                              new MaterialPageRoute(
                                 builder: (BuildContext context)=> new traningMain()
                                 ),
                               );
                     */

                                Navigator.pushNamed(context, '/Types');
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            )));
  }

  deleteData(docId) {
    FirebaseFirestore.instance
        .collection('Type')
        .doc(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}
