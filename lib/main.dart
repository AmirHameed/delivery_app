import 'package:flutter/material.dart';
import 'package:truckdelivery/pages/ads.dart';
import 'package:truckdelivery/pages/callUs.dart';
import 'package:truckdelivery/pages/dateTime.dart';
import 'package:truckdelivery/pages/detail.dart';
import 'package:truckdelivery/pages/dropdown.dart';
import 'package:truckdelivery/pages/homePage.dart';
import 'package:truckdelivery/pages/invitation.dart';
import 'package:truckdelivery/pages/localDriver.dart';
import 'package:truckdelivery/pages/login.dart';
import 'package:truckdelivery/pages/onlyCars.dart';
import 'package:truckdelivery/pages/outsideDriver.dart';
import 'package:truckdelivery/pages/profile.dart';
import 'package:truckdelivery/pages/settings.dart';
import 'package:truckdelivery/pages/messaging.dart';
import 'package:truckdelivery/pages/paymethod.dart';
import 'package:truckdelivery/pages/shifting.dart';
import 'package:truckdelivery/pages/signup.dart';
import 'package:truckdelivery/pages/tafseel.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

