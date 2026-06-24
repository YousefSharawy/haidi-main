class AddServiceToCartModel {
  int? serviceId;
  String date;
  String? time;
  String? lat;
  String? lng;
  String? location;
  bool? notInSalon;

  AddServiceToCartModel({
    required this.serviceId,
    required this.date,
    this.time = '',
    this.lat = '',
    this.lng = '',
    this.location = '',
    this.notInSalon = false,
  });

  Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
        "date": date,
        "time": time,
        "lat": lat,
        "lng": lng,
        "location": location,
        "notInSalon": notInSalon
      };
}
