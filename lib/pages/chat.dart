import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:truckdelivery/constant.dart';
import 'package:truckdelivery/controller/setting_controller.dart';
import 'package:truckdelivery/helper/firestore_database_helper.dart';
import 'package:truckdelivery/helper/get_storage_helper.dart';
import 'package:truckdelivery/model/chat.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class Chatapp extends StatefulWidget {
  final int index;
  Chatapp({required this.index});
  @override
  _ChatappState createState() => _ChatappState();
}

class _ChatappState extends State<Chatapp> {
  late String groupId;
  final TextEditingController messageFieldTextController = TextEditingController();
  final GetStorageHelper getStorageHelper = GetStorageHelper.instance;
  final FirestoreDatabaseHelper _firestoreDatabaseHelper=FirestoreDatabaseHelper.instance;
  SettingController orderController = Get.find();
  Stream<QuerySnapshot<Map<String, dynamic>>>? _stream;
  final List<Chat> _chat = <Chat>[];

  @override
  void initState() {
    getGroupId();
    myMessages();
    super.initState();
  }

  Future<void> getGroupId() async {
    final user = await getStorageHelper.user();
    if (user == null) return;
    groupId = user.id.hashCode <= orderController.order[0].creatorId.id.hashCode
        ? '${user.id}-${orderController.order[0].creatorId.id}'
        : '${orderController.order[0].creatorId.id}-${user.id}';
  }

  Future<void> sendMessage(String content) async {
    messageFieldTextController.text = '';
    final user = await getStorageHelper.user();
    if (user == null) return;
    final Chat chat = Chat.withoutId(
        chatId: groupId,
        senderId: user.id.toString(),
        receiverId: orderController.order[0].creatorId.id,
        senderImageUrl: user.image,
        receiverImageUrl: orderController.order[0].creatorId.yourImage,
        senderName: user.firstName+ " "+user.lastName,
        receiverName: orderController.order[0].creatorId.firstName+" "+orderController.order[0].creatorId.lastName,
        content: content);
    try {
      await _firestoreDatabaseHelper.sendMessage(chat);
      //lastSentMessage = MapEntry(content, DateTime.now());
      //_sharedWebService.sendNotification(receiver: friendModel.id, msg: content, title: user.name,source: 'chat');
    } catch (_) {}
  }

