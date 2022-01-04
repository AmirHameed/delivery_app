import 'package:deliveryadmin/admin/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCBEEFB),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20, 40, 20, 30),
        child: Column(
          children: [
            Text(
              'اشتراك مقدم الخدمة',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff28476E),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
                elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                color: Colors.white,
                child: Image.asset('assets/camera.png'),
              ),
            ),
            Text(
              ' اضف صورة العقار',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff28476E),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'اسم المعلن',
                    isDense: true,
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: Color(0xff28476E),
                    ),
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
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'اسم المؤسسة او الشركة',
                      isDense: true,
                      hintStyle: TextStyle(
                        fontSize: 13,
                        color: Color(0xff28476E),
                      ),
                      prefixText: 'اختياري',
                      prefixStyle: TextStyle(
                        color: Colors.red,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'رقم الجوال',
                    isDense: true,
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: Color(0xff28476E),
                    ),
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
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'رقم السجل التجاري',
                      isDense: true,
                      hintStyle: TextStyle(
                        fontSize: 13,
                        color: Color(0xff28476E),
                      ),
                      prefixText: 'اختياري',
                      prefixStyle: TextStyle(
                        color: Colors.red,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'كلمة المرور',
                    isDense: true,
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: Color(0xff28476E),
                    ),
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
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'إعادة كلمة المرور',
                    isDense: true,
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: Color(0xff28476E),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>CategoryPage()));
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
        ),
      ),
    );
  }
}
