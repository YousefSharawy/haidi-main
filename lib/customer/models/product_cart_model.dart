class ProductCartModel {
  List<ProductsInCart>? productsInCart;
  String? providerId;
  int? cartId;
  num? priceWithoutAnyThing;
  num? delivery;
  num? vat;
  num? vatPrice;
  num? coponprice;
  num? totalPrice;
  num? productsInCartCount;

  ProductCartModel(
      {this.productsInCart,
        this.providerId,
        this.cartId,
        this.priceWithoutAnyThing,
        this.delivery,
        this.vat,
        this.vatPrice,
        this.coponprice,
        this.totalPrice,
        this.productsInCartCount});

  ProductCartModel.fromJson(Map<String, dynamic> json) {
    if (json['productsInCart'] != null) {
      productsInCart = <ProductsInCart>[];
      json['productsInCart'].forEach((v) {
        productsInCart!.add(new ProductsInCart.fromJson(v));
      });
    }
    providerId = json['providerId'];
    cartId = json['cartId'];
    priceWithoutAnyThing = json['priceWithoutAnyThing'];
    delivery = json['delivery'];
    vat = json['vat'];
    vatPrice = json['vatPrice'];
    coponprice = json['coponprice'];
    totalPrice = json['totalPrice'];
    productsInCartCount = json['productsInCartCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productsInCart != null) {
      data['productsInCart'] =
          this.productsInCart!.map((v) => v.toJson()).toList();
    }
    data['providerId'] = this.providerId;
    data['cartId'] = this.cartId;
    data['priceWithoutAnyThing'] = this.priceWithoutAnyThing;
    data['delivery'] = this.delivery;
    data['vat'] = this.vat;
    data['vatPrice'] = this.vatPrice;
    data['coponprice'] = this.coponprice;
    data['totalPrice'] = this.totalPrice;
    data['productsInCartCount'] = this.productsInCartCount;
    return data;
  }
}

class ProductsInCart {
  int? id;
  int? productId;
  String? image;
  String? title;
  int? unitPrice;
  int? quantity;
  int? delivery;

  ProductsInCart(
      {this.id,
        this.productId,
        this.image,
        this.title,
        this.unitPrice,
        this.quantity,
        this.delivery});

  ProductsInCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    image = json['image'];
    title = json['title'];
    unitPrice = json['unitPrice'];
    quantity = json['quantity'];
    delivery = json['delivery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productId'] = this.productId;
    data['image'] = this.image;
    data['title'] = this.title;
    data['unitPrice'] = this.unitPrice;
    data['quantity'] = this.quantity;
    data['delivery'] = this.delivery;
    return data;
  }
}
