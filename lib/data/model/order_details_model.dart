class GetOrderDetailsModel {
  bool? status;
  Order? order;
  Delivery? delivery;

  GetOrderDetailsModel({this.status, this.order, this.delivery});

  GetOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    delivery =
        json['delivery'] != null ? Delivery.fromJson(json['delivery']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (order != null) {
      data['order'] = order!.toJson();
    }
    if (delivery != null) {
      data['delivery'] = delivery!.toJson();
    }
    return data;
  }
}

class Order {
  int? id;
  int? userId;
  User? user;
  double? totalPrice;
  String? adress;
  String? phoneNumber;
  String? paymentMethod;
  String? paymentStatus;
  String? orderStatus;
  String? createdAt;
  String? updatedAt;
  List<OrderItems>? orderItems;

  Order(
      {this.id,
      this.userId,
      this.user,
      this.totalPrice,
      this.adress,
      this.phoneNumber,
      this.paymentMethod,
      this.paymentStatus,
      this.orderStatus,
      this.createdAt,
      this.updatedAt,
      this.orderItems});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    totalPrice = json['totalPrice'];
    adress = json['adress'];
    phoneNumber = json['phoneNumber'];
    paymentMethod = json['paymentMethod'];
    paymentStatus = json['paymentStatus'];
    orderStatus = json['orderStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['orderItems'] != null) {
      orderItems = <OrderItems>[];
      json['orderItems'].forEach((v) {
        orderItems!.add(OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['totalPrice'] = totalPrice;
    data['adress'] = adress;
    data['phoneNumber'] = phoneNumber;
    data['paymentMethod'] = paymentMethod;
    data['paymentStatus'] = paymentStatus;
    data['orderStatus'] = orderStatus;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (orderItems != null) {
      data['orderItems'] = orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? fullName;
  String? email;
  String? phone;
  String? address;

  User({this.fullName, this.email, this.phone, this.address});

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    return data;
  }
}

class OrderItems {
  int? id;
  int? quantity;
  int? orderId;
  Product? product;
  String? createdAt;
  String? updatedAt;

  OrderItems(
      {this.id,
      this.quantity,
      this.orderId,
      this.product,
      this.createdAt,
      this.updatedAt});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    orderId = json['orderId'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['orderId'] = orderId;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? nameAn;
  String? description;
  String? descriptionAn;
  double? price;
  int? discount;
  int? nbrOfSales;
  bool? isAvailable;
  int? categoryId;
  Category? category;
  String? createdAt;
  String? updatedAt;
  List<ProductImages>? productImages;

  Product(
      {this.id,
      this.name,
      this.nameAn,
      this.description,
      this.descriptionAn,
      this.price,
      this.discount,
      this.nbrOfSales,
      this.isAvailable,
      this.categoryId,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.productImages});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAn = json['nameAn'];
    description = json['description'];
    descriptionAn = json['descriptionAn'];
    price = json['price'];
    discount = json['discount'];
    nbrOfSales = json['nbrOfSales'];
    isAvailable = json['isAvailable'];
    categoryId = json['categoryId'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['productImages'] != null) {
      productImages = <ProductImages>[];
      json['productImages'].forEach((v) {
        productImages!.add(ProductImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nameAn'] = nameAn;
    data['description'] = description;
    data['descriptionAn'] = descriptionAn;
    data['price'] = price;
    data['discount'] = discount;
    data['nbrOfSales'] = nbrOfSales;
    data['isAvailable'] = isAvailable;
    data['categoryId'] = categoryId;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (productImages != null) {
      data['productImages'] = productImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? nameAn;

  Category({this.id, this.name, this.nameAn});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAn = json['nameAn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nameAn'] = nameAn;
    return data;
  }
}

class ProductImages {
  int? id;
  Image? image;
  bool? isMain;

  ProductImages({this.id, this.image, this.isMain});

  ProductImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    isMain = json['isMain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['isMain'] = isMain;
    return data;
  }
}

class Image {
  int? id;
  String? publicId;
  String? url;
  String? createdAt;
  String? updatedAt;

  Image({this.id, this.publicId, this.url, this.createdAt, this.updatedAt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    publicId = json['publicId'];
    url = json['url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['publicId'] = publicId;
    data['url'] = url;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Delivery {
  int? deliveryId;
  String? deliveryName;

  Delivery({this.deliveryId, this.deliveryName});

  Delivery.fromJson(Map<String, dynamic> json) {
    deliveryId = json['deliveryId'];
    deliveryName = json['deliveryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deliveryId'] = deliveryId;
    data['deliveryName'] = deliveryName;
    return data;
  }
}
