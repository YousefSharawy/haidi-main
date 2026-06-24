class OrderModel {
  String? providerId;
  String? image;
  String? placeName;
  String? cityName;
  String? location;
  int? orderId;
  int? rate;

  OrderModel({
    this.providerId,
    this.image,
    this.placeName,
    this.cityName,
    this.orderId,
    this.rate,
    this.location,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    providerId = json['providerId'];
    image = json['image'];
    placeName = json['placeName'];
    cityName = json['cityName'];
    orderId = json['orderId'];
    rate = json['rate'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['providerId'] = this.providerId;
    data['image'] = this.image;
    data['placeName'] = this.placeName;
    data['cityName'] = this.cityName;
    data['orderId'] = this.orderId;
    data['rate'] = this.rate;
    data['location'] = this.location;
    return data;
  }
}
