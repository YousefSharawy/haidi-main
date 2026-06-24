part of 'store_widgets_imports.dart';

class StoreTabBarItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function() onTap;

  const StoreTabBarItem({required this.title, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: MyText(
        title: title,
        size: 11,
        color: isSelected ? MyColors.primary : MyColors.blackOpacity,
      ),
    );
  }
}
