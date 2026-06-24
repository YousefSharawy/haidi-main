class SearchModel {
  List<SearchResult>? searchResult;

  SearchModel({this.searchResult});

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json['searchResult'] != null) {
      searchResult = <SearchResult>[];
      json['searchResult'].forEach((v) {
        searchResult!.add(new SearchResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.searchResult != null) {
      data['searchResult'] = this.searchResult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchResult {
  int? searchType;
  String? type;
  String? id;
  String? providerId;
  String? name;
  String? imgUrl;
  String? placeName;
  String? cityName;
  num? rate;
  String? description;
  String? providerName;
  String? providerImage;
  int? categoryType;
  String? categoryName;
  var lat;
  var lng;

  SearchResult({
    this.searchType,
    this.type,
    this.id,
    this.providerId,
    this.name,
    this.imgUrl,
    this.placeName,
    this.cityName,
    this.rate,
    this.description,
    this.providerName,
    this.providerImage,
    this.categoryType,
    this.categoryName,
    this.lng,
    this.lat,
  });

  SearchResult.fromJson(Map<String, dynamic> json) {
    searchType = json['searchType'];
    type = json['type'];
    id = json['id'];
    providerId = json['providerId'];
    name = json['name'];
    imgUrl = json['imgUrl'];
    placeName = json['placeName'];
    cityName = json['cityName'];
    rate = json['rate'];
    description = json['description'];
    providerName = json['providerName'];
    providerImage = json['providerImage'];
    categoryType = json['categoryType'];
    categoryName = json['categoryName'];
    lng = json['lng'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchType'] = this.searchType;
    data['type'] = this.type;
    data['id'] = this.id;
    data['providerId'] = this.providerId;
    data['name'] = this.name;
    data['imgUrl'] = this.imgUrl;
    data['placeName'] = this.placeName;
    data['cityName'] = this.cityName;
    data['rate'] = this.rate;
    data['description'] = this.description;
    data['providerName'] = this.providerName;
    data['providerImage'] = this.providerImage;
    data['categoryType'] = this.categoryType;
    data['categoryName'] = this.categoryName;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    return data;
  }
}
