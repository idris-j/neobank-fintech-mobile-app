import 'dart:developer';

import 'package:dio/dio.dart';

import '../../data_models/api_response.dart';
import 'network_exception.dart';
// import 'package:http/http.dart' as api;

dynamic responseHandler(Response response, {bool hideLog = false}) async {
  log("in response handler");

  log("response $response status code ${response.statusCode} body: ${response.data} ");
  String exceptionMsg;
  ApiResponse responseBody = ApiResponse();
  try {
    responseBody = apiResponseFromJson(response.toString());
    exceptionMsg = responseBody.message!;
    print("Error message derived: $exceptionMsg");
  } catch (e) {
    print("Error deriving error message: $e");
    exceptionMsg = response.data;
    // exceptionCode = response.statusCode.toString();
  }

  if (!hideLog) {
    print(response.data);
    print("status code: ${response.statusCode}");
  }

  switch (response.statusCode) {
    case 201:
      return response.data;
    case 200:
      return response.data;

    case 400:
      throw BadRequestException(exceptionMsg);
    case 401:
      throw UnauthorisedException(exceptionMsg);
    case 403:
      throw UnauthorisedException(exceptionMsg);
    case 404:
      throw FileNotFoundException(exceptionMsg);
    case 422:
      //extract errors
      try {
        responseBody = apiResponseFromJson(response.data);
        exceptionMsg = responseBody.code!.toString();
      } catch (e) {
        print("could not extract errors");
      }

      throw AlreadyRegisteredException(exceptionMsg);
    case 500:
    default:
      throw FetchDataException('$exceptionMsg!');
  }
}
