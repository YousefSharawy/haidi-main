part of 'SelectLangImports.dart';

class SelectLangData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();

  void setUserLang(BuildContext context, String lang) async {
    Utils.changeLanguage(lang, context);
    Nav.navigateTo( LoginView(), navigatorType: NavigatorType.push);
  }

  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }
}
