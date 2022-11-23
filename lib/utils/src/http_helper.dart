import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:Blog_web/models/models.dart';

class HttpHelper<T> {
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  HttpHelper({Map<String, String>? headers}) {
    if (headers != null) _headers.addAll(headers);
  }

  Future<AppResponse<T>> get(Uri url) async {
    log("[APIService] get $url $_headers");
    http.Response response = await http.get(url, headers: _headers);
    return processResponse(response);
  }

  Future<AppResponse<T>> getAsList(Uri url,
      {Map<String, String>? headers}) async {
    log("[APIService] getList $url $_headers");
    http.Response response = await http.get(url, headers: _headers);
    return processResponse(response, isList: true);
  }

  AppResponse<T> processResponse(http.Response response,
      {bool isList = false}) {
    log("[APIService] response ${response.statusCode} ${response.body}");
    try {
      int statusCode = response.statusCode;
      final dynamic jsonData = json.decode(response.body);
      switch (statusCode) {
        case 200:
          dynamic data = jsonData;
          log(data);
          return AppResponse<T>(
              apiResponse: APIResponse.success,
              data: isList ? null : processData(data),
              dataAsList: isList ? processDataAsList(data) : null);
        case 201:
          dynamic data = jsonData;
          return AppResponse<T>(
              apiResponse: APIResponse.success,
              data: isList ? null : processData(data),
              dataAsList: isList ? processDataAsList(data) : null);
        case 401:
          return AppResponse(
              apiResponse: APIResponse.authenticationFailure,
              message: jsonData);
        default:
          String message = kDebugMode ? jsonData : "Something went wrong";
          return AppResponse(
              apiResponse: APIResponse.failure, message: message);
      }
    } catch (err, stack) {
      log("[APIService] err stack $stack");
      String message = kDebugMode ? stack.toString() : "Something went wrong";
      return AppResponse(apiResponse: APIResponse.failure, message: message);
    }
  }

  T processData(dynamic data) {
    switch (T) {
      case AuthModel:
        return AuthModel.fromJson(data) as T;
      default:
        throw UnimplementedError();
    }
  }

  List<T> processDataAsList(dynamic data) {
    List<dynamic> list = data;
    switch (T) {
      case PostModel:
        return list.map((e) => PostModel.fromJson(e)).toList() as List<T>;
      case String:
        return list.map((e) => e.toString()).toList() as List<T>;
      default:
        throw UnimplementedError();
    }
  }
}

enum APIResponse { success, failure, connectionError, authenticationFailure }

class AppResponse<T> {
  final APIResponse apiResponse;
  final String? message;
  final T? data;
  final List<T>? dataAsList;

  factory AppResponse.failure(String message) {
    return AppResponse(apiResponse: APIResponse.failure, message: message);
  }
  AppResponse(
      {required this.apiResponse, this.message, this.data, this.dataAsList});

  @override
  String toString() {
    return "$apiResponse -> $message -> $data -> $dataAsList";
  }
}
