
import 'dart:developer';

import 'package:base_flutter/general/blocks/auth_cubit/auth_cubit.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/setting_cubit/setting_cubit.dart';
import 'package:base_flutter/general/blocks/theme_cubit/theme_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'general/MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // DEMO MODE: render a blank placeholder instead of the red error screen if a
  // widget fails to build (e.g. unexpected null while the API is offline).
  ErrorWidget.builder = (FlutterErrorDetails details) => const SizedBox.shrink();
  if (!kIsWeb) {
    try {
      await Firebase.initializeApp();
      // await FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    } catch (e, st) {
      log('Firebase init or background handler failed: $e');
      log('$st');
    }
  }
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeCubit>(
        create: (BuildContext context) => ThemeCubit(),
      ),
      BlocProvider<LangCubit>(
        create: (BuildContext context) => LangCubit(),
      ),
      BlocProvider<UserCubit>(
        create: (BuildContext context) => UserCubit(),
      ),
      BlocProvider<AuthCubit>(
        create: (BuildContext context) => AuthCubit(),
      ),
      BlocProvider<SettingCubit>(
        create: (BuildContext context) => SettingCubit(),
      ),
    ],
    child: BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return Phoenix(child: MyApp(isDark: themeState.isDark));
      },
    ),
  ));
}
