part of 'MainWidgetImports.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar();

  @override
  Widget build(BuildContext context) {
    var authorized = context.read<AuthCubit>().state.authorized;

    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 130, // Set this height
      flexibleSpace: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Res.homeAppBar), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(Res.smallLogo, scale: 2.2),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(
                  onPressed: () => showSearch(
                      useRootNavigator: true,
                      context: context,
                      // delegate to customize the search bar
                      delegate: CustomSearchDelegate(searchIsGeneral: true)),
                  icon: Icon(Icons.search, color: Colors.white)),
              MyText(title: tr(context, 'main'), size: 18, color: Colors.white),
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
                            style: TextStyle(fontSize: 8, color: Colors.white)),
                        child: IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: MyColors.white,
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
                        color: MyColors.white,
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
              )
            ])
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(130);
}
