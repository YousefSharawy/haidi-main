part of 'reservation_confirmation_widgets_imports.dart';

class WorkShopItem extends StatelessWidget {
  final String image;
  final String placeName;
  final String location;

  const WorkShopItem(
      {required this.image, required this.placeName, required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  SizedBox(height: 7),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          color: MyColors.primary, size: 17),
                      MyText(
                        title: location,
                        size: 9,
                        color: MyColors.primary,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Divider(
            color: Color(0xff5D34367F),
            height: 3,
            thickness: 1,
          ),
        )
      ],
    );
  }
}
