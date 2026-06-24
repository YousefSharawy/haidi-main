part of 'ProfileWidgetImports.dart';

class BuildDeleteAccountAlertDialog extends StatelessWidget {
  final ProfileData profileData;

  const BuildDeleteAccountAlertDialog({required this.profileData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: AlertDialog(
        title: Row(
          children: [
            MyText(
              title: tr(context, "sureDeleteAccount"),
              color: MyColors.black,
              size: 13,
              alien: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
            Spacer(),
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.close,
                color: MyColors.blackOpacity,
              ),
            )
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: MyText(
              title: tr(context, "yes"),
              color: MyColors.blackOpacity,
              size: 14,
              fontWeight: FontWeight.bold,
            ),
            onPressed: () {
              profileData.deleteAccount(context);
            },
          ),
          TextButton(
              child: MyText(
                title: tr(context, "no"),
                color: MyColors.blackOpacity,
                size: 14,
                fontWeight: FontWeight.bold,
              ),
              onPressed: () => Navigator.of(context).pop())
        ],
      ),
    );
  }
}
