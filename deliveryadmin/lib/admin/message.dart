import 'package:deliveryadmin/admin/message.dart';
import 'package:deliveryadmin/admin/notification.dart';
import 'package:deliveryadmin/admin/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MessagingPage extends StatefulWidget {
  @override
  _MessagingPageState createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff99DEF8),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding:
                    EdgeInsets.only(top: 160, right: 10, left: 10, bottom: 20),
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>NotifyPage()));
                            },
                            child: Image.asset('assets/fvrt.png')),
                          SizedBox(width: 10,),
                          Text(
                            'الرسائل العامة',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff28476E),
                            ),
                          ),
                        ],
                      ),
                     _mycontianer(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 25, right: 15, left: 15),
              height: MediaQuery.of(context).size.height * 0.10,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 2,
                    spreadRadius: 1,
                    color: Colors.black12)
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => SettingsPage()));
                        },
                        child: Image.asset(
                          'assets/smallset.png',
                          color: Color(0xff28476E),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'الإعدادت',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff28476E),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('4.0'),
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        itemSize: 15,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 50,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 138),

                height: MediaQuery.of(context).size.height * 0.08,
                // padding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Center(
                  child: Image.asset(
                    'assets/smalllogo.png',
                    height: 60,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _mycontianer(){
    return  Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 10,
                            top: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xff0066B1)),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '#044004',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xff28476E),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'الموقع : جدة',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color(0xff28476E),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Image.asset(
                                                      'assets/locate.png'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Image.asset(
                                                      'assets/message.png'),
                                                  Positioned(
                                                    right: -4,
                                                    child: CircleAvatar(
                                                        radius: 8,
                                                        backgroundColor:
                                                            Colors.red,
                                                        child: Text(
                                                          '10',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 9,
                                                          ),
                                                        )),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'الموقع : جدة',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color(0xff28476E),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Image.asset(
                                                      'assets/housing.png'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Image.asset(
                                          'assets/graph.png',
                                          height: 60,
                                        )),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    'وصف الإعلان وصف الإعلان وصف الإعلان وصف الإعلان وصف الاعلان',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xff28476E),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
  }
}
