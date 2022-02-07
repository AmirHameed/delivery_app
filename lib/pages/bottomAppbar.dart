import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckdelivery/pages/ads.dart';
import 'package:truckdelivery/pages/homePage.dart';
import 'package:truckdelivery/pages/invitation.dart';
import 'package:truckdelivery/pages/messaging.dart';
import 'package:truckdelivery/pages/orderRequest.dart';
import 'package:truckdelivery/pages/orders.dart';
import 'package:truckdelivery/pages/settings.dart';

class BottomApp extends StatefulWidget {
  @override
  _BottomAppState createState() => _BottomAppState();
}

class _BottomAppState extends State<BottomApp> {
  int index = 1;
  final List<Widget> screens = [
    OrderRequest(),
    HomePage(),
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
              // InkWell(
              //   onTap: () {
              //     setState(() {
              //       curentScreen = AdsPage();
              //       index = 0;
              //     });
              //   },
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(Icons.star_border,
              //         color: index == 0 ? Color(0xff7c5aa7) : Colors.grey,
              //       ),
              //       Text(
              //         "المفضلة",
              //         style: TextStyle(
              //           color: index == 0 ? Color(0xff7c5aa7) : Colors.grey,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              InkWell(
                onTap: () {
                  setState(() {
                    curentScreen = OrderRequest();
                    index = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.reorder,
                      color: index == 0 ? Color(0xff7c5aa7) : Colors.grey,
                    ),
                    Text(
                      "طلباتي",
                      style: TextStyle(
                        color: index == 0 ? Color(0xff7c5aa7) : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    curentScreen = HomePage();
                    index = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Icon(Icons.home,
                    color: index == 1 ? Color(0xff7c5aa7) : Colors.grey,
                   ),
                    Text(
                      "الرئيسية",
                      style: TextStyle(
                        color: index == 1 ? Color(0xff7c5aa7) : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     setState(() {
              //       curentScreen = MessagingPage();
              //       index = 3;
              //     });
              //   },
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(Icons.email,
              //         color: index == 3 ? Color(0xff7c5aa7) : Colors.grey,
              //       ),
              //       Text(
              //         "رسالة",
              //         style: TextStyle(
              //           color: index == 3 ? Color(0xff7c5aa7) : Colors.grey,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              InkWell(
                onTap: () {
                  setState(() {
                    curentScreen = SettingsPage();
                    index = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.settings,
                      color: index == 2 ? Color(0xff7c5aa7) : Colors.grey,
                    ),
                    Text(
                      "إعدادات",
                      style: TextStyle(
                        color: index == 2 ? Color(0xff7c5aa7) : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: WillPopScope(
          onWillPop: () async{
            if(index!=1){
              setState(() {
                curentScreen = HomePage();
                index = 1;
              });
              return false;
            }
            return _showMyDialog(context);
          },
          child: PageStorage(bucket: bucket, child: curentScreen)),
    );
  }

  Future<bool> _showMyDialog(context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            height: 150,
            padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'هل تريد ترك هذا التطبيق',

                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff28476E),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        exit(0);
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Color(0xff99DEF8),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text('خروج',
                                style: TextStyle(
                                  color: Color(0xff28476E),
                                  fontSize: 16,
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text('الغاء',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
