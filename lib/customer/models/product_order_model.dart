class ProductOrderModel {
  int? orderId;
  String? orderDate;
  String? providerName;
  String? providerImage;

  ProductOrderModel(
      {this.orderId, this.orderDate, this.providerName, this.providerImage});

  ProductOrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderDate = json['orderDate'];
    providerName = json['providerName'];
    providerImage = json['providerImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['orderDate'] = this.orderDate;
    data['providerName'] = this.providerName;
    data['providerImage'] = this.providerImage;
    return data;
  }
}