class ServiceOrderDetailsModel {
  int? orderId;
  String? providerName;
  String? providerImage;
  String? placeName;
  String? cityName;
  int? status;
  bool? isInCancelTime;
  bool? isPaid;
  bool? isRated;
  List<OrderServices>? orderServices;
  num? price;

  ServiceOrderDetailsModel(
      {this.orderId,
      this.providerName,
      this.providerImage,
      this.placeName,
      this.cityName,
      this.status,
      this.isInCancelTime,
      this.isPaid,
      this.isRated,
      this.orderServices,
      this.price});

  ServiceOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    providerName = json['providerName'];
    providerImage = json['providerImage'];
    placeName = json['placeName'];
    cityName = json['cityName'];
    status = json['status'];
    isInCancelTime = json['isInCancelTime'];
    isPaid = json['isPaid'];
    isRated = json['isRated'];
    if (json['orderServices'] != null) {
      orderServices = <OrderServices>[];
      json['orderServices'].forEach((v) {
        orderServices!.add(new OrderServices.fromJson(v));
      });
    }
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['providerName'] = this.providerName;
    data['providerImage'] = this.providerImage;
    data['placeName'] = this.placeName;
    data['cityName'] = this.cityName;
    data['status'] = this.status;
    data['isInCancelTime'] = this.isInCancelTime;
    data['isPaid'] = this.isPaid;
    data['isRated'] = this.isRated;
    if (this.orderServices != null) {
      data['orderServices'] =
          this.orderServices!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    return data;
  }
}

class OrderServices {
  int? id;
  int? orderId;
  int? serviceId;
  int? servicePrice;
  dynamic serviceTitle;
  String? orderDate;
  dynamic orderTime;

  OrderServices(
      {this.id,
      this.orderId,
      this.serviceId,
      this.servicePrice,
      this.serviceTitle,
      this.orderDate,
      this.orderTime});

  OrderServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    serviceId = json['serviceId'];
    servicePrice = json['servicePrice'];
    serviceTitle = json['serviceTitle'];
    orderDate = json['orderDate'];
    orderTime = json['orderTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderId'] = this.orderId;
    data['serviceId'] = this.serviceId;
    data['servicePrice'] = this.servicePrice;
    data['serviceTitle'] = this.serviceTitle;
    data['orderDate'] = this.orderDate;
    data['orderTime'] = this.orderTime;
    return data;
  }
}
