import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  late Dio _dio;
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  ApiClient._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: "http://192.168.1.5:5000/api/v1",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      responseType: ResponseType.json,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));
    // _dio.interceptors.add(_AuthInterceptor());
    // _dio.interceptors.add(_LoggingInterceptor());
  }
  Dio get dio => _dio;
}

class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await _getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      bool isRefreshed = await _refreshToken();
      if (isRefreshed) {
        return handler.resolve(await _retryRequest(err.requestOptions));
      }
    }
  }

  Future<bool> _refreshToken() async {
    try {
      Dio dio = Dio();
      Response response = await dio.post(
        "https://api/auth/refresh",
        data: {"refreshToken": "your_refresh_token"},
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<String?> _getAccessToken() async {
    return "your_access_token";
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    Dio newDio = Dio();
    return await newDio.fetch(requestOptions);
  }
}

class _LoggingInterceptor extends Interceptor {
  final PrettyDioLogger logger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseHeader: true,
    responseBody: true,
    compact: false,
    error: true,
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.onRequest(options, handler);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.onResponse(response, handler);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.onError(err, handler);
    handler.next(err);
  }
}
