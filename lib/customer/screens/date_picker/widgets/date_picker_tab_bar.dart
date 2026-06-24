part of 'date_picker_widgets_imports.dart';

class DatePickerTabBar extends StatelessWidget {
  final DatePickerData datePickerData;

  const DatePickerTabBar({required this.datePickerData});

  @override
  Widget build(BuildContext context) {
    List titles = [
      tr(context, 'gregorian'),
      tr(context, 'hijri'),
    ];
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
      bloc: datePickerData.index,
      builder: (context, state) {
        return SizedBox(
          height: 90,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 25),
              scrollDirection: Axis.horizontal,
              itemCount: titles.length,
              itemBuilder: (_, index) => DatePickerTabBarItem(
                  datePickerData: datePickerData,
                  index: state.data,
                  onTap: () => datePickerData.index.onUpdateData(index),
                  isSelected: state.data == index,
                  title: titles[index]),
            ),
          ),
        );
      },
    );
  }
}
