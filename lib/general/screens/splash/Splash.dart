part of 'SplashImports.dart';

class Splash extends StatefulWidget {
  const Splash();

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkingData();
    super.initState();
  }

  _checkingData() async {
    if (!kIsWeb) {
      setupNotifications();
      FirebaseMessaging.instance
          .getInitialMessage()
          .then((RemoteMessage? message) {
        if (message != null) {
          if (message.data != {}) {
            handleNotificationsTap(
              message.data.toString(),
            );
          }
        }
      });
    }
    Future.delayed(Duration(milliseconds: 2000), () {
      Utils.manipulateSplashData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(Res.splash, width: double.infinity, fit: BoxFit.fill),
    );
  }
}
