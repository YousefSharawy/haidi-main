class ProviderModel {
  String? providerId;
  int? id;
  num? rate;
  String? image;
  String? providerImage;
  String? cityName;
  String? providerName;
  String? placeName;
  String? description;
  String? location;
  String? lng;
  String? lat;

  ProviderModel(
      {this.providerId,
      this.id,
      this.rate,
      this.image,
      this.providerImage,
      this.cityName,
      this.providerName,
      this.placeName,
      this.description,
      this.location,
      this.lat,
      this.lng});

  ProviderModel.fromJson(Map<String, dynamic> json) {
    providerId = json['providerId'];
    id = json['id'];
    rate = json['rate'];
    image = json['image'];
    image = json['image'];
    providerImage = json['providerImage'];
    cityName = json['cityName'];
    providerName = json['providerName'];
    placeName = json['placeName'];
    description = json['description'];
    location = json['location'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['providerId'] = this.providerId;
    data['id'] = this.id;
    data['rate'] = this.rate;
    data['image'] = this.image;
    data['providerImage'] = this.providerImage;
    data['cityName'] = this.cityName;
    data['providerName'] = this.providerName;
    data['placeName'] = this.placeName;
    data['description'] = this.description;
    data['location'] = this.location;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
