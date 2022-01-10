import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:truckdelivery/helper/firebase_auth_helper.dart';
import 'package:truckdelivery/helper/shared_preference_helper.dart';
import 'package:truckdelivery/pages/ads.dart';
import 'package:truckdelivery/pages/bottomAppbar.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseAuthHelper = FirebaseAuthHelper.instance;
    return MaterialApp(
        title: 'Delivery App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.blue,
    ),
    home: firebaseAuthHelper.currentUser==null?LoginPage():BottomApp());
  }
}
