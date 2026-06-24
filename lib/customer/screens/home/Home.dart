part of 'HomeImports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeData homeData = HomeData();

  @override
  void initState() {
    final auth = context.read<AuthCubit>().state.authorized;
    if (auth) {
      homeData.clientSettings(context);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthCubit>().state.authorized;
    return PersistentTabView(context,
        screens: [Main(), Reservations(), GeneralAds(), Profile()],
        items: [
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.home, size: 25),
              activeColorPrimary: Color(0xffFAFAFA),
              inactiveColorPrimary: Colors.grey),
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.assignment, size: 25),
              activeColorPrimary: Color(0xffFAFAFA),
              inactiveColorPrimary: Colors.grey,
              onPressed: !auth
                  ? (_) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(authDialog: true);
                        },
                      );
                    }
                  : null),
          PersistentBottomNavBarItem(
              icon: ImageIcon(AssetImage(Res.ads_inactive), size: 20),
              activeColorPrimary: Color(0xffFAFAFA),
              inactiveColorPrimary: Colors.grey),
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.person, size: 25),
              activeColorPrimary: Color(0xffFAFAFA),
              inactiveColorPrimary: Colors.grey)
        ],
        confineToSafeArea: false,
        backgroundColor: MyColors.primary,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: false,
        stateManagement: true,
        hideNavigationBarWhenKeyboardAppears: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        navBarHeight: 56,
        navBarStyle: NavBarStyle.style2);
  }
}
