part of 'settings_imports.dart';

class Settings extends StatefulWidget {
  const Settings();

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final SettingData settingData = SettingData();

  @override
  void initState() {
    settingData.setInitUserData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      children: [
        DefaultAppBar(title: ''),
        Flexible(
            child: ListView(
          children: [
            SettingsImage(settingData: settingData),
            SettingsForm(settingData: settingData),
            OpenContainer(
                closedColor: Colors.transparent,
                openColor: Colors.transparent,
                closedElevation: 0,
                transitionDuration: Duration(milliseconds: 500),
                closedBuilder: (ctx, action) {
                  return MyText(
                    alien: TextAlign.center,
                    decoration: TextDecoration.underline,
                    title: tr(context, 'changePassword'),
                    size: 13,
                    color: MyColors.primary,
                  );
                },
                openBuilder: (ctx, index) {
                  return ChangePassword();
                }),
          ],
        )),
      ],
      bottom: DefaultButton(
          onTap: () {
            settingData.updateProfile(context);
          },
          title: tr(context, 'confirm'),
          margin: EdgeInsets.zero,
          height: 50,
          fontSize: 14,
          borderRadius: BorderRadius.circular(25)),
    );
  }
}
