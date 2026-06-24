part of 'ChangePasswordImports.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final ChangePasswordData changePasswordData = new ChangePasswordData();

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      children: [
        DefaultAppBar(
          title: tr(context,'changePassword'),
          actions: [],
        ),
        Flexible(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              BuildChangeForm(changePasswordData: changePasswordData),
            ],
          ),
        ),
      ],
      bottom: BuildSaveButton(changePasswordData: changePasswordData),
    );
  }
}
