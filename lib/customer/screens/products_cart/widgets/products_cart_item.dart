part of 'products_cart_widgets_imports.dart';

class ProductsCartItem extends StatelessWidget {
  final int index;
  final int quantity;
  final ProductsInCart productsInCart;
  final ProductsCartData productsCartData;

  const ProductsCartItem(
      {required this.productsCartData,
      required this.productsInCart,
      required this.index,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(children: [
            CachedImage(
                width: 100,
                height: 85,
                borderRadius: BorderRadius.circular(15),
                fit: BoxFit.cover,
                url: productsInCart.image ?? ''),
            SizedBox(width: 10),
            Container(
              height: 85,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      title: productsInCart.title ?? "",
                      size: 10,
                      color: Color(0xff4B4B4B),
                    ),
                    MyText(
                        title: productsInCart.unitPrice.toString() +
                            ' ' +
                            tr(context, 'sar'),
                        size: 10,
                        color: MyColors.primary),
                    Row(children: [
                      MyText(
                          title: tr(context, 'qty'),
                          size: 10,
                          color: Color(0xff676767)),
                      SizedBox(width: 15),
                      Row(
                        children: [
                          InkWell(
                            onTap: () => productsCartData.increaseCount(
                                index,
                                productsInCart.productId!,
                                productsInCart.quantity!,
                                context),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: MyColors.primary,
                                  shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(Icons.add,
                                    size: 15, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          MyText(
                              title: productsInCart.quantity.toString(),
                              size: 12),
                          SizedBox(width: 15),
                          InkWell(
                            onTap: () => productsCartData.decreaseCount(
                                index,
                                productsInCart.productId!,
                                productsInCart.quantity!,
                                context,
                                productsInCart.id!),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: MyColors.primary,
                                  shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(Icons.remove,
                                    size: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ])
                  ]),
            ),
          ]),
        ),
        InkWell(
            onTap: () => productsCartData.removeItemFromCart(
                context, productsInCart.id!),
            child: Icon(Icons.close, color: MyColors.primary))
      ],
    );
  }
}
