import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:grocery_app/common-models/common_api_model.dart';
import 'package:grocery_app/screens/login/view/login_view.dart';
import 'package:grocery_app/services/navigation_services.dart';
import 'package:grocery_app/src/app/static_info.dart';

class ApiRequests extends BaseService {
  void interceptors(Dio dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse:
            (Response response, ResponseInterceptorHandler handler) async {
          var jsonResponse = json.decode(response.toString());
          if (response.statusCode == 200) {
            ApiResponseModel apiResponseModel =
                ApiResponseModel.fromJson(jsonResponse);
            if (apiResponseModel.statusCode == 422) {
              Navigator.pushAndRemoveUntil(
                NavigationService.navigatorKey.currentContext!,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => LoginView(
                      // showSessionExpiresToast: true,
                      ),
                ),
                (route) => false,
              );
              return;
            }
          }
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future getRequest({
    required String url,
    Map<String, dynamic>? params,
    Map<String, dynamic>? header,
  }) async {
    Dio dio = Dio();
    dynamic response;
    if (kDebugMode) {
      print("URL is $url");
    }
    bool isConnected = await checkInternet();
    if (isConnected == false) {
      if (kDebugMode) {
        print("no internet connection");
      }
      throw 'No Internet Connection';
    }

    try {
      interceptors(dio);
      response = await dio.get(
        url,
        queryParameters: params,
        options: Options(
          headers: headers,
          sendTimeout: const Duration(milliseconds: 12000), //_defaultTimeout,
          receiveTimeout:
              const Duration(milliseconds: 12000), //_defaultTimeout,
        ),
      );
      if (kDebugMode) {
        print(response.statusCode);
        print("response is $response");
      }
      dynamic data = returnResponse(response);
      return data;
      // return returnResponse(response);
    } on SocketException catch (error) {
      if (kDebugMode) {
        print('No Internet connection [SocketException]\n${error.message}');
      }

      throw 'No Internet connection';
    } on HttpException catch (error) {
      if (kDebugMode) {
        print("Couldn't find the post [HttpException]\n${error.message}");
      }
      throw error;
    } on FormatException catch (error) {
      if (kDebugMode) {
        print("Bad response format [FormatException]\n${error.message}");
      }
      throw error;
    } catch (e) {
      if (kDebugMode) {
        print('[get] error ($url) -> ${e.toString()}');
      }

      // if (e is DioException) {
      //   throw e;
      // }else{
      //   throw e;
      // }
      throw e;
    }
  }

  @override
  Future postRequest({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? header,
  }) async {
    Dio dio = Dio();
    dynamic response;
    if (kDebugMode) {
      print("URL is $url       ${body.toString()}    auth token is  $headers");
    }
    bool isConnected = await checkInternet();
    if (isConnected == false) {
      if (kDebugMode) {
        print("no internet connection");
      }
      throw 'No Internet Connection';
    }
    try {
      interceptors(dio);
      response = await dio.post(
        url,
        data: body,
        options: Options(
          sendTimeout: const Duration(milliseconds: 12000), //_defaultTimeout,
          receiveTimeout:
              const Duration(milliseconds: 12000), //_defaultTimeout,
          headers: headers,
        ),
      );

      if (kDebugMode) {
        print(response.statusCode);
        print("response in post is $response");
      }

      return returnResponse(response);
    } on SocketException catch (error) {
      if (kDebugMode) {
        print('No Internet connection [SocketException]\n${error.message}');
      }

      throw 'No Internet connection';
    } on HttpException catch (error) {
      if (kDebugMode) {
        print("Couldn't find the post [HttpException]\n${error.message}");
      }
      throw error;
    } on FormatException catch (error) {
      if (kDebugMode) {
        print("Bad response format [FormatException]\n${error.message}");
      }
      throw error;
    } on DioException catch (error) {
      throw jsonDecode(error.response.toString())['message'];
    } catch (e) {
      if (kDebugMode) {
        print('[get] error ($url) -> ${e.toString()}');
      }
      throw e;
    }
  }

  @override
  Future putRequest(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? header}) async {
    Dio dio = Dio();
    dynamic response;
    if (kDebugMode) {
      print("URL is $url       ${body.toString()}");
    }
    bool isConnected = await checkInternet();
    if (isConnected == false) {
      if (kDebugMode) {
        print("no internet connection");
      }
      throw 'No Internet Connection';
    }
    try {
      interceptors(dio);
      response = await dio.put(
        url,
        data: body,
        options: Options(
          sendTimeout: const Duration(milliseconds: 12000), //_defaultTimeout,
          receiveTimeout:
              const Duration(milliseconds: 12000), //_defaultTimeout,
          headers: headers,
        ),
      );

      if (kDebugMode) {
        print(response.statusCode);
        print("response in put request is $response");
      }

      return returnResponse(response);
    } on SocketException catch (error) {
      if (kDebugMode) {
        print('No Internet connection [SocketException]\n${error.message}');
      }

      throw 'No Internet connection';
    } on HttpException catch (error) {
      if (kDebugMode) {
        print("Couldn't find the post [HttpException]\n${error.message}");
      }
      throw error;
    } on FormatException catch (error) {
      if (kDebugMode) {
        print("Bad response format [FormatException]\n${error.message}");
      }
      throw error;
    } catch (e) {
      if (kDebugMode) {
        print('[get] error ($url) -> ${e.toString()}');
      }
      throw e;
    }
  }

  @override
  Future deleteRequest({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? header,
  }) async {
    Dio dio = Dio();
    dynamic response;
    if (kDebugMode) {
      print("URL is $url");
    }
    bool isConnected = await checkInternet();
    if (isConnected == false) {
      if (kDebugMode) {
        print("no internet connection");
      }
      throw 'No Internet Connection';
    }
    try {
      interceptors(dio);
      response = await dio.delete(
        url,
        data: body,
        options: Options(
          headers: headers,
          sendTimeout: const Duration(milliseconds: 12000), //_defaultTimeout,
          receiveTimeout:
              const Duration(milliseconds: 12000), //_defaultTimeout,
        ),
      );

      if (kDebugMode) {
        print(response.statusCode);
        print("response is $response");
      }

      return returnResponse(response);
    } on SocketException catch (error) {
      if (kDebugMode) {
        print('No Internet connection [SocketException]\n${error.message}');
      }

      throw 'No Internet connection';
    } on HttpException catch (error) {
      if (kDebugMode) {
        print("Couldn't find the post [HttpException]\n${error.message}");
      }
      throw error;
    } on FormatException catch (error) {
      if (kDebugMode) {
        print("Bad response format [FormatException]\n${error.message}");
      }
      throw error;
    } catch (e) {
      if (kDebugMode) {
        print('[get] error ($url) -> ${e.toString()}');
      }

      if (e is DioException) {
        throw e;
      }
    }
  }

  Map<String, dynamic> headers = {'Auth-Token': StaticInfo.authToken};

  Future<bool> checkInternet() async {
    print('auth toke is ${StaticInfo.authToken}');
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (kDebugMode) {
          print('connected');
        }
        return true;
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      print(e.message);
      return false;
    }
    return false;
  }
}

dynamic returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
      return jsonDecode(response.toString());
    default:
      throw jsonDecode(response.toString())["message"];
  }
}

abstract class BaseService {
  Future getRequest(
      {required String url,
      Map<String, dynamic>? params,
      Map<String, dynamic>? header});

  Future postRequest({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? header,
  });

  Future putRequest({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? header,
  });

  Future deleteRequest({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? header,
  });
}
