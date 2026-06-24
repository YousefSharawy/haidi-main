part of 'HomeImports.dart';

class HomeData {
  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }

  void clientSettings(BuildContext context) async {
    SettingModel data = await CustomerRepository(context).clientSettings();
    context.read<SettingCubit>().onUpdateSettingData(data);
  }
}
