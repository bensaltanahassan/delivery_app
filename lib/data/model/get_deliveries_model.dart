import 'package:intl/intl.dart';

class GetDeliveriesModel {
  bool? status;
  int? totalDeliveries;
  int? currentPage;
  List<Delivery>? data;

  GetDeliveriesModel(
      {this.status, this.totalDeliveries, this.currentPage, this.data});

  GetDeliveriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalDeliveries = json['totalDeliveries'];
    currentPage = json['currentPage'];
    if (json['data'] != null) {
      data = <Delivery>[];
      json['data'].forEach((v) {
        data!.add(Delivery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalDeliveries'] = totalDeliveries;
    data['currentPage'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Delivery {
  int? id;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? deliveryManId;
  Object? deliveryMan;
  int? orderId;
  Order? order;

  Delivery(
      {this.id,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deliveryManId,
      this.deliveryMan,
      this.orderId,
      this.order});

  Delivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(json['createdAt']));
    updatedAt =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(json['updatedAt']));
    deliveryManId = json['deliveryManId'];
    deliveryMan = json['deliveryMan'];
    orderId = json['orderId'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deliveryManId'] = deliveryManId;
    data['deliveryMan'] = deliveryMan;
    data['orderId'] = orderId;
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class Order {
  int? id;
  double? totalPrice;
  String? adress;
  String? phoneNumber;
  String? paymentMethod;
  String? paymentStatus;
  String? orderStatus;
  String? createdAt;
  String? updatedAt;
  int? userId;
  Object? user;
  Object? orderItems;

  Order(
      {this.id,
      this.totalPrice,
      this.adress,
      this.phoneNumber,
      this.paymentMethod,
      this.paymentStatus,
      this.orderStatus,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.user,
      this.orderItems});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalPrice = json['totalPrice'];
    adress = json['adress'];
    phoneNumber = json['phoneNumber'];
    paymentMethod = json['paymentMethod'];
    paymentStatus = json['paymentStatus'];
    orderStatus = json['orderStatus'];
    createdAt =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(json['createdAt']));
    updatedAt =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(json['updatedAt']));
    userId = json['userId'];
    user = json['user'];
    orderItems = json['orderItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['totalPrice'] = totalPrice;
    data['adress'] = adress;
    data['phoneNumber'] = phoneNumber;
    data['paymentMethod'] = paymentMethod;
    data['paymentStatus'] = paymentStatus;
    data['orderStatus'] = orderStatus;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    data['user'] = user;
    data['orderItems'] = orderItems;
    return data;
  }
}
