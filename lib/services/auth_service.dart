import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/services/local_storage_service.dart';

class AuthService{

  static Future<bool> isAuthenticated() async {
    return LocalStorageService.prefs!.setBool(ConstanceData.authenticated, true);
  }

  static bool authenticated() {
    return LocalStorageService.prefs?.getBool(ConstanceData.authenticated) ??
        false;
  }

  static Future<bool> setAuthBearerToken(token) async {
    return LocalStorageService.prefs!.setString(ConstanceData.userAuthToken, token);
  }

}