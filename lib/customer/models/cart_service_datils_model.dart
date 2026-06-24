class CartServiceDetailsModel {
  String? placeImage;
  String? placeName;
  String? cityName;
  List<ServicesItem>? services;

  CartServiceDetailsModel(
      {this.placeImage, this.placeName, this.cityName, this.services});

  CartServiceDetailsModel.fromJson(Map<String, dynamic> json) {
    placeImage = json['placeImage'];
    placeName = json['placeName'];
    cityName = json['cityName'];
    if (json['services'] != null) {
      services = <ServicesItem>[];
      json['services'].forEach((v) {
        services!.add(new ServicesItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placeImage'] = this.placeImage;
    data['placeName'] = this.placeName;
    data['cityName'] = this.cityName;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServicesItem {
  int? id;
  dynamic serviceType;
  String? date;
  dynamic time;
  int? servicePrice;
  dynamic lat;
  dynamic lng;

  ServicesItem(
      {this.id,
        this.serviceType,
        this.date,
        this.time,
        this.servicePrice,
        this.lat,
        this.lng});

  ServicesItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceType = json['serviceType'];
    date = json['date'];
    time = json['time'];
    servicePrice = json['servicePrice'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serviceType'] = this.serviceType;
    data['date'] = this.date;
    data['time'] = this.time;
    data['servicePrice'] = this.servicePrice;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}