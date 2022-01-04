import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckdelivery/pages/ads.dart';
import 'package:truckdelivery/pages/homePage.dart';
import 'package:truckdelivery/pages/invitation.dart';
import 'package:truckdelivery/pages/messaging.dart';
import 'package:truckdelivery/pages/settings.dart';

class BottomApp extends StatefulWidget {
  @override
  _BottomAppState createState() => _BottomAppState();
}

class _BottomAppState extends State<BottomApp> {
  int index = 0;
  final List<Widget> screens = [
    HomePage(),
    AdsPage(),
    MessagingPage(),
    InvitationPage(),
    SettingsPage()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget curentScreen = HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal:15),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    curentScreen = AdsPage();
                    index = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/star.png'),
                    Text(
                      "التنبيهات",
                      style: TextStyle(
                        color: index == 0 ? Color(0xff7c5aa7) : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    curentScreen = MessagingPage();
                    index = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/notify.png'),
                    Text(
                      "متاجر",
                      style: TextStyle(
                        color: index == 1 ? Color(0xff7c5aa7) : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    curentScreen = HomePage();
                    index = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/home.png'),
                    Text(
                      "اعلانات",
                      style: TextStyle(
                        color: index == 2 ? Color(0xff7c5aa7) : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    curentScreen = MessagingPage();
                    index = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/messaging.png'),
                    Text(
                      "الحساب",
                      style: TextStyle(
                        color: index == 3 ? Color(0xff7c5aa7) : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    curentScreen = SettingsPage();
                    index = 4;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/document.png'),
                    Text(
                      "الحساب",
                      style: TextStyle(
                        color: index == 4 ? Color(0xff7c5aa7) : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageStorage(bucket: bucket, child: curentScreen),
    );
  }
}
