part of 'date_picker_imports.dart';

class DatePicker extends StatefulWidget {
  final int mainIndex;
  final int subIndex;
  final int serviceId;
  final WorkshopData workshopData;
  final int categoryType;

  const DatePicker(
      {required this.workshopData,
      this.categoryType = 0,
      this.mainIndex = 0,
      this.subIndex = 0,
      this.serviceId = 0});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final DatePickerData datePickerData = DatePickerData();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<DateTime>, GenericState<DateTime>>(
        bloc: widget.workshopData.dateCubit,
        builder: (context, stateDate) {
          return BlocBuilder<GenericBloc<int>, GenericState<int>>(
              bloc: datePickerData.index,
              builder: (context, state) {
                return HomeScaffold(
                  children: [
                    DefaultAppBar(title: tr(context, 'determineDate')),
                    Flexible(
                        child: ListView(
                      padding: EdgeInsets.only(
                          left: 15, bottom: 40, right: 15, top: 20),
                      children: [
                        DatePickerTabBar(datePickerData: datePickerData),
                        state.data == 0
                            ? GregoriaDate(
                                dateTime: stateDate.data,
                                workshopData: widget.workshopData)
                            : HijriDate(
                                hijriDateTime: HijriDateTime.now(),
                                workshopData: widget.workshopData,
                              )
                      ],
                    )),
                  ],
                  bottom: DefaultButton(
                    height: 56,
                    margin: EdgeInsets.zero,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    onTap: () => state.data == 0
                        ? widget.categoryType == 3
                            ? widget.workshopData.addClubServiceToCart(
                                context,
                                widget.mainIndex,
                                widget.subIndex,
                                widget.serviceId,
                                DateFormat("yyyy-MM-dd", "en")
                                    .format(stateDate.data))
                            : widget.workshopData
                                .changeDate(stateDate.data, context)
                        : widget.categoryType == 3
                            ? widget.workshopData.addClubServiceToCart(
                                context,
                                widget.mainIndex,
                                widget.subIndex,
                                widget.serviceId,
                                widget.workshopData.selectedHijriDateCubit.state
                                    .data)
                            : Navigator.of(context).pop(),
                    title: tr(context, 'confirm'),
                  ),
                );
              });
        });
  }
}
