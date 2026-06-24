part of 'product_order_details_widgets_imports.dart';

class BuildDetails extends StatelessWidget {
  final String address;
  final String paymentMethod;

  const BuildDetails(
      {Key? key, required this.address, required this.paymentMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffF7F5F5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        title: tr(context, 'shoppingData'),
                        size: 12,
                        color: MyColors.primary),
                    SizedBox(height: 7),
                    MyText(
                        title: tr(context, 'address'),
                        size: 10,
                        color: MyColors.primary),
                    MyText(
                      title: address,
                      size: 10,
                    ),
                  ],
                )),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffF7F5F5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        title: tr(context, 'paymentData'),
                        size: 12,
                        color: MyColors.primary),
                    SizedBox(height: 7),
                    MyText(
                        title: tr(context, 'paymentMethod'),
                        size: 10,
                        color: MyColors.primary),
                    MyText(
                      title: paymentMethod,
                      size: 10,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
