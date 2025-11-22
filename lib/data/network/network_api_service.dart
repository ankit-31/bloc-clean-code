import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloccleancode/data/exceptions/app_exceptions.dart';
import 'package:bloccleancode/data/network/base_api_services.dart';

import 'package:http/http.dart' as http;

class NetworkApiService implements BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;

    try {
      var response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw ServerException('');
    } on TimeoutException {
      throw RequestTimeout('request time outt');
    }

    return responseJson;
  }

  @override
  Future postApi(String url, var data) async {
    dynamic reponseJson;
    print('jjjj');
    print(data);

    try {
      var response = await http
          .post(
            Uri.parse(url),
            headers: {'x-api-key': 'reqres-free-v1'},
            body: data, //they use form data
          )
          .timeout(Duration(seconds: 10));
      reponseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeout {
      throw RequestTimeout();
    }

    return reponseJson;
  }

  dynamic returnResponse(http.Response response) {
    print(response.statusCode);

    switch (response.statusCode) {
      case 200:
        dynamic data = jsonDecode(response.body);
        return data;
      case 400:
        throw InternetException('exception found');

      default:
        throw FetchException('Error while hitting api');
    }
  }
}
