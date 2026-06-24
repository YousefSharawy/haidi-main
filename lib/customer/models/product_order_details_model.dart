class ProductOrderDetailsModel {
  int? orderId;
  String? providerName;
  String? providerImage;
  String? placeName;
  String? address;
  bool? isCanceled;
  String? paymentType;
  int? status;
  num? totalPricesWithoutAnything;
  num? discount;
  num? delivery;
  num? vat;
  num? totalPrice;
  bool? isPaid;
  List<OrderProducts>? orderProducts;

  ProductOrderDetailsModel(
      {this.orderId,
      this.providerName,
      this.providerImage,
      this.placeName,
      this.address,
      this.paymentType,
      this.status,
      this.totalPricesWithoutAnything,
      this.discount,
      this.delivery,
      this.isCanceled,
      this.vat,
      this.totalPrice,
      this.isPaid,
      this.orderProducts});

  ProductOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    providerName = json['providerName'];
    providerImage = json['providerImage'];
    placeName = json['placeName'];
    address = json['address'];
    paymentType = json['paymentType'];
    isCanceled = json['isCanceled'];
    status = json['status'];
    totalPricesWithoutAnything = json['totalPricesWithoutAnything'];
    discount = json['discount'];
    delivery = json['delivery'];
    vat = json['vat'];
    totalPrice = json['totalPrice'];
    isPaid = json['isPaid'];
    if (json['orderProducts'] != null) {
      orderProducts = <OrderProducts>[];
      json['orderProducts'].forEach((v) {
        orderProducts!.add(new OrderProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['providerName'] = this.providerName;
    data['providerImage'] = this.providerImage;
    data['placeName'] = this.placeName;
    data['address'] = this.address;
    data['isCanceled'] = this.isCanceled;
    data['paymentType'] = this.paymentType;
    data['status'] = this.status;
    data['totalPricesWithoutAnything'] = this.totalPricesWithoutAnything;
    data['discount'] = this.discount;
    data['delivery'] = this.delivery;
    data['vat'] = this.vat;
    data['totalPrice'] = this.totalPrice;
    data['isPaid'] = this.isPaid;
    if (this.orderProducts != null) {
      data['orderProducts'] =
          this.orderProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderProducts {
  String? productTitle;
  String? productImage;
  int? price;
  int? quantity;

  OrderProducts(
      {this.productTitle, this.productImage, this.price, this.quantity});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    productTitle = json['productTitle'];
    productImage = json['productImage'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productTitle'] = this.productTitle;
    data['productImage'] = this.productImage;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}
