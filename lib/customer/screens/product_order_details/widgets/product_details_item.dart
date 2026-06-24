part of 'product_order_details_widgets_imports.dart';

class ProductDetailsItem extends StatelessWidget {
  final String productName;
  final String image;
  final num price;
  final int quantity;

  const ProductDetailsItem(
      {Key? key,
      required this.productName,
      required this.price,
      required this.quantity, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xffF7F5F5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                      title: tr(context, 'productDetails'),
                      size: 11,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primary),
                  Row(
                    children: [
                      MyText(
                          title: tr(context, 'productName') + ' : ',
                          size: 11,
                          color: MyColors.primary),
                      MyText(
                          title: productName,
                          size: 11,
                          color: Color(0xffB9A5A4)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          MyText(
                              title: tr(context, 'price') + ' :',
                              size: 10,
                              color: MyColors.primary),
                          MyText(
                              title:
                                  price.toString() + ' : ' + tr(context, 'sar'),
                              size: 10,
                              color: Color(0xffB9A5A4)),
                        ],
                      ),
                      Row(
                        children: [
                          MyText(
                              title: tr(context, 'qty') + ' : ',
                              size: 10,
                              color: MyColors.primary),
                          MyText(
                              title: quantity.toString(),
                              size: 10,
                              color: Color(0xffB9A5A4)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CachedImage(
              width: 70,
              height: 70,
              borderRadius: BorderRadius.circular(70),
              fit: BoxFit.cover,
              url:image
                  ),
        ],
      ),
    );
  }
}
