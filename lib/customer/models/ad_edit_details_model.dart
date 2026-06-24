class AdEditDetailsModel {
  int? id;
  String? nameAr;
  String? nameEn;
  int? adMainCategoryId;
  String? oldImage;
  String? phoneNumber;
  String? descriptionAr;
  String? descriptionEn;

  AdEditDetailsModel(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.adMainCategoryId,
      this.oldImage,
      this.phoneNumber,
      this.descriptionAr,
      this.descriptionEn});

  AdEditDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    adMainCategoryId = json['adMainCategoryId'];
    oldImage = json['oldImage'];
    phoneNumber = json['phoneNumber'];
    descriptionAr = json['descriptionAr'];
    descriptionEn = json['descriptionEn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameAr'] = this.nameAr;
    data['nameEn'] = this.nameEn;
    data['adMainCategoryId'] = this.adMainCategoryId;
    data['oldImage'] = this.oldImage;
    data['phoneNumber'] = this.phoneNumber;
    data['descriptionAr'] = this.descriptionAr;
    data['descriptionEn'] = this.descriptionEn;
    return data;
  }
}
