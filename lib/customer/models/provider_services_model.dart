class ProviderServicesModel {
  int? id;
  String? subCategoryName;
  List<Services>? services;

  ProviderServicesModel({this.id, this.subCategoryName, this.services});

  ProviderServicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryName = json['subCategoryName'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subCategoryName'] = this.subCategoryName;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? id;
  String? name;
  int? timeTakesInMinutes;
  int? price;
  bool? inMyCart;

  Services(
      {this.id, this.name, this.timeTakesInMinutes, this.price, this.inMyCart});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    timeTakesInMinutes = json['timeTakesInMinutes'];
    price = json['price'];
    inMyCart = json['inMyCart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['timeTakesInMinutes'] = this.timeTakesInMinutes;
    data['price'] = this.price;
    data['inMyCart'] = this.inMyCart;
    return data;
  }
}
