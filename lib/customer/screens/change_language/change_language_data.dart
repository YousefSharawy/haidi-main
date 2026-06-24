part of 'change_language_imports.dart';

class ChangeLanguageData {
  final GenericBloc<String> langBloc = new GenericBloc("Arabic");

  final TextEditingController lang = TextEditingController(text: "");

  setLanguage(BuildContext context, String lang) async {

    if (context.read<AuthCubit>().state.authorized) {
      changeLanguage(context, lang);
    } else {

      EasyLoading.dismiss().then((value) {
        Utils.changeLanguage(lang, context);
        Nav.navigateTo( Home(), navigatorType: NavigatorType.pushAndPopUntil);

      });
    }
  }

  void changeLanguage(BuildContext context, lang) async {
    bool result = await GeneralRepository(context).changeLanguage(lang);
    if (result) {
      Utils.changeLanguage(lang, context);
      var user = context.read<UserCubit>().state.model;
      user.lang = lang;
      context.read<UserCubit>().onUpdateUserData(user);
      Utils.saveUserData(user);
      Nav.navigateTo( Home(), navigatorType: NavigatorType.pushAndPopUntil);

    } else {
      EasyLoading.dismiss();
    }
  }
}
