import 'package:deliveryadmin/admin/message.dart';
import 'package:deliveryadmin/admin/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('assets/graph.png'),
                              Text(
                                'نسبة المتابعين',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff28476E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('assets/Group 2109.png'),
                              Text(
                                'إضافة اعلان',
                                 textAlign: TextAlign.right,
                                style: TextStyle(
                                 fontSize: 20,
                                  color: Color(0xff28476E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MessagingPage()));
                        },
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Container(
                                 padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                    decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                                 child: Text('10',style: TextStyle(
                                   fontSize: 25,fontWeight: FontWeight.bold,
                                     color: Colors.white
                                 ),),
                               ),
                                Text(
                                  'اعلاناتي',
                                   textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff28476E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
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
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SettingsPage()));
                        },
                        child: Image.asset(
                          'assets/setting.png', color: Color(0xff28476E),
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
                    'assets/smallestate.png',
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
}
