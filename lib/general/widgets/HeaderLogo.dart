import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';

import '../utilities/utils_functions/UtilsImports.dart';

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Utils.changeAppTheme(context);
      },
      child: Container(
        height: 90,
        margin: EdgeInsets.symmetric(vertical: 50),
        child: Image.asset(Res.logo, fit: BoxFit.scaleDown,scale: 1,),
      ),
    );
  }
}
