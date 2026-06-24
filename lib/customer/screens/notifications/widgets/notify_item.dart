part of 'notifications_widgets_imports.dart';

class NotificationItem extends StatelessWidget {
  final String text;
  final int orderType;
  final int orderId;

  const NotificationItem(
      {Key? key,
      required this.text,
      required this.orderType,
      required this.orderId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (orderId != 0) {
          orderType == 0
              ? Nav.navigateTo(OrderDetails(orderId: orderId),
                  navigatorType: NavigatorType.push)
              : Nav.navigateTo(ProductOrderDetails(orderId: orderId),
                  navigatorType: NavigatorType.push);
        }
      },
      child: Row(
        children: [
          Expanded(
            child: MyText(
                alien: TextAlign.center,
                title: text,
                size: 12,
                color: MyColors.primary),
          ),
        ],
      ),
    );
  }
}
