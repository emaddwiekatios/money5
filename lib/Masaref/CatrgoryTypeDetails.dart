import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import './CategoryMain.dart';
import './CategoryTypeEdit.dart';
//import './editproductcom.dart';
//import './editeproducts.dart';
//import './editeproducts.dart';
//import './image_all.dart';

class CategoryTypeDetails extends StatefulWidget {
  final String cat_id;
  final String cat_name;
  final String cat_desc;
  final String cat_remark;
  final String cat_img;
  final String cat_date;
  final String cat_doc_id;

  CategoryTypeDetails(
      {this.cat_id,
        this.cat_name,
        this.cat_desc,
        this.cat_remark,
        this.cat_img,
        this.cat_date,
        this.cat_doc_id});

  @override
  CategoryTypeDetailsState createState() => CategoryTypeDetailsState();
}

class CategoryTypeDetailsState extends State<CategoryTypeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Category Details"),
          backgroundColor: Colors.red,
        ),
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
                          "Cat No      :${widget.cat_id}",
                          style: new TextStyle(
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        new Text(
                          "Cat_Name    :${widget.cat_name}",
                          style: new TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        new Text(
                          "Cat_desc     :${widget.cat_desc}",
                          style: new TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        new Text(
                          "Date     :${widget.cat_date}",
                          style: new TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Center(
                          child: Image.network(
                            widget.cat_img,
                            height: 350,
                            width: 350,
                          ),
                        ),
                        //new Text("typecat  :${widget.list[widget.index]['typecat']}",style: new TextStyle( fontSize: 20.0),),
                        // new Text("typeunit  :${widget.list[widget.index]['typeunit']}",style: new TextStyle( fontSize: 20.0),),
                        // new Text(" typeprice  :${widget.list[widget.index]['typeprice']}",style: new TextStyle( fontSize: 20.0),),
                        // new Text(" typeremark  :${widget.list[widget.index]['typeremark']}",style: new TextStyle( fontSize: 20.0),),
                        new Padding(
                          padding: EdgeInsets.only(top: 20.0),
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
                                          new CategoryTypeEdit(
                                            cat_id: widget.cat_id,
                                            cat_name: widget.cat_name,
                                            cat_desc: widget.cat_desc,
                                            cat_remark: widget.cat_remark,
                                            cat_date: widget.cat_date,
                                            cat_img: widget.cat_img,
                                            cat_doc_id: widget.cat_doc_id,
                                          )),
                                    );

                                  }
                                  ),

                            ),
                            new RaisedButton(
                              child: new Text("Delete"),
                              color: Colors.red,
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
                               // Navigator.pop(context);
                                Navigator.pushNamed(context, '/CategoryTypeMain');
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
    Firestore.instance
        .collection('TypeCategory')
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}
