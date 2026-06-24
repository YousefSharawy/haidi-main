part of 'workshop_widgets_imports.dart';

class ServicesContent extends StatelessWidget {
  final int mainIndex;
  final int categoryType;
  final WorkshopData workshopData;
  final List<Services> services;
  final String title;

  const ServicesContent(
      {required this.title,
      required this.services,
      required this.workshopData,
      required this.mainIndex,
      required this.categoryType});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xffF3E5E3)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
            child: MyText(
                title: title,
                color: MyColors.primary,
                fontWeight: FontWeight.bold,
                size: 12),
          ),
          width: double.infinity,
        ),
        ServiceItem(
          categoryType: categoryType,
          mainIndex: mainIndex,
          workshopData: workshopData,
          services: services,
        )
      ]),
    );
  }
}
