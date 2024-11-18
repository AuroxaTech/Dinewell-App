import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/auth/otp_verify.dart';
import 'package:dinewell/home/location_fetch_page.dart';
import 'package:dinewell/models/aboutus_model.dart';
import 'package:dinewell/models/contactsus_model.dart';
import 'package:dinewell/models/all_cards_list_model.dart';
import 'package:dinewell/models/all_partners_list_model.dart';
import 'package:dinewell/models/balance_model.dart';
import 'package:dinewell/models/banners_model.dart';
import 'package:dinewell/models/country_list_model.dart';
import 'package:dinewell/models/error_model.dart';
import 'package:dinewell/models/languages_list_model.dart';
import 'package:dinewell/models/login_model.dart';
import 'package:dinewell/models/logout_model.dart';
import 'package:dinewell/models/notifications_model.dart';
import 'package:dinewell/models/offers_model.dart';
import 'package:dinewell/models/orders_list_model.dart';
import 'package:dinewell/models/partner_details_model.dart';
import 'package:dinewell/models/products_list_model.dart';
import 'package:dinewell/models/profile_details_model.dart';
import 'package:dinewell/models/rewards_list_model.dart';
import 'package:dinewell/models/rules_model.dart';
import 'package:dinewell/models/transaction_cards_model.dart';
import 'package:dinewell/models/transactions_model.dart';
import 'package:dinewell/services/api_constants.dart';
import 'package:dinewell/services/api_service.dart';
import 'package:dinewell/services/auth_service.dart';
import 'package:dinewell/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class ApiManager {
  // user login
  requestUserLogin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    print("Login Start");

    try {
      final Map<String, dynamic> params = <String, dynamic>{
        "email": email,
        "password": password
      };
      var response =
          await ApiService().post(ApiConstants.login, params: params);
      print("Login Response ==> $response");
      if (response?.data != null) {
        final newList = json.encode(response?.data);
        final extractedData = json.decode(newList);
        var loginData = LoginModel.fromJson(extractedData);
        if (loginData.success == true) {
          await AuthService.setAuthBearerToken(loginData.data?.token ?? "");
          await AuthService.isAuthenticated();
          await getUserProfileDetails();
          Navigator.pop(context);
          await apiGetUserDetails(context);
          print("login data ====> ${loginData.message}");

        } else {
          if (loginData.message != "") {
            UtilsFunctions.displayToast("${loginData.message}");
          }
          Navigator.pop(context);
        }
      }
    } on (ErrorModel errorModel,) {
      Navigator.pop(context);

      rethrow;

    } catch (e) {
      print(e);
      Navigator.pop(context);
      print("requestUserLogin Error ===>${e.toString()} ");
      rethrow;
    }
  }

  sendOTP() async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .post(ApiConstants.sendOTP);
      if (response?.data['message'] != null) {
        UtilsFunctions.displayToast(response?.data['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  verifiedOTP(String otp) async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .post(ApiConstants.verifiedOTP, params: {"otp": otp});
      if (response?.data['message'] != null) {
        UtilsFunctions.displayToast(response?.data['message']);
        await getUserProfileDetails();
      }
    } catch (e) {
      print("verifiedOTP Error ===>${e.toString()} ");
      rethrow;
    }
  }

  // user logout
  userLogout() async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .post(ApiConstants.logout);
      final newList = json.encode(response?.data);
      final extractedData = json.decode(newList);
      var logoutData = LogoutModel.fromJson(extractedData);
      if (logoutData.data?.message != "") {
        UtilsFunctions.displayToast(logoutData.data?.message ?? "");
      }
      AuthService.setAuthBearerToken('');
      LocalStorageService.prefs?.setBool(ConstanceData.authenticated, false);
      LocalStorageService.prefs?.setString(ConstanceData.usersDetails, "");
    } catch (e) {
      print("userLogout Error ===>${e.toString()} ");
      rethrow;
    }
  }

  // user register
  requestUserRegister(
      {required String email,
      required String password,
      required BuildContext context,
      required String name,
      required int gender,
      required String dialCode,
      required String phoneNumber,
      File? selectedImageFile}) async {
    try {
      final Map<String, dynamic> params = <String, dynamic>{
        "name": name,
        "email": email,
        "password": password,
        "accepts_emails": 0,
        "send_mail": 0,
        "gender": gender,
        "phone_code": dialCode,
        "phone_no": phoneNumber
      };
      Map<String, dynamic> formData = <String, dynamic>{};

      if (selectedImageFile != null) {
        String fileName = selectedImageFile.path.split('/').last;
        formData = <String, dynamic>{
          "avatar": await MultipartFile.fromFile(selectedImageFile.path,
              filename: fileName),
        };
      }
      var response = await ApiService().post(ApiConstants.register,
          params: params,
          data: formData,
          isFormData: selectedImageFile != null ? true : false);
      if (response?.data != null) {
        final newList = json.encode(response?.data);
        final extractedData = json.decode(newList);
        var loginData = LoginModel.fromJson(extractedData);
        if (loginData.success == true) {
          await AuthService.setAuthBearerToken(loginData.data?.token ?? "");
          await AuthService.isAuthenticated();
          Navigator.pop(context);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => OtpVerified(),
            ),
            (route) => false,
          );
        } else {
          if (loginData.message != "") {
            UtilsFunctions.displayToast("${loginData.message}");
          }
          Navigator.pop(context);
        }
      }
    } on ErrorModel {
      Navigator.pop(context);
    } catch (e) {
      print("requestUserRegister Error ===>${e.toString()} ");
      Navigator.pop(context);
      rethrow;
    }
  }

  // fetch all cards
  Future<List<CardListData>?> getAllCards() async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      print("Fetching cards with authToken: $authToken");
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .get(ApiConstants.allCards);
      if (response?.data != null) {
        final newList = json.encode(response?.data);
        final extractedData = json.decode(newList);
        var cardsData = AllCardsListModel.fromJson(extractedData);
        if (cardsData.success == true) {
          return cardsData.data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } on ErrorModel {
      return null;
    } catch (e) {
      print("getAllCards Error ===>${e.toString()} ");
      rethrow;
    }
  }

  Future<List<BannersListData>?> getBanners() async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ?? "";
      print("Fetching banners with authToken: $authToken");

      var response = await ApiService(
          token: authToken, contentType: ContentType.json)
          .get(ApiConstants.banners);
      print("Banners Data ======> ${response?.data}");
      if (response?.data != null) {
        if (response?.data is List) {
          List<dynamic> dataList = response?.data;
          List<BannersListData> bannersList = dataList
              .map((item) => BannersListData.fromJson(item))
              .toList();
          return bannersList;
        } else if (response?.data is Map<String, dynamic>) {
          var extractedData = response?.data;
          var bannersData = BannersModel.fromJson(extractedData);
          return bannersData.data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("getBanners Error ===>${e.toString()} ");
      rethrow;
    }
  }


