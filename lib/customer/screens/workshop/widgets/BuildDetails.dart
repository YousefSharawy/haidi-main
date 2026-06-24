part of 'workshop_widgets_imports.dart';

class BuildDetails extends StatelessWidget {
  final String placeName;
  final String cityName;
  final num rate;

  const BuildDetails(
      {required this.placeName, required this.rate, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              title: placeName,
              color: MyColors.primary,
              size: 11,
              fontWeight: FontWeight.bold,
            ),
            RatingBar(
              itemSize: 12,
              initialRating: rate.toDouble(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ignoreGestures: true,
              ratingWidget: RatingWidget(
                full: Image.asset(Res.star),
                half: Image.asset(Res.halfStar),
                empty: Image.asset(Res.outlineStar),
              ),
              itemPadding: EdgeInsets.symmetric(horizontal: 1),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 10),
          child: Row(
            children: [
              Icon(Icons.location_on, color: MyColors.primary, size: 15),
              Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: MyText(
                      title: cityName, color: MyColors.primary, size: 9)),
            ],
          ),
        ),
      ],
    );
  }
}
