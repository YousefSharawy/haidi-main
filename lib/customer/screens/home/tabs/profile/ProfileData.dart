part of 'ProfileImports.dart';

class ProfileData {
  void logout(BuildContext context) async =>
      await GeneralRepository(context).logout();

  void deleteAccount(BuildContext context) async =>
      await GeneralRepository(context).deleteAccount();

  void showLogOutAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BuildLogOutAlertDialog(
          profileData: this,
        );
      },
    );
  }

  void showDeleteAccountAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BuildDeleteAccountAlertDialog(
          profileData: this,
        );
      },
    );
  }
}