// fetch all partners
  Future<List<AllPartnersListData>?> getAllPartners() async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      print("Fetching partners with authToken: $authToken");

      var response =
          await ApiService(token: authToken).get(ApiConstants.allPartners);
      if (response?.data != null) {
        final newList = json.encode(response?.data);
        final extractedData = json.decode(newList);
        var partnersData = AllPartnersListModel.fromJson(extractedData);
        if (partnersData.success == true) {
          return partnersData.data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("getAllPartners Error ===>${e.toString()} ");
      rethrow;
    }
  }

// fetch all partner details
  Future<PartnerDetailsData?> getPartnerDetails(
      {required String partnerId}) async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .get("${ApiConstants.partnerDetails}${partnerId}");
      final newList = json.encode(response?.data);
      final extractedData = json.decode(newList);
      var partnersData = PartnerDetailsModel.fromJson(extractedData);
      if (response?.data != null) {
        if (partnersData.success == true) {
          return partnersData.data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("getPartnerDetails Error ===>${e.toString()} ");
      rethrow;
    }
  }

  // fetch user details
  getUserProfileDetails() async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      print("Fetching member details with authToken: $authToken");

      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .get(ApiConstants.profileDetails);
      if (response?.data != null) {
        final newList = json.encode(response?.data);
        final extractedData = json.decode(newList);
        var loginData = ProfileDetailsModel.fromJson(extractedData);
        if (loginData.success == true && loginData.data != null) {
          String user = jsonEncode(extractedData);
          LocalStorageService.prefs
              ?.setString(ConstanceData.usersDetails, user);

        } else {
          if (loginData.message != "") {
            UtilsFunctions.displayToast("${loginData.message}");
          }
        }
      }
    } catch (e) {
      print("getUserProfileDetails Error ===>${e.toString()} ");
      print(e.toString());
    }
  }

  apiGetUserDetails(BuildContext context) {
    if (LocalStorageService.prefs?.getString(ConstanceData.usersDetails) !=
            null &&
        LocalStorageService.prefs?.getString(ConstanceData.usersDetails) !=
            "") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => LocationFetchPage(),
        ),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => OtpVerified(),
        ),
        (route) => false,
      );
    }
  }

  // fetch all countries
  Future<List<CountryListData>?> getCountryList() async {
    try {
      var response = await ApiService().get(ApiConstants.countryList);
      if (response?.data != null) {
        final newList = json.encode(response?.data);
        final extractedData = json.decode(newList);
        var countryData = CountryListModel.fromJson(extractedData);
        if (countryData.success == true) {
          return countryData.data?.countries;
        } else {
          return null;
        }
      } else {
        return null;
      }
    }  catch (e) {
      print("getCountryList Error ===>${e.toString()} ");
      rethrow;
    }
  }

  // fetch all languages
  Future<List<LanguagesListData>?> getLanguagesList() async {
    try {
      var response = await ApiService().get(ApiConstants.languagesList);
      if (response?.data != null) {
        final newList = json.encode(response?.data);
        final extractedData = json.decode(newList);
        var languageData = LanguagesListModel.fromJson(extractedData);
        if (languageData.success == true) {
          return languageData.data?.languages;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("getLanguagesList Error ===>${e.toString()} ");
      rethrow;
    }
  }

  // fetch all transactionsCards
  Future<List<TransactionCardsData>?> getTransactionCardsDetails() async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .get(ApiConstants.transactionsCards);
      final newList = json.encode(response?.data);
      final extractedData = json.decode(newList);
      var transactionsCardData = TransactionCardsModel.fromJson(extractedData);
      if (response?.data != null) {
        if (transactionsCardData.success == true) {
          return transactionsCardData.data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    }  catch (e) {
      print("getTransactionCardsDetails Error ===>${e.toString()} ");
      rethrow;
    }
  }

// fetch all balance
  Future<BalanceModelData?> getBalance({required String cardId}) async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .get("${ApiConstants.balance}${cardId}");
      final newList = json.encode(response?.data);
      final extractedData = json.decode(newList);
      var balanceData = BalanceModel.fromJson(extractedData);
      if (response?.data != null) {
        if (balanceData.success == true) {
          return balanceData.data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("getBalance Error ===>${e.toString()} ");
      rethrow;
    }
  }

// fetch all rules
  Future<List<String>?> getRules({required String cardId}) async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .get("${ApiConstants.rules}${cardId}");
      final newList = json.encode(response?.data);
      final extractedData = json.decode(newList);
      var rulesData = RulesModel.fromJson(extractedData);
      if (response?.data != null) {
        if (rulesData.success == true) {
          return rulesData.data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("getRules Error ===>${e.toString()} ");
      rethrow;
    }
  }

// fetch all offers
  Future<List<OffersData>?> getOffers({required String cardId}) async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .get("${ApiConstants.offers}${cardId}");
      final newList = json.encode(response?.data);
      final extractedData = json.decode(newList);
      var offersData = OffersModel.fromJson(extractedData);
      if (response?.data != null) {
        if (offersData.success == true) {
          return offersData.data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("getOffers Error ===>${e.toString()} ");
      rethrow;
    }
  }

// fetch all transactions
  Future<List<TransactionsData>?> getAllTransactions(
      {required String cardId}) async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .get("${ApiConstants.transactions}${cardId}");
      final newList = json.encode(response?.data);
      final extractedData = json.decode(newList);
      var balanceData = TransactionsModel.fromJson(extractedData);
      if (response?.data != null) {
        if (balanceData.success == true) {
          return balanceData.data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("getAllTransactions Error ===>${e.toString()} ");
      rethrow;
    }
  }

// fetch all products
  Future<List<ProductsListData>?> getAllProductsList() async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .get(ApiConstants.productsList);
      final newList = json.encode(response?.data);
      final extractedData = json.decode(newList);
      var balanceData = ProductsListModel.fromJson(extractedData);
      if (response?.data != null) {
        if (balanceData.success == true) {
          return balanceData.data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("getAllProductsList Error ===>${e.toString()} ");
      rethrow;
    }
  }

// fetch all orders
  Future<List<OrdersListData>?> getOrdersList({required String cardId}) async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .get("${ApiConstants.ordersList}${cardId}");
      final newList = json.encode(response?.data);
      final extractedData = json.decode(newList);
      var ordersData = OrdersListModel.fromJson(extractedData);
      if (response?.data != null) {
        if (ordersData.success == true) {
          return ordersData.data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("getOrdersList Error ===>${e.toString()} ");
      rethrow;
    }
  }

// fetch all rewards
  Future<List<RewardsListData>?> getRewardsList(
      {required String cardId}) async {
    print("Card Id ==>$cardId");
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .get("${ApiConstants.rewardsList}${cardId}");
      final newList = json.encode(response?.data);
      final extractedData = json.decode(newList);
      var rewardsData = RewardsListModel.fromJson(extractedData);
      if (response?.data != null) {
        if (rewardsData.success == true) {
          return rewardsData.data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("getRewardsList Error ===>${e.toString()} ");
      rethrow;
    }
  }

// fetch About us
  Future<AboutUsData?> getAboutUs() async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .get("${ApiConstants.aboutUs}");
      final newList = json.encode(response?.data);
      print("about us data: ${newList}");
      final extractedData = json.decode(newList);
      var aboutUsData = AboutUsModel.fromJson(extractedData);
      if (response?.data != null) {
        if (aboutUsData.success == true) {
          return aboutUsData.data!;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("getAboutUs Error ===>${e.toString()} ");
      rethrow;
    }
  }

  // contacts us
  apiContactUs(
      {required String email,
      required String subject,
      required BuildContext context,
      required String name,
      required String phone,
      required String message}) async {
    try {
      final Map<String, dynamic> params = <String, dynamic>{
        "name": name,
        "email": email,
        "phone": phone,
        "subject": subject,
        "message": message,
      };
      var response =
          await ApiService().post(ApiConstants.contactUs, params: params);
      if (response?.data != null) {
        final newList = json.encode(response?.data);
        final extractedData = json.decode(newList);
        var contactsUsData = ContactsUsModel.fromJson(extractedData);
        if (contactsUsData.success == true) {
          UtilsFunctions.displayToast("${contactsUsData.message}");
          Navigator.pop(context);
        }
      }
    } on ErrorModel {
      Navigator.pop(context);
    } catch (e) {
      print("apiContactUs Error ===>${e.toString()} ");
      Navigator.pop(context);
      rethrow;
    }
  }

// fetch all partner details
  Future<List<AllPartnersListData>?> getRestaurantLocationWiseSearch(
      {required double latitude, required double longitude}) async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json).get(
              "${ApiConstants.locationWiseSearch}latitude=${latitude}&longitude=${longitude}");
      final newList = json.encode(response?.data);
      final extractedData = json.decode(newList);
      var partnersData = AllPartnersListModel.fromJson(extractedData);
      if (partnersData.success == true) {
        return partnersData.data;
      } else {
        return null;
      }
    } catch (e) {
      print("getRestaurantLocationWiseSearch Error ===>${e.toString()} ");
      rethrow;
    }
  }

