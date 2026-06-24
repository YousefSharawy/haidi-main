import "dart:developer";
import 'package:base_flutter/general/MyApp.dart';
import "package:firebase_core/firebase_core.dart";
import "package:firebase_messaging/firebase_messaging.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter_local_notifications/flutter_local_notifications.dart";

import '../../customer/models/setting_model.dart';
import '../../customer/screens/notifications/notifications_imports.dart';
import '../../customer/screens/order_details/order_details_imports.dart';
import '../../customer/screens/product_order_details/product_order_details_imports.dart';
import '../blocks/setting_cubit/setting_cubit.dart';
import '../utilities/utils_functions/Navigator.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void requestPermissions() {
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
}

void showNotification(RemoteMessage event, String payload) async {
  var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
      presentAlert: true, presentBadge: true, presentSound: true);
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      "com.base.notifications_base", "Notification base",
      channelDescription: "notificationBase",
      enableVibration: true,
      playSound: true,
      icon: "notification",
      importance: Importance.high,
      priority: Priority.high);
  var notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  String title = "${event.notification!.title}";
  String body = "${event.notification!.body}";
  await flutterLocalNotificationsPlugin
      .show(id: 200, title: title, body: body, notificationDetails: notificationDetails, payload: payload);
  var context = navigationKey.currentContext!;
  var count = context.read<SettingCubit>().state.model.notifications ?? 0;
  context.read<SettingCubit>().onUpdateSettingData(SettingModel(
      productCart: context.read<SettingCubit>().state.model.productCart,
      serviceCart: context.read<SettingCubit>().state.model.serviceCart,
      notifications: count + 1));
}

void initLocalNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings("notification");

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings,onDidReceiveBackgroundNotificationResponse: (details) {
  //   handleNotificationsTap(details.payload);
  // },onDidReceiveNotificationResponse: (details) {
  //   handleNotificationsTap(details.payload);
  // },);
  NotificationAppLaunchDetails? details =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  if (details!.didNotificationLaunchApp) {
    handleNotificationsTap(details.notificationResponse!.payload);
  }
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //     onSelectNotification: (String? payload) =>
  //         handleNotificationsTap(payload));
}

Future<void> registerNotification() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  await firebaseMessaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
}

void initializeFlutterFire() async => await registerNotification();

handleNotificationsTap(String? payload) async {
  if (payload!.isEmpty || payload == '{}') {
    Nav.navigateTo(const Notifications(), navigatorType: NavigatorType.push);
  } else {
    List<String> str =
        payload.replaceAll("{", "").replaceAll("}", "").split(",");
    Map<String, dynamic> data = {};
    for (int i = 0; i < str.length; i++) {
      List<String> s = str[i].split(":");
      data.putIfAbsent(s[0].trim(), () => s[1].trim());
    }
    log('payload $payload');
    int _type = int.parse(data["type"] ?? "4");
    int _orderId = int.parse(data["orderId"] ?? 0);
    int _orderType = int.parse(data["orderType"]);
    if (_type == 2 || _type == 3 || _type == 4 || _type == 5) {
      if (_orderId != 0) {
        if (_orderType != 2) {
          _orderType == 0
              ? Nav.navigateTo(OrderDetails(orderId: _orderId),
                  navigatorType: NavigatorType.push)
              : Nav.navigateTo(ProductOrderDetails(orderId: _orderId),
                  navigatorType: NavigatorType.push);
        } else {
          Nav.navigateTo(const Notifications(),
              navigatorType: NavigatorType.push);
        }
      }
    } else if (_type == 7) {
      Nav.navigateTo(const Notifications(), navigatorType: NavigatorType.push);
    }
  }
}

void saveFcmToken() async {
  try {
    var token = await FirebaseMessaging.instance.getToken().timeout(const Duration(seconds: 3), onTimeout: () => "").catchError((e) => "");
    print("Firebase Fcm token : ${token.toString()}");
  } catch (e) {
    // FCM can fail to register (no Play Services / offline / bad config) -
    // don't let it throw an unhandled exception on startup.
    print("Firebase FCM token unavailable: $e");
  }
}

void setupNotifications() {
  saveFcmToken();
  initializeFlutterFire();
  initLocalNotification();
  requestPermissions();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    if (event.data != {}) {
      showNotification(event, "${event.data}");
    } else {
      showNotification(event, "${event.notification}");
    }
    // notification rebuild
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
    handleNotificationsTap(event.data.toString());
  });
  log("Notifications init complete");
}
