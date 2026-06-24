part of 'products_cart_imports.dart';

class ProductsCart extends StatefulWidget {
  const ProductsCart();

  @override
  State<ProductsCart> createState() => _ProductsCartState();
}

class _ProductsCartState extends State<ProductsCart> {
  final ProductsCartData productsCartData = ProductsCartData();

  @override
  void initState() {
    productsCartData.getProductCart(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.read<LangCubit>().state.locale.languageCode;

    return BlocBuilder<GenericBloc<ProductCartModel?>,
        GenericState<ProductCartModel?>>(
      bloc: productsCartData.productCartModelsCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          print("vatPrice>>> ${state.data!.vatPrice.toString()}");
          return HomeScaffold(
            children: [
              DefaultAppBar(title: tr(context, 'cart')),
              Flexible(
                  child: state.data!.productsInCart!.isNotEmpty
                      ? ListView(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                          children: [
                            MyText(
                                title: lang == 'en'
                                    ? '${state.data!.productsInCartCount!} items have been added to cart'
                                    : ' تم إضافة ${state.data!.productsInCartCount!} منتجات رلى السلة',
                                size: 13),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => ProductsCartItem(
                                productsCartData: productsCartData,
                                productsInCart:
                                    state.data!.productsInCart![index],
                                index: index,
                                quantity: index,
                              ),
                              itemCount: state.data!.productsInCart!.length,
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 15),
                            ),
                            DiscountTextField(
                                productsCartData: productsCartData),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Res.emptyCart, scale: 4),
                            SizedBox(height: 25),
                            MyText(
                                alien: TextAlign.center,
                                title: tr(context, 'noProductsInCart'),
                                size: 18,
                                color: MyColors.primary),
                          ],
                        )),
            ],
            bottom: state.data!.productsInCart!.isNotEmpty
                ? TotalContainer(
                    deliveryPrice: state.data!.delivery.toString(),
                    price: state.data!.priceWithoutAnyThing.toString(),
                    totalPrice: state.data!.totalPrice.toString(),
                    tax: state.data!.vat.toString(),
                    productsCartData: productsCartData,
                    providerId: state.data!.providerId ?? '',
                    vatPrice: state.data!.vatPrice.toString(),
                  )
                : DefaultButton(
                    title: tr(context, 'goToShopping'),
                    height: 56,
                    margin: EdgeInsets.zero,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    onTap: () => Nav.navigateTo(Store(),
                        navigatorType: NavigatorType.push),
                  ),
          );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: CircularProgressIndicator(color: MyColors.primary),
            ),
          );
        }
      },
    );
  }
}
