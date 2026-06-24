part of 'filter_widgets_imports.dart';

class BuildCheckBoxItem extends StatelessWidget {
  final Function(dynamic) onTap;
  final String name;
  final bool selected;

  const BuildCheckBoxItem(
      {required this.onTap, required this.selected, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            side: MaterialStateBorderSide.resolveWith(
                (states) => BorderSide(width: 1.5, color: MyColors.primary)),
            activeColor: MyColors.white,
            checkColor: MyColors.primary,
            value: selected,
            onChanged: onTap),
        MyText(title: name, size: 11, color: MyColors.primary)
      ],
    );
  }
}
