class CartServiceModel {
  String? id;
  String? providerName;
  int? rate;
  String? location;
  String? image;

  CartServiceModel(
      {this.id, this.providerName, this.rate, this.location, this.image});

  CartServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerName = json['providerName'];
    rate = json['rate'];
    location = json['location'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['providerName'] = this.providerName;
    data['rate'] = this.rate;
    data['location'] = this.location;
    data['image'] = this.image;
    return data;
  }
}