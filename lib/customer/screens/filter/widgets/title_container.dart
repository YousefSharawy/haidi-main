part of 'filter_widgets_imports.dart';

class TitleContainer extends StatelessWidget {
  final String title;
  const TitleContainer({required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Row(
        children: [
          MyText(
              title: title,
              size: 12,
              color: MyColors.primary),
          // SizedBox(width: 2),
          Icon(
            Icons.arrow_right,
            color: MyColors.primary,
            size: 30,
          ),
        ],
      ),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: MyColors.primary.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          color: MyColors.white,
          borderRadius: BorderRadius.all(Radius.circular(25))),
    );
  }
}
