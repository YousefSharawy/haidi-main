part of 'cupertino_time_picker_imports.dart';

class CupertinoTimePicker extends StatelessWidget {
  final WorkshopData workshopData;

  const CupertinoTimePicker({required this.workshopData});

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      children: [
        DefaultAppBar(title:tr(context,'determineTime')),
        Flexible(
          child: Container(
            height: 400,
            width: double.infinity,
            child: CupertinoTheme(
              data: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyle(
                    color: MyColors.primary,
                    fontSize: 22,
                  ),
                ),
              ),
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.time,
                use24hFormat: false,
                onDateTimeChanged: (DateTime newTime) =>
                    workshopData.changeTime(context , newTime),
              ),
            ),
          ),
        ),
      ],
      bottom: DefaultButton(
        height: 56,
        margin: EdgeInsets.zero,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        onTap: () {
          if(workshopData.selectedTimeCubit.state.data == ''){
            workshopData.changeTime(context , DateTime.now());
          }
          Navigator.of(context).pop();
        },
        title: tr(context,'confirm'),
      ),
    );
  }
}
