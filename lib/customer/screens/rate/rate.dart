part of 'rate_imports.dart';

class Rate extends StatelessWidget {
  final int orderId;
  final OrderDetailsData orderDetailsData;

  const Rate({required this.orderDetailsData, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(children: [
      DefaultAppBar(title: tr(context, 'rateOrder')),
      Flexible(
          child: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar.builder(
                itemSize: 50,
                minRating: 0,
                allowHalfRating: false,
                itemCount: 5,
                ignoreGestures: false,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {
                  orderDetailsData.rate = rating.toInt();
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                  onTap: () => orderDetailsData.rateOrder(
                      context, orderId, orderDetailsData.rate ?? 0),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5
                    ),
                    decoration: BoxDecoration(
                      color: MyColors.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: MyText(
                        title: tr(context, 'sendRate'),
                        size: 15,
                        color: MyColors.white),
                  )),
            ],
          ),
        ),
      ))
    ]);
  }
}
