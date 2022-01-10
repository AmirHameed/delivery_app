import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:truckdelivery/pages/bottomAppbar.dart';
import 'package:truckdelivery/pages/localDriver.dart';
import 'package:truckdelivery/pages/outsideDriver.dart';
import 'package:truckdelivery/pages/paymethod.dart';
import 'package:truckdelivery/pages/shifting.dart';

import 'delivery.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imageList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL6bmlIucVIfLAFFsZQ6A51YM3JwBOCMoryw&usqp=CAU',
    'https://cdn.pixabay.com/photo/2020/12/22/14/44/car-5852408_960_720.jpg',
  ];
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
                padding: EdgeInsets.only(top: 30, right: 10, left: 10,bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 23,
                                backgroundColor: Color(0xffAD122A),
                                child: CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              Image.asset('assets/mic.png'),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'الدعم',
                                textAlign: TextAlign.right,
                                style: TextStyle(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: Swiper(
                              itemCount: imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Image(
                                  image: NetworkImage(imageList[index]),
                                  fit: BoxFit.cover,
                                );
                              },
                              layout: SwiperLayout.DEFAULT,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: InkWell(
                                           onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>PaymentMethod()));
                                        },
                                        child: myContainer(
                                            'شحن طرود ( خارج المدينة )',
                                            'assets/home1.png'),
                                      )),
                                          SizedBox(width: 10,),
                                  Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Delivery()));
                                        },
                                        child: myContainer(
                                            'ارسال واستقبال طرود',
                                            'assets/home2.png'),
                                      )),
                                ],
                              ),
                              SizedBox(height: 15),
                               Row(
                                children: [
                                  Expanded(
                                      child: myContainer(
                                          'شحن عفش ( خارج المدينة )',
                                          'assets/home3.png')),
                                          SizedBox(width: 10,),
                                  Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Shifting()));
                                        },
                                        child: myContainer(
                                            'نقل عفش',
                                            'assets/home4.png'),
                                      )),
                                ],
                              ),
                               SizedBox(height: 15),
                               Row(
                                children: [
                                  Expanded(
                                      child: InkWell(
                                           onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>OutSideDriver()));
                                        },
                                        child: myContainer(
                                            ' سطحة ( خارج المدينة )',
                                            'assets/home5.png'),
                                      )),
                                          SizedBox(width: 10,),
                                  Expanded(
                                      child: InkWell(
                                             onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>LocalDriver()));
                                        },
                                        child: myContainer(
                                            'سطحة ( داخل المدينة )',
                                            'assets/home6.png'),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 40,
              child: Center(
                child: Image.asset('assets/logo.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myContainer(String text, image) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
         padding: EdgeInsets.only(bottom: 80,top: 20),
        decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff28476E), Colors.white10]),
        ),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.center,
      
          children: [
            Expanded(
              child: Text(
                text,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
