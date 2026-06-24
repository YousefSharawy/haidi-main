part of 'ProfileWidgetImports.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ProfileData profileData;
  // final DelegateDrawerData delegateDrawerData;

  const BuildAppBar(
      {required this.profileData});

  @override
  Widget build(BuildContext context) {
    return DefaultAppBar(
      title: tr(context, "profile"),
      leading: Container(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(75);
}
