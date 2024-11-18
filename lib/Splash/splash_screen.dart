import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Splash/2_welcome_screen.dart';
import 'package:dinewell/Widget/page_view.dart';
import 'package:dinewell/auth/otp_verify.dart';
import 'package:dinewell/services/api_manager.dart';
import 'package:dinewell/services/auth_service.dart';
import 'package:dinewell/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 700));
    animationController.forward();
    _loadNextScreen();
    super.initState();
  }

  _loadNextScreen() async {
    await Future.delayed(Duration(milliseconds: 2000));

    initialize();
  }
  initialize(){
    if( AuthService.authenticated()){
      requestPermission(Permission.location);
    }else{
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => WelComeScreen(),
        ),(route) => false,
      );
    }
  }

  Future<void> fetchCurrentLocation() async {
    Position currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(currentLocation.latitude);
    print(currentLocation.longitude);
    checkUserVerify(currentLocation);
  }

  requestPermission(Permission location) async {
    final status1 = await location.status;
    if (status1 == PermissionStatus.permanentlyDenied ||
        status1 == PermissionStatus.denied) {

      Position currentLocation = Position(
          longitude: 0.0,
          latitude: 0.0,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          altitudeAccuracy: 0,
          heading: 0,
          headingAccuracy: 0,
          speed: 0,
          speedAccuracy: 0);

      checkUserVerify(currentLocation);
    }

    if (status1 == PermissionStatus.granted) {
      fetchCurrentLocation();
    }
  }

  checkUserVerify(Position currentLocation) async {
    await ApiManager().getUserProfileDetails();

    if(LocalStorageService.prefs?.getString(ConstanceData.usersDetails)  != null && LocalStorageService.prefs?.getString(ConstanceData.usersDetails) != ""){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => PageScreen(currentLocation: currentLocation),
        ),
            (route) => false,
      );
    }else{
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => OtpVerified(),
        ),
            (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                ConstanceData.logo1,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ConstanceData.appIcon,
                        height: MediaQuery.of(context).size.width / 1.5,
                      ),

                    ],
                  ),
                  Text(
                    "\"Get Rewarded for Eating Out\"",
                    textAlign: TextAlign.center,

                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: primaryFont),
                  ),

                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
