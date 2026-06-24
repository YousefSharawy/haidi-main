class CreateServiceOrderModel {
  String? providerId;
  int? typePay;
  String? lat;
  String? lng;
  String? location;
  String? copon;
  String? lang;

  CreateServiceOrderModel(
      {required this.providerId,
      required this.typePay,
      required this.lat,
      required this.lng,
      required this.location,
      this.copon,
      required this.lang});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['providerId'] = this.providerId;
    data['typePay'] = this.typePay;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['location'] = this.location;
    data['copon'] = this.copon;
    data['lang'] = this.lang;
    return data;
  }
}
