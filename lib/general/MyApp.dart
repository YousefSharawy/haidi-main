import 'package:base_flutter/general/blocks/theme_cubit/theme_cubit.dart';
import 'package:base_flutter/general/screens/splash/SplashImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tf_validator/localization/SetLocalization.dart';

import 'blocks/lang_cubit/lang_cubit.dart';
import 'utilities/main_data/MainDataImports.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  final bool isDark;

  const MyApp({Key? key, required this.isDark}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    context.watch<ThemeCubit>().changeAppTheme(context);
    return MultiBlocProvider(
        providers: MainData.providers(context),
        child: BlocBuilder<LangCubit, LangState>(
          builder: (context, state) {
            return MaterialApp(
                navigatorKey: navigationKey,
                // color:widget.isDark?Colors.black:Colors.white ,
                debugShowCheckedModeBanner: false,
                theme:
                    !widget.isDark ? MainData.defaultThem : MainData.darkThem,
                home: Splash(),
                title: 'Haidy',
                supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
                localizationsDelegates: [
                  SetLocalization.localizationsDelegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: state.locale,
                // routerDelegate: _appRouter.delegate(
                //     initialRoutes: [SplashRoute(navigatorKey: navigatorKey)]),
                // routeInformationParser: _appRouter.defaultRouteParser(),
                builder: (ctx, child) {
                  child = FlutterEasyLoading(child: child); //do something
                  return child;
                });
          },
        ));
  }
}
