import 'dart:convert';
import 'package:dinewell/Constance/firebase_notification_handler.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Splash/onboarding.dart';
import 'package:dinewell/Splash/splash_screen.dart';
import 'package:dinewell/home/location_fetch_page.dart';
import 'package:dinewell/services/api_service.dart';
import 'package:dinewell/services/local_storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'firebase_options.dart';
import 'routes/app_routes.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage remoteMessage) async {
  if (kIsWeb) return;
  
  await Firebase.initializeApp();
  await LocalStorageService.getPrefs();
  ApiService().initApiServiceDio();
  
  final notification = remoteMessage.notification;
  final android = remoteMessage.notification?.android;
  
  if (notification == null || android == null) return;
  
  try {
    final body = json.decode(remoteMessage.data["pushData"]);
    final bodyType = body['type'] as String? ?? "";
    final objectId = body['objectId'] as String? ?? "";
    final chatId = body['chatId'] as String? ?? "";
    final status = body['status'] as String? ?? "";
    
    handleNotificationClicked(bodyType, objectId, chatId, status);
  } catch (e) {
    debugPrint('Error processing notification: $e');
  }
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  if (notificationResponse.input?.isNotEmpty ?? false) {}
}

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    
    await Future.wait([
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      LocalStorageService.getPrefs(),
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]),
    ]);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    ApiService().initApiServiceDio();
    await FirebaseNotifications().setUpFirebase();

    runApp(const MyApp());
  } catch (e, stackTrace) {
    debugPrint('Error initializing app: $e\n$stackTrace');
    // Add proper error handling/reporting here
    rethrow;
  }
}

class MyApp extends StatefulWidget {
  static setCustomTheme(BuildContext context, int index) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setCustomTheme(index);
  }

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void setCustomTheme(int index) {
    setState(() {
      AppTheme.isLightTheme = index == 6;
    });
  }

  void _updateSystemUIOverlay() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
        statusBarBrightness:
            AppTheme.isLightTheme ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarDividerColor: Colors.grey,
        systemNavigationBarIconBrightness:
            AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1), _updateSystemUIOverlay);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Dine Well",
      navigatorKey: NavKey.navKey,
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      builder: (context, child) {
        // Add error handling boundary
        return child ?? const SizedBox.shrink();
      },
    );
  }
}

class Routes {
  static String SPLASH = "/";
  static const String INTRODUCTION = "/Splash/onboarding";
  static const String HOME = "/home/HomeScreen1";
}

class NavKey {
  static final navKey = GlobalKey<NavigatorState>();
}
