class ProductModel {
  Pagination? pagination;
  List<MarketProducts>? marketProducts;

  ProductModel({this.pagination, this.marketProducts});

  ProductModel.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['marketProducts'] != null) {
      marketProducts = <MarketProducts>[];
      json['marketProducts'].forEach((v) {
        marketProducts!.add(new MarketProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    if (this.marketProducts != null) {
      data['marketProducts'] =
          this.marketProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? currentPage;
  int? allItemCount;
  int? itemCountInCurrentPage;
  int? allPages;
  bool? next;

  Pagination(
      {this.currentPage,
        this.allItemCount,
        this.itemCountInCurrentPage,
        this.allPages,
        this.next});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    allItemCount = json['allItemCount'];
    itemCountInCurrentPage = json['itemCountInCurrentPage'];
    allPages = json['allPages'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['allItemCount'] = this.allItemCount;
    data['itemCountInCurrentPage'] = this.itemCountInCurrentPage;
    data['allPages'] = this.allPages;
    data['next'] = this.next;
    return data;
  }
}

class MarketProducts {
  int? id;
  String? image;
  String? providerName;
  String? title;
  int? price;
  int? availableCount;
  String? providerId;
  int? providertype;
  int? rate;
  bool? dashboardConfirmed;

  MarketProducts(
      {this.id,
        this.image,
        this.providerName,
        this.title,
        this.price,
        this.availableCount,
        this.providerId,
        this.providertype,
        this.rate,
        this.dashboardConfirmed});

  MarketProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    providerName = json['providerName'];
    title = json['title'];
    price = json['price'];
    availableCount = json['availableCount'];
    providerId = json['providerId'];
    providertype = json['providertype'];
    rate = json['rate'];
    dashboardConfirmed = json['dashboardConfirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['providerName'] = this.providerName;
    data['title'] = this.title;
    data['price'] = this.price;
    data['availableCount'] = this.availableCount;
    data['providerId'] = this.providerId;
    data['providertype'] = this.providertype;
    data['rate'] = this.rate;
    data['dashboardConfirmed'] = this.dashboardConfirmed;
    return data;
  }
}