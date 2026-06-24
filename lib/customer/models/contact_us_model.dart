class ContactUsModel {
  List<SociaMedias>? sociaMedias;
  String? phoneNumber;

  ContactUsModel({this.sociaMedias, this.phoneNumber});

  ContactUsModel.fromJson(Map<String, dynamic> json) {
    if (json['sociaMedias'] != null) {
      sociaMedias = <SociaMedias>[];
      json['sociaMedias'].forEach((v) {
        sociaMedias!.add(new SociaMedias.fromJson(v));
      });
    }
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sociaMedias != null) {
      data['sociaMedias'] = this.sociaMedias!.map((v) => v.toJson()).toList();
    }
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}

class SociaMedias {
  int? id;
  String? name;
  String? img;
  String? url;

  SociaMedias({this.id, this.name, this.img, this.url});

  SociaMedias.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['url'] = this.url;
    return data;
  }
}