  Future<void> myMessages() async {
    final user = await getStorageHelper.user();
    if (user == null) return;
    _stream = null;
    _stream = _firestoreDatabaseHelper.myMessage(groupId);
    _stream?.listen((event) {
      final docs = event.docChanges;
      final messages = docs
          .where((element) => element.doc.data() != null && element.doc.data()!['time_stamp'] != null)
          .map((e) => Chat.fromJson(e.doc.data()!, e.doc.id))
          .where((element) => !_chat.contains(element))
          .toList();

      _chat.isEmpty ? _chat.addAll(messages) : _chat.insertAll(0, messages);
      setState(() {
      });
    }, onError: (e,s) {
      print(e);
      print(s);
      print("onError");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: Container(
      //   color: Colors.white,
      // ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouritePage()));
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: const Image(
                    image: AssetImage('assets/camera_ic.png'),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _showMyDialog();
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: const Image(
                    image: AssetImage('assets/mic_ic.png'),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextFormField(
                  controller: messageFieldTextController,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'اكتب رساله',
                      hintStyle: const TextStyle(fontSize: 12),
                      suffixIcon: IconButton(
                          onPressed: (){
                            final String text = messageFieldTextController.text;
                            if (text.isEmpty) return;
                            sendMessage(text);
                          },
                          icon: Image.asset('assets/send_ic.png')),
                      border: InputBorder.none),
                ),
              ),
            ),
            FocusedMenuHolder(
              menuWidth: MediaQuery.of(context).size.width * 0.50,
              blurSize: 5.0,
              menuItemExtent: 45,
              menuBoxDecoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              duration: const Duration(milliseconds: 100),
              animateMenuItems: true,

              blurBackgroundColor: Colors.black54,
              openWithTap:
                  true, // Open Focused-Menu on Tap rather than Long Press
              menuOffset:
                  10.0, // Offset value to show menuItem from the selected item
              bottomOffsetHeight:
                  10.0, // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
              menuItems: <FocusedMenuItem>[
                // Add Each FocusedMenuItem  for Menu Options
                FocusedMenuItem(
                    title: const Text("الغاء الطلب"),
                    trailingIcon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xff990000),
                    ),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenTwo()));
                    }),
                FocusedMenuItem(
                    title: const Text("رفع شكوى"),
                    trailingIcon: const Icon(
                      Icons.message_rounded,
                      color: Color(0xff990000),
                    ),
                    onPressed: () {}),
                FocusedMenuItem(
                    title: const Text("تغير فاتورة"),
                    trailingIcon: const Icon(
                      Icons.change_circle_outlined,
                      color: Color(0xff990000),
                    ),
                    onPressed: () {}),
              ],
              onPressed: () {},
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: const Image(
                    image: AssetImage('assets/options_ic.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: () async{
          return false;
        },
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 50,
                ),
                const Text(
                  'ماكدونالدز',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GetBuilder<SettingController>(
                 builder: (value) {
                   print(value.order.first.prize);
                  return Row(
                     children: [
                       Expanded(
                         child: Card(
                           margin: const EdgeInsets.symmetric(horizontal: 15),
                           elevation: 8,
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(20)),
                           child: Container(
                             padding: const EdgeInsets.only(
                                 top: 10, bottom: 15, left: 10, right: 10),
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20)),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   orderController.order[0].prize.toString(),
                                   textAlign: TextAlign.center,
                                   style: const TextStyle(
                                     color: Colors.black,
                                     fontWeight: FontWeight.w600,
                                   ),
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     Expanded(
                                       child: Row(
                                         mainAxisAlignment:
                                         MainAxisAlignment.spaceBetween,
                                         children: [
                                           Container(
                                             padding:
                                             const EdgeInsets.symmetric(vertical: 10),
                                             child: Row(
                                               crossAxisAlignment:
                                               CrossAxisAlignment.center,
                                               children: [
                                                 Container(
                                                     padding: const EdgeInsets.symmetric(
                                                         horizontal: 5, vertical: 3),
                                                     child: const Icon(
                                                       Icons.location_on,
                                                       color: Color(0xffA20000),
                                                       size: 20,
                                                     )),
                                                 GestureDetector(
                                                   onTap: () {
                                                     _makePhoneCall(value.order[0].creatorId.phone);
                                                   },
                                                   child: Container(
                                                     padding: const EdgeInsets.symmetric(
                                                         horizontal: 5, vertical: 3),
                                                     child: const Image(
                                                       image: AssetImage(
                                                           'assets/phone-call.png'),
                                                     ),
                                                   ),
                                                 ),
                                                 Column(children: [
                                                   const Text(
                                                     "تم الدفع",
                                                     textAlign: TextAlign.right,
                                                     style: TextStyle(
                                                         fontSize: 10,
                                                         color: Color(0xff009688)),
                                                   ),
                                                   Container(
                                                     padding: const EdgeInsets.symmetric(
                                                         horizontal: 8, vertical: 2),
                                                     child: const Image(
                                                       image: AssetImage(
                                                           'assets/paymentm.png'),
                                                     ),
                                                   ),
                                                 ]),
                                               ],
                                             ),
                                           ),
                                           Column(
                                             crossAxisAlignment:
                                             CrossAxisAlignment.end,
                                             children: [
                                               Text(
                                                 value.order[0].creatorId.firstName,
                                                 textAlign: TextAlign.right,
                                                 style: TextStyle(
                                                   fontSize: 20,
                                                 ),
                                               ),
                                               Row(
                                                 children: [
                                                   Row(
                                                     children: [
                                                       Text(
                                                         '4.6',
                                                         style: TextStyle(
                                                             color: Colors.grey[400],
                                                             fontSize: 12),
                                                       ),
                                                       RatingBar.builder(
                                                         initialRating: 3,
                                                         itemSize: 10,
                                                         minRating: 1,
                                                         unratedColor:
                                                         Colors.grey[300],
                                                         direction: Axis.horizontal,
                                                         allowHalfRating: true,
                                                         itemCount: 5,
                                                         itemPadding:
                                                         const EdgeInsets.symmetric(
                                                             horizontal: 2.0),
                                                         itemBuilder: (context, _) =>
                                                         const Icon(
                                                           Icons.star,
                                                           color: Colors.amber,
                                                         ),
                                                         onRatingUpdate: (rating) {},
                                                       ),
                                                     ],
                                                   ),
                                                 ],
                                               ),
                                             ],
                                           ),
                                         ],
                                       ),
                                     ),
                                     SizedBox(
                                         width:
                                         MediaQuery
                                             .of(context)
                                             .size
                                             .width * 0.05),
                                     Container(
                                       width: 45,
                                       height: 45,
                                       decoration: BoxDecoration(
                                           color: Colors.blue,
                                           shape: BoxShape.circle,
                                           image: value.order[0].creatorId.yourImage.isNotEmpty
                                               ? DecorationImage(
                                               image: NetworkImage(value.order[0].creatorId.yourImage),
                                               fit: BoxFit.cover)
                                               : null),
                                       alignment: Alignment.center,
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ),
                     ],
                   );
                 }),

                Expanded(
                  child: ListView.separated(
                      reverse: true,
                      itemCount: _chat.length,
                      padding: const EdgeInsets.only(bottom: 65),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      separatorBuilder: (_, __) => const SizedBox(height: 5),
                      itemBuilder: (_, index) {
                        print(_chat);
                        final item = _chat[index];
                        return MessageBox(chat: item, userId: orderController.userModel!.id);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showMyDialog() {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(
                  children: [
                      const Text(
                      'هل انت متاكد من تسليم الطلب؟',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       InkWell(
                          onTap: () {
                            //  Navigator.push(
                            // context, MaterialPageRoute(builder: (ctx) => DukanPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffEF0000)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffEF0000),
                                      Colors.purple,
                                    ]),
                                color: const Color(0xff6A007D),
                              ),
                              child: const Text(
                                'لا',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )),
                    const SizedBox(width: 20,),
                      InkWell(
                          onTap: () {
                             Navigator.push(
                            context, MaterialPageRoute(builder: (ctx) => _showMyDialog1()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffEF0000)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffEF0000),
                                      Colors.purple,
                                    ]),
                                color: const Color(0xff6A007D),
                              ),
                              child: const Text(
                                'تم',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )),
                    ])
                  ],
                ),
              ),
            ));
      },
    );
  }

  _showMyDialog1() {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(
                  children: [
                    const Text(
                      'كيف كانت تجربتك',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'محمد',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      itemSize: 18,
                      minRating: 1,
                      unratedColor: Colors.grey[300],
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(30),
                          border: Border.all( color: const Color(0xff990000),),
                        ),
                        child: const TextField(
                          maxLength: 8,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '.... اكتب تقيمك ( اختياري )',
                              hintStyle: TextStyle(fontSize: 12)),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Text(
                      'ليس الان',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15,  color: Color(0xff990000),fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 20,),
                      InkWell(
                          onTap: () {
                            //  Navigator.push(
                            // context, MaterialPageRoute(builder: (ctx) => DukanPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffEF0000)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffEF0000),
                                      Colors.purple,
                                    ]),
                                color: const Color(0xff6A007D),
                              ),
                              child: const Text(
                                'تم',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )),
                    ])
                  ],
                ),
              ),
            ));
      },
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
}
class MessageBox extends StatelessWidget {
  final Chat chat;
  final String userId;

