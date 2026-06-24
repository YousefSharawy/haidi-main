part of 'product_order_details_imports.dart';

class ProductOrderDetailsData {
  final GenericBloc<ProductOrderDetailsModel?> productOrderDetailsModelCubit =
      GenericBloc(null);

  Future<ProductOrderDetailsModel?> getProductOrderDetailsForUser(
      BuildContext context, int orderId) async {
    var orderDetails = await CustomerRepository(context)
        .getProductOrderDetailsForUser(orderId);
    productOrderDetailsModelCubit.onUpdateData(orderDetails);
    return productOrderDetailsModelCubit.state.data;
  }

  void finishMyProductOrder(BuildContext context, int orderId) async {
    var data = await CustomerRepository(context).finishMyProductOrder(orderId);
    if (data) {
      Nav.navigateTo( Home(),
          navigatorType: NavigatorType.pushAndPopUntil);
    }
  }
}
