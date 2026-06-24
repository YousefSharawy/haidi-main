part of 'products_widgets_imports.dart';

class ProductsTabBarItem extends StatelessWidget {
  final int index;
  final String title;
  final Function() onTap;
  final bool isSelected;

  const ProductsTabBarItem(
      {required this.index,
      required this.onTap,
      required this.isSelected,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: MediaQuery.of(context).size.width * .22,
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
