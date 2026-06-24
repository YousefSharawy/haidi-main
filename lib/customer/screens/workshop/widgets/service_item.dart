part of 'workshop_widgets_imports.dart';

class ServiceItem extends StatelessWidget {
  final int mainIndex;
  final int categoryType;
  final List<Services> services;
  final WorkshopData workshopData;

  const ServiceItem({
    required this.workshopData,
    required this.services,
    required this.mainIndex, required this.categoryType,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: services.length,
      itemBuilder: (context, subIndex) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xffE6DBDB)),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Center(
                      child: MyText(
                          title: services[subIndex].name!,
                          size: 10,
                          color: MyColors.primary),
                    ),
                  ),
                  VerticalDivider(
                    color: MyColors.primary,
                    thickness: 1,
                    width: 20,
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: MyText(
                          title: '${services[subIndex].timeTakesInMinutes} ' +
                              tr(context, 'minutes'),
                          size: 10,
                          color: MyColors.primary),
                    ),
                  ),
                  VerticalDivider(
                    color: MyColors.primary,
                    thickness: 1,
                    width: 20,
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: MyText(
                                title: '${services[subIndex].price} ' +
                                    tr(context, 'sar'),
                                size: 10,
                                color: MyColors.primary),
                          ),
                          AddServiceButton(
                            categoryType:categoryType ,
                              workshopData: workshopData,
                              services: services[subIndex],
                              serviceId: services[subIndex].id!,
                              subIndex: subIndex,
                              mainIndex: mainIndex)
                        ]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 10,
        );
      },
    );
  }
}
