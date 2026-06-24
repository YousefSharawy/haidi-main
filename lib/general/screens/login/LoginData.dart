part of 'LoginImports.dart';

class LoginData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GenericBloc<bool> passwordBloc = GenericBloc(true);
  final TextEditingController password = new TextEditingController();
  final TextEditingController phone = new TextEditingController();

  void userLogin(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      String phoneEn = Utils.convertDigitsToLatin(phone.text);
      String passEn = Utils.convertDigitsToLatin(password.text);
      await GeneralRepository(context).setUserLogin(phoneEn, passEn);
    }
  }
}
