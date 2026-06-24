class GeneralAdModel {
  int? id;
  String? name;
  int? adMainCategoryId;
  String? adImageUrls;
  String? phoneNumber;
  String? description;

  GeneralAdModel(
      {this.id,
      this.name,
      this.adMainCategoryId,
      this.adImageUrls,
      this.phoneNumber,
      this.description});

  GeneralAdModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    adMainCategoryId = json['adMainCategoryId'];
    adImageUrls = json['adImageUrls'];
    phoneNumber = json['phoneNumber'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['adMainCategoryId'] = this.adMainCategoryId;
    data['adImageUrls'] = this.adImageUrls;
    data['phoneNumber'] = this.phoneNumber;
    data['description'] = this.description;
    return data;
  }
}