part of 'general_ads_widgets_imports.dart';

class GeneralAdCard extends StatelessWidget {
  final String image;
  final String title;
  final int id;
  final GeneralAdModel adModel;
  final GeneralAdsData generalAdsData;
  const GeneralAdCard(
      {required this.image,
      required this.title,
      required this.generalAdsData,
      required this.id, required this.adModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Nav.navigateTo(AdDetails(id: adModel.id??0,),navigatorType: NavigatorType.push),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5)),
              child: CachedImage(
                  height: 140,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  fit: BoxFit.cover,
                  url: image),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    title: title,
                    size: 11,
                    color: MyColors.blackOpacity,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
