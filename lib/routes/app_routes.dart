import 'package:flutter/cupertino.dart';

import '../Splash/onboarding.dart';
import '../Splash/splash_screen.dart';
import '../home/location_fetch_page.dart';

class AppRoutes {
  static const String splash = "/";
  static const String introduction = "/Splash/onboarding";
  static const String home = "/home/HomeScreen1";
  
  static final routes = <String, WidgetBuilder>{
    home: (context) => const LocationFetchPage(),
    splash: (context) => SplashScreen(),
    introduction: (context) => const OnBoardingScreen(),
  };
} 