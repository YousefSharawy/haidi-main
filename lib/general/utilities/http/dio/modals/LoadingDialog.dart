import 'package:base_flutter/general/utilities/http/dio/utils/DioUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

class CustomToast {
  static showConfirmDialog(
      {required BuildContext context,
      required String title,
      required Function() confirm}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(title, confirm, context, "تأكيد");
      },
    );
  }

  static showAuthDialog({required BuildContext context}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(
            DioUtils.authSentence ?? tr(context, 'SignInToContinue'),
            DioUtils.onAuthClick,
            context,
            DioUtils.authConfirm ?? "دخول");
      },
    );
  }

  static Widget _alertDialog(
      String title, Function()? confirm, BuildContext context, String okText) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: DioUtils.textStyle.copyWith(
          color: Colors.black,
        ),
      ),
      // content: MyText(title: title,size: 12,color: MyColors.blackOpacity,),
      actions: [
        CupertinoDialogAction(
          child: Text(
            DioUtils.authBack ?? "رجوع",
            style: DioUtils.textStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          child: Text(
            okText,
            style: DioUtils.textStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          onPressed: confirm,
        ),
      ],
    );
  }

  static showToastNotification(msg,
      {Color? color, Color? textColor, ToastGravity? toastGravity}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: toastGravity ?? ToastGravity.BOTTOM,
        backgroundColor: color ?? DioUtils.primaryColor,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }

  static showSimpleToast(
      {required dynamic msg, Color? color, Color? textColor}) {
    // Some callers pass the raw API response body (e.g. add/edit/delete ad,
    // whose success message IS the body). Coerce non-String payloads to a
    // readable message instead of crashing with a `Map is not a String` cast.
    final String text = msg is String
        ? msg
        : (msg is Map
            ? (msg['msg'] ?? msg['message'] ?? msg['data'] ?? 'ok').toString()
            : msg.toString());
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color ?? DioUtils.primaryColor,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }
}
