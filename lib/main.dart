import 'package:awesome_notifications/awesome_notifications.dart';
import '../../../core/theme/app_colors.dart';
import 'package:ebox/controller/push_notification_controller.dart';
import 'package:ebox/view/Authentication/login_screen.dart';
import 'package:ebox/view/dashboard_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constants/local_constant.dart';
import 'core/constants/translations_app.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

var token;
PushNotificationController pushNotificationService =
    PushNotificationController();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  ///FlutterNativeSplash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///Firebase
  await Firebase.initializeApp(
    name: 'eBox',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ///FirebaseMessaging
  pushNotificationService.initialize();
  AwesomeNotifications().initialize(
    'https://firebasestorage.googleapis.com/v0/b/ebox-42cef.appspot.com/o/carrot.png?alt=media&token=be976e31-1967-42c8-941c-b5001149c9d2',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification for basic test',
      ),
    ],
    debug: true,
  );

  SharedPreferences pref = await SharedPreferences.getInstance();
  token = pref.getString('token');
  debugPrint('Token: $token');

  configLoading();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) => {
          if (!isAllowed)
            {AwesomeNotifications().requestPermissionToSendNotifications()}
        });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        print("Preference Revoked ${locale.languageCode}");
        Get.updateLocale(locale);
        print("GET LOCALE Revoked ${Get.locale!.languageCode}");
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            translations: TranslationsApp(),
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('en', 'US'),
            builder: EasyLoading.init(),
            title: 'eBox',
            home: token == null ? const LoginScreen() : const DashboardScreen(),
            theme: ThemeData(
              // fontFamily: 'Visby',
              primarySwatch: Colors.orange,
            ).copyWith(
                scaffoldBackgroundColor: AppColors.secondaryBackgroundColor),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = true;
}
