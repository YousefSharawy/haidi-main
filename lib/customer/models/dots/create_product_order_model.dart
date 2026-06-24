class CreateProductOrderModel {
  String? providerId;
  int? typePay;
  String? lat;
  String? lng;
  String? location;
  String? copon;
  String lang;

  CreateProductOrderModel({
    required this.providerId,
    required this.typePay,
    required this.lat,
    required this.lng,
    required this.location,
    this.copon = '',
    required this.lang,
  });

  Map<String, dynamic> toJson() => {
        "providerId": providerId,
        "TypePay": typePay,
        "lat": lat,
        "lng": lng,
        "location": location,
        "copon": copon,
        "lang": lang
      };
}
