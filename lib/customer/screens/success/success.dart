part of 'success_imports.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(children: [
      DefaultAppBar(title: ''),
      Flexible(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Res.successCheck, scale: 2.7),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            InkWell(
              onTap: () => Nav.navigateTo(

                Home(),
                navigatorType: NavigatorType.pushAndPopUntil,
              ),
              child: MyText(
                title: tr(context,'backToHome'),
                size: 15,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: MyColors.primary,
              ),
            ),
          ],
        ),
      ))
    ]);
  }
}
