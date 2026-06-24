import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:base_flutter/general/widgets/BuildNotificationIcon.dart';
import 'package:flutter/material.dart';

import 'CartIcon.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final bool haveNotifyIConButton;
  final bool haveCartIConButton;
  final List<Widget>? actions;
  final double? size;
  final bool isStore;

  DefaultAppBar({
    required this.title,
    this.actions,
    this.leading,
    this.size,
    this.haveNotifyIConButton = false,
    this.haveCartIConButton = false,
    this.isStore = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leadingWidth: 160,
        title: MyText(
            title: "$title",
            size: 14,
            fontWeight: FontWeight.bold,
            color: MyColors.primary),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Row(children: [
          leading ??
              IconButton(
                  icon:
                      Icon(Icons.arrow_back, size: 25, color: MyColors.primary),
                  onPressed: () => Navigator.of(context).pop()),
        ]),
        actions: actions ??
            [
              if (haveNotifyIConButton) BuildNotificationIcon(),
              if (haveCartIConButton) CartIcon(isStore: isStore)
            ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size ?? 75);
}
