part of 'ResetPasswordImports.dart';

class ResetPasswordData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final GenericBloc<bool> passwordBloc = GenericBloc(true);
  final GenericBloc<bool> confirmPasswordBloc = GenericBloc(true);

  final TextEditingController newPassword = new TextEditingController();
  final TextEditingController confirmNewPassword = new TextEditingController();
  final TextEditingController code = new TextEditingController();

  void onResetPassword(BuildContext context, String userId) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      bool result = await GeneralRepository(context)
          .resetUserPassword(userId, code.text, newPassword.text);
      if (result) {
        Nav.navigateTo( LoginView(),
            navigatorType: NavigatorType.pushAndPopUntil);
      }
    }
  }

  void onResendCode(BuildContext context, String userId) async {
    await GeneralRepository(context).resendCode(userId);
  }
}
