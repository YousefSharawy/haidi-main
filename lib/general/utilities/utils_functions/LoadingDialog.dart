import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../tf_custom_widgets/widgets/MyText.dart';

class LoadingDialog {
  static showLoadingDialog() {
    EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
        indicator: SpinKitCubeGrid(
          size: 40.0,
          itemBuilder: (context, index) {
            return Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: MyColors.primary, shape: BoxShape.circle),
            );
          },
        ),
        status: "loading");
  }
  static showSimpleToast({required String msg, Color? color, Color? textColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color ?? MyColors.primary,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }


  static showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: MyColors.blackOpacity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      content: MyText(
        title: message,
        color: Colors.white,
        size: 10,
      ),
      action: SnackBarAction(
        textColor: MyColors.white,
        label: "إخفاء",
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showLoadingView({Color? color}) {
    return Center(
      child: SpinKitCubeGrid(
        color: color?? MyColors.primary,
        size: 40.0,
      ),
    );
  }
}
