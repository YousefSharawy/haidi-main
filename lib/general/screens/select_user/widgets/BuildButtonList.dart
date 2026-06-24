part of 'SelectUserWidgetsImports.dart';

class BuildButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          title: tr(context,"customer"),
          onTap: () => Nav.navigateTo( LoginView(), navigatorType: NavigatorType.push),
          margin: const EdgeInsets.symmetric(vertical: 15),
          color: MyColors.primary,
        ),
        DefaultButton(
          title:tr(context,"agency"),
          onTap: () => Nav.navigateTo( LoginView(), navigatorType: NavigatorType.push),
          margin: const EdgeInsets.symmetric(horizontal: 0),
          color: MyColors.white,
          borderColor: MyColors.primary,
          textColor: MyColors.primary,
        ),
      ],
    );
  }
}
