part of 'workshop_widgets_imports.dart';

class AddServiceButtonDialogItem extends StatelessWidget {
  final int mainIndex;
  final int subIndex;
  final int serviceId;
  final int categoryType;
  final WorkshopData workshopData;

  const AddServiceButtonDialogItem(
      {required this.workshopData,
      required this.mainIndex,
      required this.subIndex,
      required this.serviceId,
      required this.categoryType});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: workshopData.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                    title: tr(context, 'determineDate'),
                    size: 12,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary),
                OpenContainer(
                    closedColor: Colors.transparent,
                    openColor: Colors.transparent,
                    closedElevation: 0,
                    transitionDuration: Duration(milliseconds: 500),
                    closedBuilder: (ctx, action) {
                      return BlocBuilder<GenericBloc<String>,
                          GenericState<String>>(
                        bloc: workshopData.selectedDateCubit,
                        builder: (context, state) {
                          return GenericTextField(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            hintColor: Color(0xffB9A5A4),
                            fieldTypes: FieldTypes.clickable,
                            hint: tr(context, 'determineDate'),
                            controller: workshopData.dateController,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            suffixIcon: Icon(Icons.calendar_month,
                                size: 18, color: MyColors.primary),
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            validate: (value) => value!.validateEmpty(context),
                          );
                        },
                      );
                    },
                    openBuilder: (ctx, index) {
                      return DatePicker(workshopData: workshopData);
                    }),
                MyText(
                    title: tr(context, 'determineTime'),
                    size: 12,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary),
                OpenContainer(
                    closedColor: Colors.transparent,
                    openColor: Colors.transparent,
                    closedElevation: 0,
                    transitionDuration: Duration(milliseconds: 500),
                    closedBuilder: (ctx, action) {
                      return BlocBuilder<GenericBloc<String>,
                          GenericState<String>>(
                        bloc: workshopData.selectedDateCubit,
                        builder: (context, state) {
                          return GenericTextField(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            hintColor: Color(0xffB9A5A4),
                            fieldTypes: FieldTypes.clickable,
                            hint: tr(context, 'determineTime'),
                            controller: workshopData.timeController,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            suffixIcon: Icon(Icons.access_time,
                                size: 18, color: MyColors.primary),
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            validate: (value) => value!.validateEmpty(context),
                          );
                        },
                      );
                    },
                    openBuilder: (ctx, index) {
                      return CupertinoTimePicker(workshopData: workshopData);
                    }),
                if (categoryType == 4)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                          title: tr(context, 'determineAddress'),
                          size: 12,
                          fontWeight: FontWeight.bold,
                          color: MyColors.primary),
                      BuildAddressRadioButton(workshopData: workshopData),
                      BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                        bloc: workshopData.inHome,
                        builder: (context, inHomeState) {
                          return Visibility(
                            visible: inHomeState.data,
                            child: BlocConsumer<LocationCubit, LocationState>(
                              bloc: workshopData.locationCubit,
                              listener: (_, state) {
                                workshopData.address =
                                    state.model?.address ?? "";
                                workshopData.lat = state.model?.lat.toString();
                                workshopData.lng = state.model?.lng.toString();
                                workshopData.location.text =
                                    state.model?.address ?? "";
                              },
                              builder: (_, state) {
                                return GenericTextField(
                                  fieldTypes: FieldTypes.clickable,
                                  hint: tr(context, 'determineAddress'),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  type: TextInputType.name,
                                  controller: workshopData.location,
                                  validate: (value) =>
                                      value!.validateEmpty(context),
                                  action: TextInputAction.next,
                                  suffixIcon: Icon(Icons.location_on,
                                      color: MyColors.primary),
                                  onTab: () =>
                                      workshopData.onLocationClick(context),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        DefaultButton(
          height: 56,
          margin: EdgeInsets.zero,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          onTap: () => workshopData.addServiceToCart(
              context, mainIndex, subIndex, serviceId),
          title: tr(context, 'confirm'),
        ),
      ],
    );
  }
}
