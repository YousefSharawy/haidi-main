part of 'cart_widgets_imports.dart';

class CartItem extends StatelessWidget {
  final String providerId;
  final String image;
  final int rate;
  final String placeName;
  final String location;
  final bool showRate;

  const CartItem(
      {required this.showRate,
      required this.image,
      required this.rate,
      required this.placeName,
      required this.location,
      required this.providerId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Nav.navigateTo(
          ReservationConfirmation(providerId: providerId),
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
                      title: placeName,
                      color: MyColors.primary,
                      size: 11,
                      fontWeight: FontWeight.bold,
                    ),
                    showRate
                        ? RatingBar.builder(
                            itemSize: 11,
                            initialRating: 0.0,
                            minRating: rate.toDouble(),
                            allowHalfRating: true,
                            itemCount: 5,
                            ignoreGestures: true,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1),
                            itemBuilder: (context, _) =>
                                const Icon(Icons.star, color: Colors.amber),
                            onRatingUpdate: (rating) => print(rating),
                          )
                        : SizedBox(height: 7),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            color: MyColors.primary, size: 17),
                        Container(
                          width: 230,
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
