import 'package:truckdelivery/model/user_model2.dart';

class Order {
  final UserModelRider creatorId;
  final String id;
  final String orderId;
  final String userId;
  final String prize;
  final num lat;
  final num long;
  final bool status;
  final String orderStatus;

  Order(
      {required this.creatorId,
      required this.id,
      required this.orderId,
      required this.userId,
      required this.prize,
      required this.lat,
      required this.long,
      required this.status,
      required this.orderStatus});

  Order.initial({
    required creatorId,
    required orderId,
    required userId,
    required lat,
    required long,
    required prize,
  }) : this(
          creatorId: UserModelRider.fromJson({'id': creatorId}),
          orderId: orderId,
          userId: userId,
          prize: prize,
          lat: lat,
          long: long,
          status: false,
          orderStatus: 'موقع الإستلام',
          id: '',
        );

  factory Order.fromJson(Map<String, dynamic> json, String id, UserModelRider creatorId) {
    final orderId = json['order_id'];
    final userId = json['user_id'];
    final prize = json['prize'];
    final lat = json.containsKey('lat') ? json['lat'] : 0;
    final long = json.containsKey('long') ? json['long'] : 0;
    final status = json.containsKey('status') ? json['status'] : '';
    final orderStatus = json.containsKey('order_status') ? json['order_status'] : '';

    return Order(
      creatorId: creatorId,
      orderId: orderId,
      userId: userId,
      status: status,
      lat: lat,
      long: long,
      orderStatus: orderStatus,
      prize: prize,
      id: id,
    );
  }

  Order copyWith({
    String? id,
    bool? status,
  }) =>
      Order(
        creatorId: creatorId,
        orderId: orderId,
        userId: userId,
        prize: prize,
        lat: lat,
        long: long,
        status: status ?? this.status,
        orderStatus: orderStatus,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() => {
        'creator_id': creatorId.id,
        'user_id': userId,
        'order_id': orderId,
        'prize': prize,
        'lat': lat,
        'long': long,
        'order_status': orderStatus,
        'status': status
      };
}
