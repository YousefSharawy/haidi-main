part of 'order_details_widgets_imports.dart';

class ServiceDetailsItem extends StatelessWidget {
  final OrderServices orderServices;

  const ServiceDetailsItem({required this.orderServices});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xffF7F5F5)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: MyText(
                    title: tr(context, 'serviceDetails'),
                    size: 12,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary),
              ),
              Expanded(
                child: MyText(
                    title: '${tr(context, 'orderId')} : ${orderServices.orderId}',
                    size: 12,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    MyText(
                        title: tr(context, 'serviceType') + ' : ',
                        size: 11,
                        color: MyColors.primary),
                    Container(
                      width: 85,
                      child: MyText(
                          title: orderServices.serviceTitle ?? '',
                          size: 11,
                          color: Color(0xffB9A5A4)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    MyText(
                        title: tr(context, 'orderDate') + ' : ',
                        size: 11,
                        color: MyColors.primary),
                    MyText(
                        title: orderServices.orderDate ?? '',
                        size: 11,
                        color: Color(0xffB9A5A4)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    MyText(
                        title: tr(context, 'servicePrice') + ' : ',
                        size: 11,
                        color: MyColors.primary),
                    MyText(
                        title: orderServices.servicePrice!.toString() +
                            ' ' +
                            tr(context, 'sar'),
                        size: 11,
                        color: Color(0xffB9A5A4)),
                  ],
                ),
              ),
              if (orderServices.orderTime != '')
                Expanded(
                  child: Row(
                    children: [
                      MyText(
                          title: tr(context, 'orderTime') + ' : ',
                          size: 11,
                          color: MyColors.primary),
                      MyText(
                          title: orderServices.orderTime ?? '',
                          size: 11,
                          color: Color(0xffB9A5A4)),
                    ],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
