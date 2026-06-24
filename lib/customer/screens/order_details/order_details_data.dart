part of 'order_details_imports.dart';

class OrderDetailsData {
  final GenericBloc<ServiceOrderDetailsModel?> serviceOrderDetailsModelsCubit =
      GenericBloc(null);

  Future<ServiceOrderDetailsModel?> getOrderDetailsForUser(
      BuildContext context, int orderId) async {
    var orderDetails =
        await CustomerRepository(context).getOrderDetailsForUser(orderId);
    serviceOrderDetailsModelsCubit.onUpdateData(orderDetails);
    return serviceOrderDetailsModelsCubit.state.data;
  }

  void cancelOrder(BuildContext context, int orderId) async {
    var data = await CustomerRepository(context).cancelMyServiceOrder(orderId);
    if (data) {
      Nav.navigateTo(Home(), navigatorType: NavigatorType.pushAndPopUntil);
    }
  }

  void showCancelAlertDialog(BuildContext context, int orderId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BuildCancelOrderAlertDialog(
          orderDetailsData: this,
          orderId: orderId,
        );
      },
    );
  }

  int? rate;

  void rateOrder(BuildContext context, int orderId, int rate) async {
    var data =
        await CustomerRepository(context).rateServiceOrder(orderId, rate);
    if (data) {
      Nav.navigateTo(OrderDetails(orderId: orderId),
          navigatorType: NavigatorType.pushAndPopUntil);
    }
  }
}