  const MessageBox({required this.chat, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: chat.senderId == userId ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          chat.senderId == userId
              ? Expanded(
            child: Column(
              crossAxisAlignment: chat.senderId == userId ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 5, bottom: 10),
                  child: Column(
                    children: [
                      Align(
                        alignment: (chat.senderId == userId ? Alignment.topRight : Alignment.topLeft),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            color: (chat.senderId == userId ? Colors.black : blueColor),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(chat.content,
                                  softWrap: true,
                                  maxLines: null,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                      chat.senderId == userId ? Colors.white : blueColor)),
                              Text(
                                timeago.format(chat.timeStamp),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 12,  color: lightblueColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
              : Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(top: 5, bottom: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: blueColor),
                  image: chat.senderImageUrl.isNotEmpty
                      ? DecorationImage(image: CachedNetworkImageProvider(chat.senderImageUrl), fit: BoxFit.cover)
                      : const DecorationImage(image: AssetImage('assets/empty_image.png'), fit: BoxFit.cover))),
          chat.senderId == userId
              ? Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(top: 5, bottom: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: blueColor),
                  image: chat.senderImageUrl.isNotEmpty
                      ? DecorationImage(image: CachedNetworkImageProvider(chat.senderImageUrl), fit: BoxFit.cover)
                      : const DecorationImage(image: AssetImage('assets/empty_image.png'), fit: BoxFit.cover)))
              : Expanded(
            child: Column(
              crossAxisAlignment: chat.senderId == userId ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 5, bottom: 10),
                  child: Column(
                    children: [
                      Align(
                        alignment: (chat.senderId == userId ? Alignment.topRight : Alignment.topLeft),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            color: (chat.senderId == userId ? Colors.white : lightblueColor),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                chat.content,
                                softWrap: true,
                                maxLines: null,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: chat.senderId == userId ? lightblueColor: Colors.white),
                              ),
                              Text(
                                timeago.format(chat.timeStamp),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontSize: 12,  color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}