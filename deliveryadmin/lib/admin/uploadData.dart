import 'package:deliveryadmin/admin/message.dart';
import 'package:deliveryadmin/admin/properties.dart';
import 'package:deliveryadmin/admin/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  List<String> _locations = ['A', 'B', 'C', 'D'];
  String _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff99DEF8),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding:
                  EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.5)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.keyboard_arrow_left_outlined,
                          color: Color(0xff28476E),
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/camera1.png'),
                              Text(
                                'اضافة فيديو',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 15,
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
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/add.png'),
                              Text(
                                'إضافة صور',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff28476E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: DropdownButton(
                          isDense: true,
                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                          underline: SizedBox(),
                          isExpanded: true,
                          hint: Text(
                            'اختر القسم',
                            style: TextStyle(color: Color(0xff28476E)),
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
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: DropdownButton(
                          isDense: true,
                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                          underline: SizedBox(),
                          isExpanded: true,
                          hint: Text(
                            'اختر النوع',
                            style: TextStyle(color: Color(0xff28476E)),
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
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: DropdownButton(
                          isDense: true,
                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                          underline: SizedBox(),
                          isExpanded: true,
                          hint: Text(
                            'المدينة',
                            style: TextStyle(color: Color(0xff28476E)),
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
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: DropdownButton(
                          isDense: true,
                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                          underline: SizedBox(),
                          isExpanded: true,
                          hint: Text(
                            'الحي',
                            style: TextStyle(color: Color(0xff28476E)),
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
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 50),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff0066B1),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'ر.س',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Text(
                                  '50000',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Text(
                              'السعر الإجمالي ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'نوع الايجار',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff28476E),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Card(
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                    'assets/calendar.png'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'سنوي',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    fontSize: 11,
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
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Image.asset('assets/date1.png'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'شهري',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: Color(0xff96D5EA),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Card(
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Image.asset('assets/date2.png'),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'يومي',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: Color(0xff28476E),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                              Column(children: [
                                Text(
                                  'عدد دورات المياه',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff28476E),
                                  ),
                                ),
                                Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset('assets/shower.png'),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Icon(Icons.keyboard_arrow_down_outlined)
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                          Column(children: [
                            Text(
                              'عدد الغرف',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff28476E),
                              ),
                            ),
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Image.asset('assets/set.png'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Icon(Icons.keyboard_arrow_down_outlined)
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'اكتب تفاصيل اعلانك',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff28476E),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xff28476E),
                        ),
                      ),
                      child: TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ))),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => PropertiesPage()));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 80),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff28476E),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'تأكيد',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                ],
              )),
        ));
  }
}
