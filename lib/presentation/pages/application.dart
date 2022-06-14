import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vapeteka/presentation/pages/promotion_page.dart';
import 'package:vapeteka/presentation/pages/qr_page.dart';
import 'package:vapeteka/presentation/pages/settings_page.dart';
import 'package:vapeteka/presentation/pages/splash_screen.dart';

import '../../controllers/api_controller.dart';
import '../../main.dart';
import '../../services/shared_preferences.dart';
import 'catalog_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ApiController apiController = Get.put(ApiController());

  @override
  void initState() {
    super.initState();

    // var initializationSettingsAndroid =
    //     const AndroidInitializationSettings('@drawable/vapeteka_push_logo');
    // FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    //   alert: true, // Required to display a heads up notification
    //   badge: true,
    //   sound: true,
    // );
    // print("INITSTATE");
    // const IOSInitializationSettings initializationSettingsIOS =
    //     IOSInitializationSettings(
    //   requestSoundPermission: true,
    //   requestBadgePermission: true,
    //   requestAlertPermission: true,
    // );
    // print("INITSTATE22");

    // var initializationSettings = InitializationSettings(
    //     android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    // print("INITSTATE33");
    // flutterLocalNotificationsPlugin.initialize(initializationSettings);
    // print("INITSTATE44");

    // FirebaseMessaging.onMessage.listen((event) { print("MESSAGE...");});
    // print("INITSTATE55");
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   AppleNotification? ios = message.notification?.apple;
    //   print(notification);
    //   print("wqeeqw");

    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode,
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //             android: AndroidNotificationDetails(
    //           channel.id,
    //           channel.name,
    //           styleInformation: BigTextStyleInformation(''),
    //           color: Colors.black,
    //           icon: '@drawable/vapeteka_push_logo',
    //         ),
    //           iOS: IOSNotificationDetails(

    //           ),
    //         ));
    //   }
    //   });
    // getToken();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 731),
      builder: () => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: GetMaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(fontFamily: 'BlissPro'),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          // initialRoute: '/',
          // defaultTransition: Transition.native,
          // transitionDuration: Duration(milliseconds: 150),
          // getPages: [
          //   GetPage(
          //     name: "/",
          //     page: () => SplashScreen(),
          //   ),
          //   GetPage(
          //     name: "/qr_page",
          //     page: () => QRPage(),
          //   ),
          //   GetPage(
          //     name: "/settings_page",
          //     page: () => SettingsPage(),
          //   ),
          //   GetPage(
          //     name: "/promotion_page",
          //     page: () => PromotionPage(),
          //   ),
          //   GetPage(
          //     name: "/catalog_page",
          //     page: () => CatalogPage(),
          //   ),
          // ],
        ),
      ),
    );
  }

  getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    apiController.deviceToken = token;
    PreferencesService.setFcmToken(apiController.deviceToken!);
    if (kDebugMode) {
      print(token);
    }
  }
}
