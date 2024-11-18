import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:dio/io.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ApiService {
  Dio? _dio;
  CancelToken? _cancelToken;
  static final Dio? mDio = Dio();

  static final ApiService _instance = ApiService._internal();

  factory ApiService(
      {ContentType? contentType, String? headerCookie, String? token}) {
    if (token != null && token != "") {
      mDio!.options.headers['authorization'] = "Bearer $token";
    } else if (headerCookie != null) {
      mDio!.options.headers['Cookie'] = "$headerCookie";
    }
    mDio!.options.contentType = contentType.toString();
    mDio!.options.baseUrl = ConstanceData.apiBaseUrl;
    return _instance;
  }

  ApiService._internal() {
    _dio = initApiServiceDio();
  }

  Dio initApiServiceDio() {
    _cancelToken = CancelToken();
    final baseOption = BaseOptions(
      baseUrl: ConstanceData.apiBaseUrl,
      connectTimeout: const Duration(milliseconds: 60 * 1000),
      receiveTimeout: const Duration(milliseconds: 60 * 1000),
      contentType: 'application/json',
    );
    mDio!.options = baseOption;

    mDio!.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioException e, handler) {
      return handler.next(e);
    }));

    return mDio!;
  }

  Future<Response?> get(
      String endUrl, {
        Map<String, dynamic>? params,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    try {
      var isConnected = await checkInternet();
      if (!isConnected) {
        throw DioException(
          requestOptions: RequestOptions(path: endUrl),
          error: 'Internet not connected',
        );
      }
      print("end url : $endUrl");
      return await _dio?.get(
        endUrl,
        queryParameters: params,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
      );
    } on DioException catch (e) {
      return handleDioError(e);
    }
  }

  Future<Response?> post(
      String endUrl, {
        Map<String, dynamic>? data,
        Map<String, dynamic>? params,
        Options? options,
        CancelToken? cancelToken,
        bool isFormData = false,
      }) async {
    try {
      var isConnected = await checkInternet();
      if (!isConnected) {
        throw DioException(
          requestOptions: RequestOptions(path: endUrl),
          error: 'Internet not connected',
        );
      }
      return await _dio?.post(
        endUrl,
        data: isFormData ? FormData.fromMap(data!) : data,
        queryParameters: params,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
      );
    } on DioException catch (e) {
      print(e);
      return handleDioError(e);
    }
  }

  Future<Response?> put(
      String endUrl, {
        Map<String, dynamic>? data,
        Map<String, dynamic>? params,
        Options? options,
        CancelToken? cancelToken,
        bool isFormData = false,
      }) async {
    try {
      var isConnected = await checkInternet();
      if (!isConnected) {
        throw DioException(
          requestOptions: RequestOptions(path: endUrl),
          error: 'Internet not connected',
        );
      }
      return await _dio?.put(
        endUrl,
        data: isFormData ? FormData.fromMap(data!) : data,
        queryParameters: params,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
      );
    } on DioException catch (e) {
      return handleDioError(e);
    }
  }

  Future<Response?> multipartPost(
      String endUrl, {
        FormData? data,
        CancelToken? cancelToken,
        Options? options,
      }) async {
    try {
      return await _dio?.post(
        endUrl,
        data: data,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
      );
    } on DioException catch (e) {
      return handleDioError(e);
    }
  }

  Future<bool> checkInternet() async {
    final connectivity = await (Connectivity().checkConnectivity());

    if (await InternetConnection().hasInternetAccess) {
      return true;
    } else if (connectivity.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivity.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (connectivity.contains(ConnectivityResult.ethernet)) {
      return true;
    } else if (connectivity.contains(ConnectivityResult.vpn)) {
      return true;
    } else {
      return false;
    }
  }

  static String getConnectionValue(var connectivityResult) {
    String status = '';
    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        status = 'Mobile';
        break;
      case ConnectivityResult.wifi:
        status = 'Wi-Fi';
        break;
      case ConnectivityResult.none:
        status = 'None';
        break;
      default:
        status = 'None';
        break;
    }
    return status;
  }

  Response? handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: 'Poor internet connection',
      );
    } else if (e.response?.statusCode == 500) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: 'Internal Server Error',
      );
    } else if (e.response?.statusCode == 302) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: 'Session expired',
      );
    } else {
      throw DioException(
        requestOptions: e.requestOptions,
        error: 'Something went wrong. Please try again.',
      );
    }
  }
}
