part of 'ReservationsWidgetsImports.dart';

class ReservationItem extends StatelessWidget {
  final int orderId;
  final String image;
  final String providerName;
  final String location;
  final int rate;
  final bool showRate;

  const ReservationItem({
    required this.showRate,
    required this.image,
    required this.providerName,
    required this.rate,
    required this.location,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Nav.navigateTo(OrderDetails(orderId: orderId),
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
                  url: image,
                ),
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
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            color: MyColors.primary, size: 17),
                        Container(
                          width: 140,
                          child: Text(
                            location,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 10,
                              color: MyColors.primary,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    showRate
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                                itemSize: 11,
                                initialRating: rate.toDouble(),
                                minRating: 1,
                                allowHalfRating: true,
                                itemCount: 5,
                                ignoreGestures: true,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1),
                                itemBuilder: (context, _) =>
                                    const Icon(Icons.star, color: Colors.amber),
                                onRatingUpdate: (rating) => print(rating),
                              ),
                            Row(
                              children: [
                                MyText(
                                  title: '${tr(context, 'orderId')} : ${orderId}',
                                  size: 10,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.primary,
                                ),
                              ],
                            ),
                          ],
                        )
                        : SizedBox(height: 7),
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
