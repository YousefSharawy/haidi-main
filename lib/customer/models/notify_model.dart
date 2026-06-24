class NotifyModel {
  int? id;
  String? text;
  int? orderId;
  int? orderType;

  NotifyModel({this.id, this.text, this.orderId, this.orderType});

  NotifyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    orderId = json['orderId'];
    orderType = json['orderType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['orderId'] = this.orderId;
    data['orderType'] = this.orderType;
    return data;
  }
}