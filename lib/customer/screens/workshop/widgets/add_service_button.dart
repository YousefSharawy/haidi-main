part of 'workshop_widgets_imports.dart';

class AddServiceButton extends StatelessWidget {
  final int mainIndex;
  final int subIndex;
  final int categoryType;
  final int serviceId;
  final WorkshopData workshopData;
  final Services services;

  const AddServiceButton(
      {required this.workshopData,
      required this.services,
      required this.mainIndex,
      required this.subIndex,
      required this.serviceId,
      required this.categoryType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: services.inMyCart!
          ? null
          : () {
              final auth = context.read<AuthCubit>().state.authorized;
              if (auth) {
                categoryType == 3
                    ? Nav.navigateTo(
                        DatePicker(
                            workshopData: workshopData,
                            categoryType: categoryType,
                            serviceId: serviceId,
                            mainIndex: mainIndex,
                            subIndex: subIndex),
                        navigatorType: NavigatorType.push)
                    : showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            useRootNavigator: true,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            builder: (context) {
                              return AddServiceButtonDialogItem(
                                  categoryType: categoryType,
                                  workshopData: workshopData,
                                  mainIndex: mainIndex,
                                  subIndex: subIndex,
                                  serviceId: serviceId);
                            })
                        .whenComplete(
                            () => workshopData.inHome.onUpdateData(false));
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomAlertDialog(authDialog: true);
                  },
                );
              }
            },
      child: Container(
        decoration:
            BoxDecoration(color: MyColors.primary, shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(services.inMyCart! ? Icons.check : Icons.add,
              size: 16, color: Colors.white),
        ),
      ),
    );
  }
}
