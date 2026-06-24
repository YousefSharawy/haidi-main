part of 'LoginWidgetsImports.dart';

class BuildVisitorButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Nav.navigateTo( Home(),
          navigatorType: NavigatorType.pushAndPopUntil),
      child: Container(
        padding: EdgeInsets.all(10),
        child: MyText(
          alien: TextAlign.center,
          title: tr(context, 'visitor'),
          size: 11,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          color: MyColors.black,
        ),
      ),
    );
  }
}
