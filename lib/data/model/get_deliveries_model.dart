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
  DeliveryMan? deliveryMan;
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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deliveryManId = json['deliveryManId'];
    deliveryMan = json['deliveryMan'] != null
        ? DeliveryMan.fromJson(json['deliveryMan'])
        : null;
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
    if (deliveryMan != null) {
      data['deliveryMan'] = deliveryMan!.toJson();
    }
    data['orderId'] = orderId;
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class DeliveryMan {
  int? id;
  String? email;
  String? fullName;
  String? phoneNumber;
  String? password;
  String? status;
  String? createdAt;
  String? updatedAt;

  DeliveryMan(
      {this.id,
      this.email,
      this.fullName,
      this.phoneNumber,
      this.password,
      this.status,
      this.createdAt,
      this.updatedAt});

  DeliveryMan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
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
  User? user;
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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
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
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['orderItems'] = orderItems;
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? fullName;
  String? phone;
  String? address;
  Object? password;
  bool? isVerified;
  Object? emailVerificationToken;
  Object? resetCode;
  Object? resetCodeExpiry;
  String? createdAt;
  String? updatedAt;
  Object? imageId;
  Object? image;

  User(
      {this.id,
      this.email,
      this.fullName,
      this.phone,
      this.address,
      this.password,
      this.isVerified,
      this.emailVerificationToken,
      this.resetCode,
      this.resetCodeExpiry,
      this.createdAt,
      this.updatedAt,
      this.imageId,
      this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullName = json['fullName'];
    phone = json['phone'];
    address = json['address'];
    password = json['password'];
    isVerified = json['isVerified'];
    emailVerificationToken = json['emailVerificationToken'];
    resetCode = json['resetCode'];
    resetCodeExpiry = json['resetCodeExpiry'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    imageId = json['imageId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['fullName'] = fullName;
    data['phone'] = phone;
    data['address'] = address;
    data['password'] = password;
    data['isVerified'] = isVerified;
    data['emailVerificationToken'] = emailVerificationToken;
    data['resetCode'] = resetCode;
    data['resetCodeExpiry'] = resetCodeExpiry;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['imageId'] = imageId;
    data['image'] = image;
    return data;
  }
}
