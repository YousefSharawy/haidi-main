part of 'products_widgets_imports.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final String providerName;
  final String date;
  final int orderId;

  const ProductItem(
      {Key? key,
      required this.image,
      required this.providerName,
      required this.date,
      required this.orderId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Nav.navigateTo(ProductOrderDetails(orderId: orderId),
          navigatorType: NavigatorType.push),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CachedImage(
                    width: 72,
                    height: 72,
                    borderRadius: BorderRadius.circular(72),
                    url: image),
                SizedBox(width: 10),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      title: providerName,
                      color: MyColors.primary,
                      size: 11,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            MyText(
                              title: tr(context, 'orderDate') + ' : ',
                              size: 9,
                              color: MyColors.primary,
                              overflow: TextOverflow.ellipsis,
                            ),
                            MyText(
                              title: date,
                              size: 9,
                              color: Color(0xffB9A5A4),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyText(
                              title: tr(context, 'orderId') + " :",
                              size: 9,
                              color: MyColors.primary,
                              overflow: TextOverflow.ellipsis,
                            ),
                            MyText(
                              title: orderId.toString(),
                              size: 9,
                              color: MyColors.primary,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
