part of 'date_picker_widgets_imports.dart';

class DatePickerTabBarItem extends StatelessWidget {
  final int index;
  final String title;
  final Function() onTap;
  final bool isSelected;
  final DatePickerData datePickerData;

  const DatePickerTabBarItem(
      {required this.datePickerData,
      required this.index,
      required this.onTap,
      required this.isSelected,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: MediaQuery.of(context).size.width * .29,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: isSelected ? MyColors.primary : Color(0xffC55C56),
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: MyText(
              title: title,
              size: 11,
              color: Colors.white,
            ),
          )),
    );
  }
}
