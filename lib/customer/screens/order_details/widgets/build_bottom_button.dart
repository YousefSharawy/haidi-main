part of 'order_details_widgets_imports.dart';

class BuildBottomButton extends StatelessWidget {
  final int status;
  final int orderId;
  final bool isPaid;
  final bool isRated;
  final bool isExpired;
  final OrderDetailsData orderDetailsData;

  const BuildBottomButton(
      {required this.status,
      this.isPaid = false,
      this.isRated = false,
      this.isExpired = false,
      required this.orderDetailsData,
      required this.orderId});

  @override
  Widget build(BuildContext context) {
    Widget button = Container();
    switch (status) {
      case 1:
        button = Visibility(
          visible: isExpired,
          replacement: Padding(
            padding: const EdgeInsets.all(25.0),
            child: MyText(
                title: tr(context, 'waitingConfirm'),
                size: 15,
                alien: TextAlign.center,
                color: MyColors.primary),
          ),
          child: DefaultButton(
            height: 56,
            margin: EdgeInsets.zero,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            onTap: () =>
                orderDetailsData.showCancelAlertDialog(context, orderId),
            title: tr(context, 'cancelYourOrder'),
          ),
        );
        break;
      case 2:
        button = Visibility(
          visible: isPaid,
          replacement: Padding(
            padding: const EdgeInsets.all(25.0),
            child: MyText(
                title: tr(context, 'payDone'),
                size: 15,
                alien: TextAlign.center,
                color: MyColors.primary),
          ),
          child: DefaultButton(
            height: 56,
            margin: EdgeInsets.zero,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            onTap: () => {},
            title: tr(context, 'payNow'),
          ),
        );
        break;
      case 3:
        button = Visibility(
          visible: !isRated,
          replacement: Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyText(
                    title: tr(context, 'rateDone'),
                    size: 15,
                    alien: TextAlign.center,
                    color: MyColors.primary),
                SizedBox(height: 20),
                DefaultButton(
                  height: 56,
                  margin: EdgeInsets.zero,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  onTap: () {
                    Nav.navigateTo(Bill(orderId: orderId),
                        navigatorType: NavigatorType.push);
                  },
                  title: tr(context, 'bill'),
                ),
              ],
            ),
          ),
          child: DefaultButton(
            height: 56,
            margin: EdgeInsets.zero,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            onTap: () => Nav.navigateTo(
                Rate(orderDetailsData: orderDetailsData, orderId: orderId),
                navigatorType: NavigatorType.push),
            title: tr(context, 'rate'),
          ),
        );
        break;
      case 4:
        button = Padding(
          padding: const EdgeInsets.all(25.0),
          child: MyText(
              title: tr(context, 'cancelOrder'),
              size: 15,
              alien: TextAlign.center,
              color: MyColors.primary),
        );
        break;
    }
    return button;
  }
}
