part of 'product_order_details_widgets_imports.dart';

class TotalContainer extends StatelessWidget {
  final num price;
  final num deliveryPrice;
  final num totalPrice;
  final num tax;
  final num discount;
  final int orderId;
  final int status;
  final bool isCanceled;
  final ProductOrderDetailsData productOrderDetailsData;

  const TotalContainer(
      {required this.productOrderDetailsData,
      required this.price,
      required this.deliveryPrice,
      required this.totalPrice,
      required this.tax,
      required this.discount,
      required this.orderId,
      required this.status,
      required this.isCanceled});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                  title: tr(context, 'totalOrder'),
                  size: 12,
                  color: MyColors.white),
              MyText(
                  title: price.toString() + ' ' + tr(context, 'sar'),
                  size: 12,
                  color: MyColors.white),
            ],
          ),
          SizedBox(height: 5),
          if (discount != '')
            Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                          title: tr(context, 'discount'),
                          size: 12,
                          color: MyColors.white),
                      MyText(
                          title: discount.toString(),
                          size: 12,
                          color: MyColors.white),
                    ]),
                SizedBox(height: 5),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                  title: tr(context, 'deliveryPrice'),
                  size: 12,
                  color: MyColors.white),
              MyText(
                  title: deliveryPrice.toString() + ' ' + tr(context, 'sar'),
                  size: 12,
                  color: MyColors.white),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                  title: tr(context, 'tax'), size: 12, color: MyColors.white),
              MyText(
                  title: '${tax.toString()}%', size: 13, color: MyColors.white),
            ],
          ),
          SizedBox(height: 5),
          Divider(color: MyColors.white),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                  title: tr(context, 'total'), size: 12, color: MyColors.white),
              MyText(
                  title: totalPrice.toString() + ' ' + tr(context, 'sar'),
                  size: 12,
                  color: MyColors.white),
            ],
          ),
          SizedBox(height: 9),
          OrderStatus(
              isCanceled: isCanceled,
              status: status,
              productOrderDetailsData: productOrderDetailsData,
              orderId: orderId)
        ],
      ),
    );
  }
}
