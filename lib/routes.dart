import 'package:dev_yahia/routes/palestine_filter/main.dart';
import 'package:dev_yahia/ui/home.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  // static const String splash = '/splash';
  static const String filter = '/palestine-filter';
  static const String filter2 = '/palestine-filter/';
  static const String home = '/';

  static final routes = <String, WidgetBuilder>{
    // splash: (BuildContext context) => SplashScreen(),
    filter: (BuildContext context) => MyHomePage(),
    filter2: (BuildContext context) => MyHomePage(),
    home: (BuildContext context) => Home(),
  };
}
