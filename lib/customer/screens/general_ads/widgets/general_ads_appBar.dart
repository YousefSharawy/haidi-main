part of 'general_ads_widgets_imports.dart';

class GeneralAdsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GeneralAdsAppBar();

  @override
  Widget build(BuildContext context) {
    var authorized = context.read<AuthCubit>().state.authorized;

    return DefaultAppBar(
      title: tr(context, 'ads'),
      leading: IconButton(
          onPressed: () => showSearch(
              useRootNavigator: true,
              context: context,
              // delegate to customize the search bar
              delegate: CustomSearchDelegate(searchIsGeneral: false)),
          icon: Icon(Icons.search, color: MyColors.primary)),
      actions: [
        BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            if (state is SettingUpdateState) {
              return Badge(
                  position: BadgePosition.topStart(top: 5, start: 10),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.fade,
                  badgeColor: Colors.red,
                  showBadge: (state.model.notifications ?? 0) > 0 && authorized,
                  badgeContent: Text((state.model.notifications ?? 0).toString(),
                      style: TextStyle(fontSize: 8, color: MyColors.primary)),
                  child: IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: MyColors.primary,
                      size: 25,
                    ),
                    onPressed: () => authorized
                        ? Nav.navigateTo(Notifications(),
                            navigatorType: NavigatorType.push)
                        : showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomAlertDialog(authDialog: true);
                            },
                          ),
                  ));
            } else {
              return IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: MyColors.primary,
                  size: 25,
                ),
                onPressed: () => authorized
                    ? Nav.navigateTo(Notifications(),
                        navigatorType: NavigatorType.push)
                    : showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(authDialog: true);
                        },
                      ),
              );
            }
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(130);
}
