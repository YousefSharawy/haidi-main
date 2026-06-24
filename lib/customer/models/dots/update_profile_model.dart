import 'dart:io';

class UpdateProfileModel {
  String lang;
  String userName;
  String location;
  String lat;
  String lng;
  String email;
  String? phone;
  File? imgProfile;
  int cityId;

  UpdateProfileModel({
    required this.lang,
    required this.userName,
    required this.location,
    required this.lat,
    required this.lng,
    required this.email,
    required this.phone,
    required this.imgProfile,
    required this.cityId
  });

  Map<String, dynamic> toJson() => {
        "lang": lang,
        "userName": userName,
        "location": location,
        "lat": lat,
        "lng": lng,
        "email": email,
        "phone": phone,
        "imgProfile": imgProfile,
        "cityId":cityId
      };
}
