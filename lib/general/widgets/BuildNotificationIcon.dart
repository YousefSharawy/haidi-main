import 'package:badges/badges.dart';
import 'package:base_flutter/general/blocks/setting_cubit/setting_cubit.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../customer/screens/notifications/notifications_imports.dart';
import '../blocks/auth_cubit/auth_cubit.dart';
import '../constants/MyColors.dart';
import 'custom_alert_dialog.dart';

class BuildNotificationIcon extends StatelessWidget {
  const BuildNotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authorized = context.read<AuthCubit>().state.authorized;
    var notification =
        context.read<SettingCubit>().state.model.notifications ?? 0;
    //  var count = context.watch<NotifyCubit>().state.count;
    return Badge(
      position: BadgePosition.topEnd(top: 5, end: 10),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.fade,
      badgeColor: Colors.red,
      showBadge: notification > 0 && authorized,
      badgeContent: Text(
        notification.toString(),
        style: TextStyle(fontSize: 8, color: Colors.white),
      ),
      child: InkWell(
        onTap: () => authorized
            ? Nav.navigateTo(Notifications(), navigatorType: NavigatorType.push)
            : showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomAlertDialog(authDialog: true);
                },
              ),
        child: Icon(Icons.notifications, color: MyColors.primary, size: 25),
      ),
    );
  }
}
