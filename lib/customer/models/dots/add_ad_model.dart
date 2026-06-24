// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

class AddAdModel {
  int? id;
  String? nameAr;
  String? nameEn;
  int? adMainCategoryId;
  File? adImgUrl;
  String? phoneNumber;
  String? descriptionAr;
  String? descriptionEn;
  AddAdModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.adMainCategoryId,
    this.adImgUrl,
    this.phoneNumber,
    this.descriptionAr,
    this.descriptionEn,
  });

  Map<String, dynamic> toJson() => {
        "id":id,
        "NameAr": nameAr,
        "NameEn": nameEn,
        "AdMainCategoryId": adMainCategoryId,
        "AdImage": adImgUrl,
        "PhoneNumber": phoneNumber,
        "DescriptionAr": descriptionAr,
        "DescriptionEn": descriptionEn,
      };

}
