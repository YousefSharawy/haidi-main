import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../screens/login/LoginImports.dart';
import '../utilities/utils_functions/Navigator.dart';

class CustomAlertDialog extends StatelessWidget {
  final String? content;
  final Function()? onTap;
  final bool authDialog;

  const CustomAlertDialog(
      {this.content = '', this.onTap, required this.authDialog});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Row(
          children: [
            MyText(
              title: authDialog
                  ? tr(context, 'SignInToContinue')
                  : content.toString(),
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
                ))
          ],
        ),
        actions: <Widget>[
          TextButton(
              child: MyText(
                title: authDialog ? tr(context, 'login') : tr(context, "yes"),
                color: MyColors.blackOpacity,
                size: 14,
                fontWeight: FontWeight.bold,
              ),
              onPressed: authDialog
                  ? () {
                      Navigator.of(context).pop();
                      Nav.navigateTo(LoginView(),
                          navigatorType: NavigatorType.push);
                    }
                  : onTap),
          TextButton(
              child: MyText(
                title: tr(context, "no"),
                color: MyColors.blackOpacity,
                size: 14,
                fontWeight: FontWeight.bold,
              ),
              onPressed: () => Navigator.of(context).pop())
        ]);
  }
}
