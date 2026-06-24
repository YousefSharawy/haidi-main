part of 'payment_widgets_imports.dart';

class TotalContainer extends StatelessWidget {
  final String providerId;
  final String price;
  final String deliveryPrice;
  final String totalPrice;
  final String tax;
  final String discount;
  final String vatPrice;
  final PaymentData paymentData;

  const TotalContainer(
      {required this.paymentData,
      required this.price,
      required this.deliveryPrice,
      required this.totalPrice,
      required this.tax,
      required this.discount,
      required this.vatPrice,
      required this.providerId});

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
                  title: price + ' ' + tr(context, 'sar'),
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
                          title: discount + ' ' + tr(context, 'sar'),
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
                  title: deliveryPrice + ' ' + tr(context, 'sar'),
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
              MyText(title: vatPrice + ' ' + tr(context, 'sar'), size: 13, color: MyColors.white),
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
                  title: totalPrice + ' ' + tr(context, 'total'),
                  size: 12,
                  color: MyColors.white),
            ],
          ),
          SizedBox(height: 9),
          DefaultButton(
              onTap: () {
                paymentData.createProductOrder(context, providerId, discount);
              },
              title: tr(context, 'goToPay'),
              color: MyColors.white,
              textColor: MyColors.primary,
              margin: EdgeInsets.zero,
              height: 45,
              fontSize: 13,
              borderRadius: BorderRadius.circular(25)),
        ],
      ),
    );
  }
}
