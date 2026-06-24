class SettingModel {
  bool? serviceCart;
  bool? productCart;
  int? notifications;

  SettingModel({this.serviceCart, this.productCart, this.notifications});

  SettingModel.fromJson(Map<String, dynamic> json) {
    serviceCart = json['serviceCart'];
    productCart = json['productCart'];
    // notifications is an int count here, but some responses send the list of
    // notifications under the same key. Coerce a list to its length instead of
    // assigning it to an int? field (which would throw and blank the model).
    final n = json['notifications'];
    notifications = n is int ? n : (n is List ? n.length : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceCart'] = this.serviceCart;
    data['productCart'] = this.productCart;
    data['notifications'] = this.notifications;
    return data;
  }
}
