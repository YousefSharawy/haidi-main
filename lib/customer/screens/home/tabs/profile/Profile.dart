part of 'ProfileImports.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileData profileData = ProfileData();

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthCubit>().state.authorized;
    return HomeScaffold(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (auth)
                InkWell(
                  onTap: () => profileData.showDeleteAccountAlertDialog(context),
                  child: Container(
                    padding: const EdgeInsets.only(top: 60),
                    alignment: AlignmentDirectional.topEnd,
                    child: Icon(
                      Icons.delete,
                      color: MyColors.primary,
                      size: 26,
                    ),
                  ),
                ),
              SizedBox(width: 20),
              InkWell(
                onTap: () => auth
                    ? profileData.showLogOutAlertDialog(context)
                    : Nav.navigateTo(LoginView(),
                        navigatorType: NavigatorType.push),
                child: Container(
                    padding: const EdgeInsets.only(top: 60),
                    alignment: AlignmentDirectional.topEnd,
                    child: auth
                        ? Image.asset(Res.logout, scale: 2.3)
                        : MyText(
                            title: tr(context, 'login'),
                            size: 13,
                            color: MyColors.primary,
                            fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Flexible(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            children: [
              if (auth)
                BuildProfileItem(
                    title: tr(context, "profile"),
                    icon: Icons.account_circle_sharp,
                    widget: Settings()),
              if (auth)
                BuildProfileItem(
                    title: tr(context, "myAds"),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ImageIcon(
                        AssetImage(Res.ads_inactive),
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    widget: MyAds()),
              if (auth)
                BuildProfileItem(
                    title: tr(context, "wallet"),
                    icon: Icons.wallet_travel,
                    widget: Wallet()),
              BuildProfileItem(
                  title: tr(context, "lang"),
                  icon: Icons.language,
                  widget: ChangeLanguage()),
              BuildProfileItem(
                  title: tr(context, "contactUs"),
                  icon: Icons.phone,
                  widget: ContactUs()),
              BuildProfileItem(
                  title: tr(context, "contactUsWithForm"),
                  icon: Icons.message,
                  widget: ContactUsWithForm()),
              BuildProfileItem(
                  title: tr(context, "aboutApp"),
                  icon: Icons.info_outlined,
                  widget: About()),
              BuildProfileItem(
                  title: tr(context, "terms"),
                  icon: Icons.assignment,
                  showDivider: false,
                  widget: Terms()),
            ],
          ),
        )
      ],
    );
  }
}
