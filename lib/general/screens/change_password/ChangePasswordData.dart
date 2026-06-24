part of 'ChangePasswordImports.dart';

class ChangePasswordData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();

  final TextEditingController oldPassword = new TextEditingController();
  final TextEditingController newPassword = new TextEditingController();
  final TextEditingController confirmNewPassword = new TextEditingController();

  final GenericBloc<bool> oldPasswordBloc = GenericBloc(true);
  final GenericBloc<bool> newPasswordBloc = GenericBloc(true);
  final GenericBloc<bool> confirmNewPasswordBloc = GenericBloc(true);

  void setChangePassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      var result = await GeneralRepository(context)
          .changePassword(oldPassword.text, newPassword.text);

      if (result) {
        Navigator.of(context).pop();
      }
    }
  }
}
