part of 'date_picker_widgets_imports.dart';

class HijriDate extends StatefulWidget {
  final WorkshopData workshopData;
  final HijriDateTime hijriDateTime;

  const HijriDate({required this.hijriDateTime, required this.workshopData});

  @override
  State<HijriDate> createState() => _HijriDateState();
}

class _HijriDateState extends State<HijriDate> {
  @override
  void initState() {
    widget.workshopData.selectedHijriDateCubit
        .onUpdateData(HijriDateTime.now().toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: SfHijriDateRangePicker(
          initialSelectedDate: HijriDateTime.now(),
          toggleDaySelection: true,
          monthCellStyle: HijriDatePickerMonthCellStyle(
              textStyle: TextStyle(color: MyColors.primary),
              todayCellDecoration: BoxDecoration(
                  color: MyColors.primary.withOpacity(0.6),
                  shape: BoxShape.circle),
              todayTextStyle: TextStyle(color: MyColors.primary),
              disabledDatesTextStyle:
                  TextStyle(color: MyColors.primary.withOpacity(0.47))),
          monthViewSettings: HijriDatePickerMonthViewSettings(
              viewHeaderStyle: DateRangePickerViewHeaderStyle(
                  textStyle: TextStyle(color: MyColors.primary))),
          headerStyle: DateRangePickerHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: TextStyle(color: MyColors.primary, fontSize: 19)),
          selectionColor: MyColors.primary,
          onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
            final dynamic value = args.value;
            print(value);
            widget.workshopData.selectedDateCubit
                .onUpdateData(value.toString());
            widget.workshopData.changeHijriDate(value.toString(), context);
            widget.workshopData.selectedHijriDateCubit
                .onUpdateData(value.toString());
          },
          navigationDirection: DateRangePickerNavigationDirection.horizontal,
          allowViewNavigation: true,
          headerHeight: 75,
          todayHighlightColor: MyColors.primary,
          selectionTextStyle: TextStyle(color: MyColors.white),
          showNavigationArrow: true,
          selectionRadius: -1,
          selectionMode: DateRangePickerSelectionMode.single,
          enablePastDates: false,
        ));
  }
}
