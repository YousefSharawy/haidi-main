class ProductDetailsModel {
  int? id;
  String? title;
  int? price;
  String? productImage;
  String? providerName;
  String? description;
  List<String>? features;

  ProductDetailsModel(
      {this.id,
        this.title,
        this.price,
        this.productImage,
        this.providerName,
        this.description,
        this.features});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    productImage = json['productImage'];
    providerName = json['providerName'];
    description = json['description'];
    features = json['features'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['productImage'] = this.productImage;
    data['providerName'] = this.providerName;
    data['description'] = this.description;
    data['features'] = this.features;
    return data;
  }
}
