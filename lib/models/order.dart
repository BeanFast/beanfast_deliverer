import 'base_model.dart';
import 'order_activity.dart';
import 'order_detail.dart';
import 'profile.dart';
import 'session_detail.dart';

class Order extends BaseModel {
  String? sessionDetailId;
  String? profileId;
  String? code;
  double? totalPrice;
  DateTime? paymentDate;
  DateTime? deliveryDate;
  int? rewardPoints;
  String? feedback;
  SessionDetail? sessionDetail;
  Profile? profile;
  List<OrderDetail>? orderDetails;
  List<OrderActivity>? orderActivities;

  Order({
    id,
    status,
    this.sessionDetailId,
    this.profileId,
    this.code,
    this.totalPrice,
    this.paymentDate,
    this.deliveryDate,
    this.rewardPoints,
    this.feedback,
    this.sessionDetail,
    this.profile,
    this.orderDetails,
    this.orderActivities,
  }) : super(id: id, status: status);

  factory Order.fromJson(dynamic json) => Order(
        id: json['id'],
        status: json['status'],
        sessionDetailId: json["sessionDetailId"],
        profileId: json['profileId'],
        code: json['code'],
        totalPrice: double.parse(json['totalPrice'].toString()),
        paymentDate: DateTime.parse(json['paymentDate']),
        deliveryDate: json['deliveryDate'] == null
            ? null
            : DateTime.parse(json['deliveryDate']),
        rewardPoints: json['rewardPoints'] == null
            ? 0
            : int.parse(json['rewardPoints'].toString()),
        feedback: json['feedback'] ?? '',
        profile: json['profile'] == null
            ? Profile()
            : Profile.fromJson(json['profile']),
        orderDetails: json['orderDetails']?.map<OrderDetail>((item) {
          return OrderDetail.fromJson(item);
        }).toList(),
        orderActivities: json['orderActivities']?.map<OrderActivity>((item) {
          return OrderActivity.fromJson(item);
        }).toList(),
        sessionDetail: json['sessionDetail'] == null
            ? SessionDetail()
            : SessionDetail.fromJson(json['sessionDetail']),
      );
}
