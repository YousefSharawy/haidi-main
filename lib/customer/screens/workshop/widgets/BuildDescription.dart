part of 'workshop_widgets_imports.dart';

class BuildDescription extends StatelessWidget {
  final String providerId;
  final WorkshopData workshopData;
  final String description;
  final double lng;
  final double lat;

  const BuildDescription(
      {required this.description,
      required this.workshopData,
      required this.providerId,
      required this.lng,
      required this.lat});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        MyText(
            title: tr(context, "description"),
            color: MyColors.primary,
            size: 11),
        Container(
          margin:
              const EdgeInsets.only(top: 5, bottom: 10, left: 20, right: 20),
          child: MyText(title: description, color: MyColors.primary, size: 8),
        ),
        SizedBox(height: 10),
        WorksTime(
          workshopData: workshopData,
          providerId: providerId,
        ),
        SizedBox(height: 50),
        BuildMapLayoutBuilder(
          lat: lat,
          lng: lng,
        )
        // Image.asset(Res.mapImage)
      ],
    );
  }
}
