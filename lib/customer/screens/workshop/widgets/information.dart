part of 'workshop_widgets_imports.dart';

class InformationWidget extends StatelessWidget {
  final String placeName;
  final String cityName;
  final num rate;
  final String description;
  final WorkshopData workshopData;
  final String providerId;
  final double lng;
  final double lat;

  const InformationWidget(
      {required this.placeName,
      required this.cityName,
      required this.rate,
      required this.description,
      required this.workshopData,
      required this.providerId,
      required this.lng,
      required this.lat});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        BuildDetails(placeName: placeName, rate: rate, cityName: cityName),
        BuildDescription(
          description: description,
          workshopData: workshopData,
          providerId: providerId,
          lng: lng,
          lat: lat,
        ),
      ],
    );
  }
}
