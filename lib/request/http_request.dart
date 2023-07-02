import 'package:dio/dio.dart';
import 'package:food_flutter/request/http_config.dart';
import 'package:food_flutter/request/http_interceptors.dart';

class HttpRequest {
  factory HttpRequest() => _instance;

  static final HttpRequest _instance = HttpRequest._internal();

  Dio? _dio;

  HttpRequest._internal() {
    if (_dio == null) {
      BaseOptions baseOptions = BaseOptions(
          baseUrl: HttpConfig.baseUrl,
          connectTimeout: HttpConfig.connectTimeout,
          receiveTimeout: HttpConfig.receiveTimeout);
      _dio = Dio(baseOptions);
      // 添加error拦截器
      _dio!.interceptors.add(HttpInterceptors());
    }
  }

  /// restful get 操作
  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    var response = await _dio!.get(
      path,
      queryParameters: params,
      options: options ?? Options(),
    );
    return response.data;
  }

  /// restful post 操作
  Future post(
    String path, {
    Map<String, dynamic>? params,
    data,
    Options? options,
  }) async {
    var response = await _dio!.post(
      path,
      data: data,
      queryParameters: params,
      options: options ?? Options(),
    );
    return response.data;
  }

  /// restful put 操作
  Future put(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    var response = await _dio!.put(
      path,
      data: data,
      queryParameters: params,
      options: options ?? Options(),
    );
    return response.data;
  }

  /// restful patch 操作
  Future patch(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    var response = await _dio!.patch(
      path,
      data: data,
      queryParameters: params,
      options: options ?? Options(),
    );
    return response.data;
  }

  /// restful delete 操作
  Future delete(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    var response = await _dio!.delete(
      path,
      data: data,
      queryParameters: params,
      options: options ?? Options(),
    );
    return response.data;
  }

  /// restful post form 表单提交操作
  Future postForm(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    var response = await _dio!.post(
      path,
      data: FormData.fromMap(params ?? {}),
      options: options ?? Options(),
    );
    return response.data;
  }
}
