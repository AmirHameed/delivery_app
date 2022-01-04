import 'package:deliveryadmin/admin/message.dart';
import 'package:deliveryadmin/admin/settings.dart';
import 'package:deliveryadmin/admin/uploadData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NotifyPage extends StatefulWidget {
  @override
  _NotifyPageState createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff99DEF8),
      floatingActionButton: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>UploadPage()));
        },
        child: Image.asset('assets/msgEdit.png',height: 80,)),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      
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
                    EdgeInsets.only( right: 10, left: 10, bottom: 20),
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Container(
                     padding:
                    EdgeInsets.only(top:130,right: 10, left: 10, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/fvrt.png'),
                            SizedBox(
                              width: 10,
                            ),
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
                mainAxisAlignment: MainAxisAlignment.start,
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

  Widget _mycontianer() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 10,
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '2021/11/05',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff28476E),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'اسم المعلن',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff28476E),
                                  ),
                                ),
                              
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Flexible(
                                child: Text(
                                  'بخصوص الإعلان بخصوص الإعلان بخصوص الإعلان بخصوص الاعلان',
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff28476E),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 2,
                  child: Card(
                    elevation: 2,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: CircleAvatar(
                     radius: 27,
                     backgroundColor: Colors.white,
                        child:CircleAvatar(
                          radius:26,
                          backgroundColor:Colors.red,
                        )),
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
