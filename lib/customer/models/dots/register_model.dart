class RegisterModel {
  String userName;
  String phone;
  String email;
  int? cityId;
  String password;
  String deviceId;
  String deviceType;
  String projectName;
  String lang;
  String lat;
  String lng;
  String location;

  RegisterModel({
    required this.userName,
    required this.phone,
    required this.email,
    required this.cityId,
    required this.password,
    required this.deviceId,
    required this.deviceType,
    required this.projectName,
    required this.lang,
    required this.lat,
    required this.lng,
    required this.location,
  });

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "phone": phone,
        "email": email,
        "cityId": cityId,
        "password": password,
        "deviceId": deviceId,
        "deviceType": deviceType,
        "projectName": projectName,
        "lang": lang,
        "lat": lat,
        "lng": lng,
        "location": location,
      };
}
