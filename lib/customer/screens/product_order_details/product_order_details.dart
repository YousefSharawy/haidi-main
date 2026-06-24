part of 'product_order_details_imports.dart';

class ProductOrderDetails extends StatefulWidget {
  final int orderId;

  const ProductOrderDetails({required this.orderId});

  @override
  State<ProductOrderDetails> createState() => _ProductOrderDetailsState();
}

class _ProductOrderDetailsState extends State<ProductOrderDetails> {
  final ProductOrderDetailsData productOrderDetailsData =
      ProductOrderDetailsData();

  @override
  void initState() {
    productOrderDetailsData.getProductOrderDetailsForUser(
        context, widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<ProductOrderDetailsModel?>,
        GenericState<ProductOrderDetailsModel?>>(
      bloc: productOrderDetailsData.productOrderDetailsModelCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return HomeScaffold(
            children: [
              DefaultAppBar(title: tr(context, 'orderDetails')),
              Flexible(
                  child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15),
                children: [
                  ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.data!.orderProducts!.length,
                      itemBuilder: (context, index) {
                        return ProductDetailsItem(
                          productName:
                              state.data!.orderProducts![index].productTitle!,
                          price: state.data!.orderProducts![index].price!,
                          quantity: state.data!.orderProducts![index].quantity!,
                          image:
                              state.data!.orderProducts![index].productImage!,
                        );
                      }),
                  BuildDetails(
                      address: state.data!.address!,
                      paymentMethod: state.data!.paymentType!.toString())
                  // TotalContainer()
                ],
              ))
            ],
            bottom: TotalContainer(
              orderId: state.data!.orderId!,
              status: state.data!.status!,
              isCanceled: state.data!.isCanceled!,
              productOrderDetailsData: productOrderDetailsData,
              deliveryPrice: state.data!.delivery!,
              discount: state.data!.discount!,
              price: state.data!.totalPricesWithoutAnything!,
              tax: state.data!.vat!,
              totalPrice: state.data!.totalPrice!,
            ),
          );
        } else {
          return Center(
              child: CircularProgressIndicator(color: MyColors.primary));
        }
      },
    );
  }
}
