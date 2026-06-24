class ProviderDatesModel {
  int? id;
  int? day;
  String? dayName;
  String? from;
  String? to;
  bool? isClosed;

  ProviderDatesModel({this.id, this.day, this.dayName, this.from, this.to , this.isClosed});

  ProviderDatesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    dayName = json['dayName'];
    from = json['from'];
    to = json['to'];
    isClosed = json['isClosed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['dayName'] = this.dayName;
    data['from'] = this.from;
    data['to'] = this.to;
    data['isClosed'] = this.isClosed;
    return data;
  }
}
