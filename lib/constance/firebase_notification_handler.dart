import 'dart:convert';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/main.dart';
import 'package:dinewell/models/login_model.dart';
import 'package:dinewell/services/auth_service.dart';
import 'package:dinewell/services/local_storage_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

LoginModel userNotificationProfileDetails = LoginModel();

String? _token;

class FirebaseNotifications {
  setUpFirebase() async {
    initialized();
    firebaseCloudMessagingListeners();
  }
  FirebaseMessaging messaging = FirebaseMessaging.instance ;

  initialized() async {
    await FirebaseMessaging.instance.setAutoInitEnabled(true);

    _token = await FirebaseMessaging.instance.getToken();

    FirebaseMessaging.instance.onTokenRefresh.listen((token) {
      _token = token;
    });

    assert(_token != null);
    print("FCM token: $_token");
    await LocalStorageService.prefs!.setString(ConstanceData.fcmToken, _token ?? "");

  }

  void firebaseCloudMessagingListeners() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage) async {
      debugPrint("on Message call: ${remoteMessage?.data}");

      if (remoteMessage != null) {
        RemoteNotification? notification = remoteMessage.notification;
        if(AuthService.authenticated()){
          showNotification(
              body: notification?.body ?? "",
              bodyType: "",
              objectId: "",
              chatId: "",
              badge: 0,
              status: "");
        }

      }
    });

    FirebaseMessaging.instance.getInitialMessage().then((remoteMessage) async {
      debugPrint("getInitialMessage call: ${remoteMessage?.data}");

      if (remoteMessage != null) {

        debugPrint(
            "Notification data onMessageOpenedApp = ${remoteMessage.data}");

        var body = json.decode(remoteMessage.data["pushData"]);

        var bodyType = body['type'];
        var objectId = body['objectId'] ?? "";
        var chatId = body['chatId'] ?? "";
        var status = body['status'] ?? "";

        handleNotificationClicked(bodyType, objectId, chatId, status);
      }
    });

    FirebaseMessaging.onMessageOpenedApp
        .listen((RemoteMessage? remoteMessage) async {
      debugPrint("on message opened call: ${remoteMessage?.data}");

      if (remoteMessage != null) {

        debugPrint(
            "Notification data onMessageOpenedApp = ${remoteMessage.data}");

        var body = json.decode(remoteMessage.data["pushData"]);

        var bodyType = body['type'];
        var objectId = body['objectId'] ?? "";
        var chatId = body['chatId'] ?? "";
        var status = body['status'] ?? "";

        handleNotificationClicked(bodyType, objectId, chatId, status);
      }
    });
  }

  void initializeLocalNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            requestSoundPermission: true,
            requestBadgePermission: true,
            requestAlertPermission: true,
            defaultPresentAlert: true,
            defaultPresentSound: true,
            defaultPresentBadge: true,
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        onSelectNotification(notificationResponse.payload);
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true ,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
    } else {
      //appsetting.AppSettings.openNotificationSettings();
      if (kDebugMode) {
        print('user denied permission');
      }
    }
  }

  onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {
    debugPrint("getting background received:");
  }

  onSelectNotification(String? payload) async {
    debugPrint('Payload :::: $payload');
    NotificationPayloadModel note =
        NotificationPayloadModel.fromRawJson(payload ?? "");
    if (payload != null) {
      handleNotificationClicked(
          note.bodyType, note.objectId, note.chatId, note.status);
    }
  }

  Future<NotificationDetails> _notificationDetails() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'FLUTTER_NOTIFICATION_CLICK',
      'channel',
      channelDescription: "description",
      priority: Priority.high,
      importance: Importance.max,
      channelShowBadge: true,
      enableVibration: true,
      enableLights: true,
      playSound: true,
    );
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: darwinNotificationDetails,
    );

    return platformChannelSpecifics;
  }

  showNotification(
      {String? bodyType,
      String? objectId,
      String? body,
      String? title,
      String? chatId,
      String? status,
      int? badge}) async {
    initializeLocalNotification();

    final platformChannelSpecifics = await _notificationDetails();

    NotificationPayloadModel newNote = NotificationPayloadModel(
        bodyType: bodyType ?? "",
        objectId: objectId ?? "",
        chatId: chatId ?? "",
        status: status ?? "");
    String noteJsonString = newNote.toRawJson();
    await flutterLocalNotificationsPlugin.show(
        badge ?? 0,
        title != null && title != "" ? title : "Dinewell",
        body,
        platformChannelSpecifics,
        payload: noteJsonString);

  }

  showScheduleNotification({String? message, String? title}) async {
    initializeLocalNotification();

    final platformChannelSpecifics = await _notificationDetails();

    await flutterLocalNotificationsPlugin.show(
        0,
        title != null && title != "" ? title : "emVite",
        message,
        platformChannelSpecifics);
  }
}

handleNotificationClicked(
    String bodyType, String objectId, String chatId, String status) async {

  print("onclicker method");
}

class NotificationPayloadModel {
  final String bodyType;
  final String objectId;
  final String chatId;
  final String status;

  NotificationPayloadModel(
      {required this.bodyType,
      required this.objectId,
      required this.chatId,
      required this.status});

  //Add these methods below
  factory NotificationPayloadModel.fromRawJson(String str) =>
      NotificationPayloadModel._fromJson(json.decode(str));

  String toRawJson() => jsonEncode(_toJson());

  factory NotificationPayloadModel._fromJson(Map<String, dynamic> json) =>
      NotificationPayloadModel(
        bodyType: json['bodyType'],
        objectId: json['objectId'],
        chatId: json['chatId'],
        status: json['status'],
      );

  Map<String, dynamic> _toJson() => {
        'bodyType': bodyType,
        'objectId': objectId,
        'chatId': chatId,
        'status': status
      };
}
