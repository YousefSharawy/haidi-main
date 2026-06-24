part of 'product_order_details_widgets_imports.dart';

class OrderStatus extends StatelessWidget {
  final int status;
  final int orderId;
  final bool isCanceled;
  final ProductOrderDetailsData productOrderDetailsData;

  const OrderStatus(
      {Key? key,
      required this.status,
      required this.productOrderDetailsData,
      required this.orderId,
      required this.isCanceled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget button = Container();
    switch (status) {
      case 1:
        button = MyText(
            alien: TextAlign.center,
            title: tr(context, 'waitingForApproval'),
            size: 12,
            color: MyColors.white);
        break;
      case 2:
        button = DefaultButton(
            onTap: () =>
                productOrderDetailsData.finishMyProductOrder(context, orderId),
            title: tr(context, 'receiptOfTheOrder'),
            color: MyColors.white,
            textColor: MyColors.primary,
            margin: EdgeInsets.zero,
            height: 45,
            fontSize: 13,
            borderRadius: BorderRadius.circular(25));
        break;
      case 3:
        button = Visibility(
          visible: isCanceled,
          child: MyText(
              alien: TextAlign.center,
              title: tr(context, 'notApproved'),
              size: 12,
              color: MyColors.white),
          replacement: DefaultButton(
              onTap: () {
                Nav.navigateTo(Bill(orderId: orderId),
                    navigatorType: NavigatorType.push);
              },
              title: tr(context, 'bill'),
              color: MyColors.white,
              textColor: MyColors.primary,
              margin: EdgeInsets.zero,
              height: 45,
              fontSize: 13,
              borderRadius: BorderRadius.circular(25)),
        );
        break;
    }
    return button;
  }
}
