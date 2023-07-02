import 'package:dio/dio.dart';
import 'package:food_flutter/request/http_request.dart';

class HttpUtil {
  static Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) =>
      HttpRequest().get(
        path,
        params: params,
        options: options ?? Options(),
      );

  static Future post(
    String path, {
    Map<String, dynamic>? params,
    data,
    Options? options,
  }) =>
      HttpRequest().post(
        path,
        data: data,
        params: params,
        options: options ?? Options(),
      );

  static Future put(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
  }) =>
      HttpRequest().put(
        path,
        data: data,
        params: params,
        options: options ?? Options(),
      );

  static Future patch(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
  }) =>
      HttpRequest().patch(
        path,
        data: data,
        params: params,
        options: options ?? Options(),
      );

  static Future delete(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
  }) =>
      HttpRequest().delete(
        path,
        data: data,
        params: params,
        options: options ?? Options(),
      );

  static Future postForm(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) =>
      HttpRequest().post(
        path,
        data: FormData.fromMap(params ?? {}),
        options: options ?? Options(),
      );
}
