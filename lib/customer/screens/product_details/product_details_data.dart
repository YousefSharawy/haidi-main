part of 'product_details_imports.dart';

class ProductDetailsData {
  final GenericBloc<int> count = GenericBloc(1);
  final GenericBloc<num> totalPrices = GenericBloc(0);
  final GenericBloc<ProductDetailsModel?> productDetailsModelsCubit =
      GenericBloc(null);

  void increaseCount() {
    count.onUpdateData(count.state.data + 1);
  }

  void decreaseCount() {
    if (count.state.data > 1) count.onUpdateData(count.state.data - 1);
  }

  Future<void> showMyDialog(
      BuildContext context, String productName) async {
    return showDialog<void>(
      useRootNavigator: true,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0),
              child: new Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: MyColors.primary, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(Icons.check,
                                size: 16, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(title: productName, size: 13),
                            SizedBox(height: 4),
                            MyText(
                              title: tr(context, 'inCart'),
                              size: 9,
                              color: Color(0xff8A8A8A),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 7),
                    Container(
                        padding:
                            EdgeInsetsDirectional.only(end: 10, bottom: 10),
                        alignment: AlignmentDirectional.topEnd,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MyText(
                              title: tr(context, 'totalCart'),
                              size: 12,
                              color: MyColors.blackOpacity,
                            ),
                            MyText(
                              title: totalPrices.state.data.toString() +
                                  ' ' +
                                  tr(context, 'sar'),
                              size: 12,
                              color: MyColors.black,
                            ),
                          ],
                        )),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DefaultButton(
                          borderColor: MyColors.primary,
                          color: MyColors.white,
                          textColor: MyColors.primary,
                          borderRadius: BorderRadius.circular(25),
                          height: 35,
                          width: 145,
                          margin: EdgeInsets.zero,
                          onTap: () async {
                            Navigator.of(context).pop();
                          },
                          title: tr(context, 'continueShopping'),
                        ),
                        DefaultButton(
                          borderRadius: BorderRadius.circular(5),
                          height: 35,
                          width: 145,
                          margin: EdgeInsets.zero,
                          onTap: () {
                            Nav.navigateTo( ProductsCart(),
                                navigatorType: NavigatorType.push);
                          },
                          title: tr(context, 'CompleteThePurchase'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Future<ProductDetailsModel?> getProductDetails(
      BuildContext context, String productId) async {
    var productDetails =
        await CustomerRepository(context).getProductDetails(productId);
    productDetailsModelsCubit.onUpdateData(productDetails);
    return productDetailsModelsCubit.state.data;
  }
}
