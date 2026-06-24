part of 'date_picker_widgets_imports.dart';

class GregoriaDate extends StatelessWidget {
  final DateTime dateTime;
  final WorkshopData workshopData;

  const GregoriaDate({required this.workshopData, required this.dateTime})
      : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: BlocBuilder<GenericBloc<DateTime>, GenericState<DateTime>>(
          bloc: workshopData.focusedDateCubit,
          builder: (context, state) {
            return TableCalendar(
              currentDay: DateTime.now(),
              daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                      fontSize: 12, color: MyColors.primary)),
              weekendDays: [],
              calendarStyle: CalendarStyle(
                isTodayHighlighted: false,
                  todayDecoration: BoxDecoration(
                      color: MyColors.primary.withOpacity(0.6),
                      shape: BoxShape.circle),
                  cellMargin: EdgeInsets.all(10),
                  defaultTextStyle: TextStyle(color: MyColors.primary),
                  disabledTextStyle:
                  TextStyle(color: MyColors.primary.withOpacity(.47)),
                  outsideDaysVisible: false,
                  selectedDecoration: BoxDecoration(
                      color: MyColors.primary, shape: BoxShape.circle)),
              daysOfWeekHeight: 50,
              headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                      color: MyColors.primary, fontSize: 19),
                  formatButtonVisible: false,
                  titleCentered: true,
                  rightChevronIcon: Icon(Icons.arrow_forward_ios,
                      color: MyColors.primary, size: 18),
                  leftChevronIcon: Icon(Icons.arrow_back_ios,
                      color: MyColors.primary, size: 18)),
              focusedDay: state.data,
              lastDay: DateTime(2050),
              firstDay: DateTime.now(),
              daysOfWeekVisible: true,
              pageJumpingEnabled: true,
              locale: "ar_EG",
              selectedDayPredicate: (day) {
                return isSameDay(dateTime, day);
              },
              calendarFormat: CalendarFormat.month,
              onDaySelected: workshopData.onSelectData,
            );
          },
        ));
  }
}
