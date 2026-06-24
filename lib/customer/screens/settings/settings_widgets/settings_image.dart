part of 'settings_widgets_imports.dart';

class SettingsImage extends StatelessWidget {
  final SettingData settingData;

  const SettingsImage({required this.settingData});

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserCubit>().state.model;

    return BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
      bloc: settingData.imageBloc,
      builder: (context, state) {
        return Column(
          children: [
            state.data != null
                ? Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: FileImage(state.data!), fit: BoxFit.cover)))
                : CachedImage(
                    borderRadius: BorderRadius.circular(100),
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                    url: user.imgProfile.toString(),
                  ),
            CircleAvatar(
                maxRadius: 14,
                backgroundColor: MyColors.primary,
                child: IconButton(
                    onPressed: () => settingData.getProfileImage(context),
                    icon: Icon(Icons.edit, size: 12, color: MyColors.white)))
          ],
        );
      },
    );
  }
}
