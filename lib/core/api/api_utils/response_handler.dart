import 'dart:convert';
import 'network_exception.dart';

class ResponseHandler {
  static Map<String, dynamic> handleResponse(String responseBody) {
    final responseJson = json.decode(responseBody);
    if (responseJson['error'] != null) {
      throw NetworkException(responseJson['error']);
    }
    return responseJson;
  }
}
