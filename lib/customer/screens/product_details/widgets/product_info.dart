part of 'product_details_widgets_imports.dart';

class ProductInfo extends StatelessWidget {
  final String productName;
  final String providerName;
  final num price;
  final ProductDetailsData productDetailsData;

  const ProductInfo(
      {required this.productDetailsData,
      required this.productName,
      required this.providerName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: productName,
                size: 12,
                fontWeight: FontWeight.bold,
              ),
              MyText(
                title: providerName,
                fontWeight: FontWeight.bold,
                size: 12,
                color: MyColors.primary,
                decoration: TextDecoration.underline,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: MyText(
                title: price.toString() + ' ' + tr(context, 'sar'),
                size: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xff9A9A9A),
              )),
              Row(
                children: [
                  InkWell(
                    onTap: productDetailsData.increaseCount,
                    child: Container(
                      decoration: BoxDecoration(
                          color: MyColors.primary, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Icon(Icons.add, size: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  BlocBuilder<GenericBloc<int>, GenericState<int>>(
                    bloc: productDetailsData.count,
                    builder: (context, state) {
                      return MyText(title: state.data.toString(), size: 12);
                    },
                  ),
                  SizedBox(width: 15),
                  InkWell(
                    onTap: productDetailsData.decreaseCount,
                    child: Container(
                      decoration: BoxDecoration(
                          color: MyColors.primary, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child:
                            Icon(Icons.remove, size: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
