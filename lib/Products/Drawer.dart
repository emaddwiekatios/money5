import 'package:flutter/material.dart';
import 'package:money5_ios_android/colors.dart';
import 'package:provider/provider.dart';
import 'package:money5_ios_android/AppLocalizations.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Appdrawer extends StatefulWidget {
  final AppLanguage appLanguage;

  Appdrawer({this.appLanguage});

  @override
  _AppdrawerState createState() => _AppdrawerState();
}

class _AppdrawerState extends State<Appdrawer> {



  @override
  Widget build(BuildContext context) {

    double pheight = MediaQuery.of(context).size.height;
    double pwidth = MediaQuery.of(context).size.width;
    var appLanguage = Provider.of<AppLanguage>(context);


    return Drawer(
        child: new ListView(children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text(
              'user_name',
              textAlign: TextAlign.start,
            ),
            accountEmail: Text('user_email'),
            /*  otherAccountsPictures: <Widget>[
                 new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: firstColor),
                )

              ],*/
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.white,
                child:
                // image:NetworkImage(user_img)
                Icon(Icons.person, color: pcolor2),
              ),
            ),
            decoration:
            new BoxDecoration(color: pcolor2),
          ),
          Padding(
            padding: const EdgeInsets.only(left:25.0,right: 25),
            child: Text(AppLocalizations.of(context).translate('Orders'),style: TextStyle(fontWeight: FontWeight.bold),),
          ),

          ListTile(
              leading: Icon(
                Icons.category,
                color: pcolor2,
              ),

              title:   Align(
                alignment: (appLanguage.appLocal.toString() =='ar') ? Alignment.topRight :  Alignment.topLeft,
                child: Text(//'Orders',
                  AppLocalizations.of(context).translate('Orders'),
                  textAlign: TextAlign.right,
                ),
              ),
              onTap: () => Navigator.pushNamed(
                  context, "/OrdersMain") //Navigator.pop(context),
          ),
          Divider(height: 4,color: pcolor3,),
          Padding(
            padding: const EdgeInsets.only(left:25.0,right: 25),
            child: Text( AppLocalizations.of(context).translate('docs'),style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          ListTile(
              leading: Icon(
                Icons.home,
                color: pcolor2,
              ),

              title:   Align(
                alignment: (appLanguage.appLocal.toString() =='ar') ? Alignment.topRight :  Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context).translate('docs'),
                  textAlign: TextAlign.right,
                ),
              ),
              onTap: () => Navigator.pushNamed(
                  context, "/ProductsMain") //Navigator.pop(context),
          ),
          ListTile(
              leading: Icon(
                Icons.category,
                color: pcolor2,
              ),

              title:   Align(
                alignment: (appLanguage.appLocal.toString() =='ar') ? Alignment.topRight :  Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context).translate('Category'),
                  textAlign: TextAlign.right,
                ),
              ),
              onTap: () => Navigator.pushNamed(
                  context, "/CategoryMain2") //Navigator.pop(context),
          ),
          Divider(height: 4,color: pcolor3,),
          Padding(
            padding: const EdgeInsets.only(left:25.0,right: 25),
            child: Text(AppLocalizations.of(context).translate('Masaref'),style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          ListTile(
              leading: Icon(
                Icons.home,
                color: pcolor2,
              ),

              title:   Align(
                alignment: (appLanguage.appLocal.toString() =='ar') ? Alignment.topRight :  Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context).translate('Masaref'),
                  textAlign: TextAlign.right,
                ),
              ),
              onTap: () => Navigator.pushNamed(
                  context, "/MainTypes") //Navigator.pop(context),
          ),
          ListTile(
              leading: Icon(
                Icons.category,
                color: pcolor2,
              ),

              title:   Align(
                alignment: (appLanguage.appLocal.toString() =='ar') ? Alignment.topRight :  Alignment.topLeft,
                child: Text(AppLocalizations.of(context).translate('Category'),
                 // AppLocalizations.of(context).translate('Masaref'),
                  textAlign: TextAlign.right,
                ),
              ),
              onTap: () => Navigator.pushNamed(
                  context, "/CategoryTypeMain") //Navigator.pop(context),
          ),
          Divider(height: 4,color: pcolor3,),
          ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: pcolor2,
              ),

              title:  Align(
                alignment: (appLanguage.appLocal.toString() =='ar') ? Alignment.topRight :  Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context).translate('Log Out'),
                  textAlign: TextAlign.right,
                ),
              ),


              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, "/RegistrationWelcome");

              }    ),
          ListTile(
              leading: Icon(
                Icons.language,
                color: pcolor2,
              ),

              title:  Align(
                alignment: (appLanguage.appLocal.toString() =='ar') ? Alignment.topRight :  Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context).translate('Language'),
                  textAlign: TextAlign.right,
                ),
              ),


              onTap: () {
                //  final Locale locale =Locale();
                // Locale _appLocale2 = Locale("en");
                 if(appLanguage.appLocal.toString() =='ar') {
                   setState(() {
                     appLanguage.changeLanguage(Locale("en"));
                     //  print(appLanguage.appLocal);
                   });
                 }
                 else
                   {
                     appLanguage.changeLanguage(Locale("ar"));
                   }
                // }
              }    ),
          //ListDissmisse
        ]
        ));
  }
}

