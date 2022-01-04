import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'option.dart';

class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  List<String> imageList = [
    'assets/slider1.png',
    'assets/slider2.png',
  ];
  List<String> _locations = ['A', 'B', 'C', 'D'];
  String _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff99DEF8),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding:
                    EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                         SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.end,
                        children:[
                          InkWell(
                            onTap:(){
                              Navigator.pop(context);
                            },
                            child: Icon(
                              
                              Icons.keyboard_arrow_left,size:35, color: Color(0xff28476E),),
                          )
                        ]
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                              onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>OptionPage()));
                            },
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/percent.png'),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'خصومات',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xff28476E),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'للتقبيل',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'للإيجار',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'الكل ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Swiper(
                            itemCount: imageList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Image(
                                image: AssetImage(imageList[index]),
                                fit: BoxFit.fill,
                              );
                            },
                            layout: SwiperLayout.DEFAULT,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            myContainer(
                              'مستودع',
                            ),
                            myContainer(
                              'مكاتب',
                            ),
                            myContainer(
                              'محل',
                            ),
                            myContainer(
                              'أرض',
                            ),
                            myContainer(
                              'عمارة',
                            ),
                            myContainer(
                              'فلل',
                            ),
                            myContainer(
                              'شقق',
                            ),
                            myContainer(
                              'الكل',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset('assets/location.png'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'عرض الخريطة',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff28476E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff28476E),
                                ),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: DropdownButton(
                                    isDense: true,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.white,
                                    ),
                                    underline: SizedBox(),

                                    hint: Text(
                                      'المدينة',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ), // Not necessary for Option 1
                                    value: _selectedLocation,
                                    onChanged: (newValue) => setState(() {
                                      _selectedLocation = newValue.toString();
                                    }),

                                    items: _locations.map((location) {
                                      return DropdownMenuItem(
                                        child: new Text(location),
                                        value: location,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff28476E),
                                ),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: DropdownButton(
                                    isDense: true,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.white,
                                    ),
                                    underline: SizedBox(),

                                    hint: Text(
                                      'المدينة',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ), // Not necessary for Option 1
                                    value: _selectedLocation,
                                    onChanged: (newValue) => setState(() {
                                      _selectedLocation = newValue.toString();
                                    }),

                                    items: _locations.map((location) {
                                      return DropdownMenuItem(
                                        child: new Text(location),
                                        value: location,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff28476E),
                                ),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: DropdownButton(
                                    isDense: true,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.white,
                                    ),
                                    underline: SizedBox(),

                                    hint: Text(
                                      'المدينة',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ), // Not necessary for Option 1
                                    value: _selectedLocation,
                                    onChanged: (newValue) => setState(() {
                                      _selectedLocation = newValue.toString();
                                    }),

                                    items: _locations.map((location) {
                                      return DropdownMenuItem(
                                        child: new Text(location),
                                        value: location,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          bottom: 10,
                          top: 10,
                          left: 10,
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Card(
                                   elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.red,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 40, horizontal: 30),
                                  ),
                                )),
                            Expanded(
                              flex: 5,
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset('assets/time.png'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'الأن',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff28476E),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'شقة بحي القادسية للإيجار',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff28476E),
                                          ),
                                        ),
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'حي القادسية',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff28476E),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Image.asset('assets/location.png'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'قيمة الإيجار : 17 الف ريال',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff28476E),
                                              ),
                                            ),
                                            Image.asset('assets/dollar.png'),
                                          ],
                                        ),
                                      ]),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        decoration: BoxDecoration(
                                          color: Color(0xff28476E),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'تفضيل',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.favorite_border_outlined,
                                              color: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                     Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        decoration: BoxDecoration(
                                          color: Color(0xff28476E),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'عرض التعليقات',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.search,
                                              color: Colors.white,
                                              
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 40,
              child: Center(
                child: Image.asset(
                  'assets/smallestate.png',
                  height: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myContainer(String text) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff28476E),
            ),
          ),
        ),
      ),
    );
  }
}
