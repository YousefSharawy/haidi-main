class UserModel {
  String? id;
  String? userName;
  String? email;
  String? phone;
  String? lang;
  String? imgProfile;
  String? token;
  int? cityId;
  int? typeUser;
  String? location;
  String? lat;
  String? lng;
  String? cityName;
  bool? activeCode;

  UserModel(
      {this.id,
        this.userName,
        this.email,
        this.phone,
        this.lang,
        this.imgProfile,
        this.token,
        this.cityId,
        this.typeUser,
        this.location,
        this.lat,
        this.lng,
        this.cityName,
        this.activeCode});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    phone = json['phone'];
    lang = json['lang'];
    imgProfile = json['imgProfile'];
    token = json['token'];
    cityId = json['cityId'];
    typeUser = json['typeUser'];
    location = json['location'];
    lat = json['lat'];
    lng = json['lng'];
    cityName = json['cityName'];
    activeCode = json['activeCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['lang'] = this.lang;
    data['imgProfile'] = this.imgProfile;
    data['token'] = this.token;
    data['cityId'] = this.cityId;
    data['typeUser'] = this.typeUser;
    data['location'] = this.location;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['cityName'] = this.cityName;
    data['activeCode'] = this.activeCode;
    return data;
  }
}