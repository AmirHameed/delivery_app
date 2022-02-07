import 'package:truckdelivery/model/user_model2.dart';

class Order {
  final UserModelRider creatorId;
  final String id;
  final String orderId;
  final String userId;
  final String prize;
  final bool status;

  Order({required this.creatorId, required this.id, required this.orderId, required this.userId, required this.prize,required this.status});

  Order.initial({
    required creatorId,
    required orderId,
    required userId,
    required prize,
  }) : this(
          creatorId: UserModelRider.fromJson({'id': creatorId}),
          orderId: orderId,
          userId: userId,
          prize: prize,
          status:false,
          id: '',
        );

  factory Order.fromJson(Map<String, dynamic> json, String id, UserModelRider creatorId) {
    final orderId = json['order_id'];
    final userId = json['user_id'];
    final prize = json['prize'];
    final status=json.containsKey('status')? json['status']:'';
    return Order(
      creatorId: creatorId,
      orderId: orderId,
      userId: userId,
      status: status,
      prize: prize,
      id: id,
    );
  }

  Order copyWith({String? id,bool?status}) => Order(
        creatorId: creatorId,
        orderId: orderId,
        userId: userId,
        prize: prize,
        status: status??this.status,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() => {
        'creator_id': creatorId.id,
        'user_id': userId,
        'order_id': orderId,
        'prize': prize,
        'status':status
      };
}
