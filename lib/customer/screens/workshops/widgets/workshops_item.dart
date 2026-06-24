part of 'workshops_widgets_imports.dart';

class WorkshopsItem extends StatelessWidget {
  final int serviceId;
  final int categoryType;
  final String image;
  final String providerId;
  final String placeName;
  final String providerImage;
  final num rate;
  final String cityName;
  final String description;
  final String providerName;
  final bool showRate;
  final String location;
  final double lng;
  final double lat;

  const WorkshopsItem(
      {required this.showRate,
      required this.serviceId,
      required this.image,
      required this.placeName,
      required this.cityName,
      required this.providerId,
      required this.rate,
      required this.description,
      required this.providerName,
      required this.providerImage,
      required this.categoryType,
      required this.location,
      required this.lng,
      required this.lat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Nav.navigateTo(
          Workshop(
            categoryType: categoryType,
            providerImage: providerImage,
            providerId: providerId,
            placeName: placeName,
            rate: rate,
            providerName: providerName,
            cityName: cityName,
            description: description,
            lng: lng,
            lat: lat,
          ),
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
                    showRate
                        ? RatingBar.builder(
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
                              fontSize: 9,
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
