import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'dart:io';

class BaseApi {
  final http.Client _client = http.Client();

  @protected
  Future<http.Response> get(String url, {Map<String, String> headers}) async {
    log("GET START call for $url");
    final _requestHeaders = (headers != null) ? headers : _getDefaultHeaders();
    log('GET Headers: $_requestHeaders');

    final _callUri = Uri.parse(url);

    final response = await _client.get(_callUri, headers: _requestHeaders);

    if (response == null) {
      log("GET response is null, returning...");
      return null;
    }

    log("GET response status code is ${response.statusCode}");
    log("GET response body is ${response.body}");
    log("GET END call for $url");
    return response;
  }

  @protected
  Future<http.Response> post(String url, Map<String, dynamic> body,
      {Map<String, String> headers}) async {
    log("POST START call for $url");
    final _requestHeaders = (headers != null) ? headers : _getDefaultHeaders();
    log('POST Body is: $body');
    log('POST Headers: $_requestHeaders');

    final _callUri = Uri.parse(url);

    final response =
    await _client.post(_callUri, body: body, headers: _requestHeaders);

    if (response == null) {
      log("POST response is null, returning...");
      return null;
    }

    log("POST response status code is ${response.statusCode}");
    log("POST response body is ${response.body}");

    log("END POST call for $url");
    return response;
  }

  Map<String, String> _getDefaultHeaders() =>
      {HttpHeaders.contentTypeHeader: 'application/json',};
}
