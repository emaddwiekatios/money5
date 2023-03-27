import 'package:flutter/material.dart';
//import 'file:///Users/serviceapp/Desktop/Apps_from_flash/money5_ios_android%20new2/lib/Home.dart';
import 'package:money5_ios_android/AppLocalizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Category/CategoryMain.dart';
import 'Products/ProductsMain.dart';
import 'Category/categoryAdd.dart';
import 'Splash/Splash.dart';
import 'Registration/RegistrationWelcome.dart';
import 'AppLocalizations.dart';
import 'Registration/SignIn.dart';
import 'Registration/SignUp.dart';
import 'package:money5_ios_android/Category/CategoryMain2.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:money5_ios_android/Masaref/MainTypes.dart';
import 'package:money5_ios_android/Masaref/CategoryTypeMain.dart';

import 'package:money5_ios_android/Orders/OrdersAdd.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:money5_ios_android/Orders/OrdersMain.dart';
import 'package:money5_ios_android/testing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(

        //enabled: !kReleaseMode,
     SocialApp(
    appLanguage: appLanguage,
  ));
}




class SocialApp extends StatelessWidget {
  final AppLanguage appLanguage;

  SocialApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage,
      //builder: ,
      // builder: (_) => appLanguage,

      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
            locale: model.appLocal,
            supportedLocales: [
              Locale('en', 'US'),
              Locale('ar', ''),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,



            ],
            //locale: DevicePreview.of(context).locale, // <--- /!\ Add the locale
         //   builder: DevicePreview.appBuilder,
            home: Splash(),
            routes: {

              // When we navigate to the "/" route, build the FirstScreen Widget
              '/CategoryMain': (context) => CategoryMain(),
              '/CategoryMain2': (context) => CategoryMain2(),
              '/ProductsMain': (context) => ProductsMain(),
              '/CategoryAdd': (context) => AddCategory(),
              '/SignIn': (context) => SignIn(),
              '/SignUp': (context) => SignUp(),
              '/RegistrationWelcome': (context) => RegistrationWelcome(),


              '/MainTypes': (context) => MainTypes(),
              '/CategoryTypeMain': (context) => CategoryTypeMain(),

              '/OrdersMain': (context) =>OrdersMain(),
              '/OrdersAdd': (context) => OrdersAdd(),
              '/test': (context) => test(),









             // '/SocialHome': (context) => SocialHome(),



            }

        );
      }),
    );
  }
}

/*
void main() async {
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(SocialApp(
    appLanguage: appLanguage,
  ));
}

class SocialApp extends StatelessWidget {
  final AppLanguage appLanguage;

  SocialApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
        builder: (_) => appLanguage,
    child: Consumer<AppLanguage>(builder: (context, model, child) {
    return MaterialApp(
    locale: model.appLocal,
    supportedLocales: [
    Locale('en', 'US'),
    Locale('ar', ''),
    ],
    localizationsDelegates: [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
 ],

      home: Splash(),

      // routes: pages,
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/CategoryMain': (context) => CategoryMain(),
        '/ProductsMain': (context) => ProductsMain(),
        '/CategoryAdd': (context) => AddCategory(),
        '/RegistrationWelcome': (context) => RegistrationWelcome(),
      }
    );
    }),
    );
    }
  }


 */