// fetch all partner details
  Future<List<NotificationsData>?> getAllNotifications() async {
    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
          await ApiService(token: authToken, contentType: ContentType.json)
              .get("${ApiConstants.notificationList}");
      final newList = json.encode(response?.data);
      final extractedData = json.decode(newList);
      var partnersData = NotificationsModel.fromJson(extractedData);
      if (partnersData.success == true) {
        return partnersData.data;
      } else {
        return null;
      }
    } catch (e) {
      print("getAllNotifications Error ===>${e.toString()} ");
      rethrow;
    }
  }

  // read notification
  Future<bool> apiReadNotification({required String notificationId}) async {
    try {
      final Map<String, dynamic> params = <String, dynamic>{
        "notification_id": notificationId,
      };
      var response = await ApiService()
          .post(ApiConstants.readNotification, params: params);
      if (response?.data != null) {
        final newList = json.encode(response?.data);
        final extractedData = json.decode(newList);
        var notificationData = NotificationsModel.fromJson(extractedData);
        if (notificationData.success == true) {
          UtilsFunctions.displayToast("${notificationData.message}");
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print("apiReadNotification Error ===>${e.toString()} ");
      rethrow;
    }
  }

  // send notification
  Future<bool> apiSendNotification({required String notificationId}) async {
    try {
      final Map<String, dynamic> params = <String, dynamic>{
        "notification_id": notificationId,
      };
      var response = await ApiService()
          .post(ApiConstants.readNotification, params: params);
      if (response?.data != null) {
        final newList = json.encode(response?.data);
        final extractedData = json.decode(newList);
        var notificationData = NotificationsModel.fromJson(extractedData);
        if (notificationData.success == true) {
          UtilsFunctions.displayToast("${notificationData.message}");
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print("apiSendNotification Error ===>${e.toString()} ");
      rethrow;
    }
  }

  // check points
  Future<bool> checkPoints({required String notificationId}) async {
    try {
      var response = await ApiService().get(ApiConstants.checkPoints);
      if (response?.data != null) {
        final newList = json.encode(response?.data);
        final extractedData = json.decode(newList);
        var notificationData = NotificationsModel.fromJson(extractedData);
        if (notificationData.success == true) {
          UtilsFunctions.displayToast("${notificationData.message}");
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }  catch (e) {
      print("checkPoints Error ===>${e.toString()} ");
      rethrow;
    }
  }

  // request qr code
  Future<bool> requestQrCode({required String cardId}) async {
    try {
      var response =
          await ApiService().get("${ApiConstants.requestQrCode}/$cardId");
      if (response?.data != null) {
        final newList = json.encode(response?.data);
        final extractedData = json.decode(newList);
        var notificationData = NotificationsModel.fromJson(extractedData);
        if (notificationData.success == true) {
          UtilsFunctions.displayToast("${notificationData.message}");
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print("requestQrCode Error ===>${e.toString()} ");
      rethrow;
    }
  }
}
