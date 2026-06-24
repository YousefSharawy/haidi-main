part of 'ProfileWidgetImports.dart';

class BuildProfileItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool? showDivider;
  final Widget widget;
  final Widget? child;

  const BuildProfileItem(
      {required this.widget,
      required this.title,
      this.icon,
      this.showDivider = true, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () =>
              Nav.navigateTo(widget, navigatorType: NavigatorType.push),
          contentPadding: EdgeInsets.zero,
          title: MyText(
            title: title,
            color: MyColors.primary,
            size: 11,
            fontWeight: FontWeight.bold,
          ),
          leading: Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: MyColors.primary),
            child: child??Icon(icon, size: 25, color: MyColors.white),
          ),
        ),
        if (showDivider == true)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              height: 0,
              thickness: 1.5,
            ),
          ),
      ],
    );
  }
}
