import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cache_api_data_flutter/data/exception/app_exceptions.dart';
import 'package:cache_api_data_flutter/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService implements BaseApiService {
  @override
  Future getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw RequestTimeout();
    }
    return jsonResponse;
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    case 400:
      dynamic jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    case 401:
      throw UnauthorizedException();
    case 500:
      throw FetchDataException(
          'Error while communicating with Server : Status code => ${response.statusCode}');
  }
}
