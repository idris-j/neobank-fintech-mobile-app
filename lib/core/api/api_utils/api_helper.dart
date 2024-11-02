import 'dart:convert'; // For jsonEncode
import 'package:http/http.dart' as http;

class ApiHelper {
  // Method for GET requests
  static Future<http.Response> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return response;
  }

  // Method for POST requests
  static Future<http.Response> post(
      String url, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return response;
  }

  // Method for PUT requests
  static Future<http.Response> put(String url,
      {Map<String, dynamic>? body}) async {
    final response = await http.put(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: body != null ? jsonEncode(body) : null,
    );
    return response;
  }

  // Method for DELETE requests (optional)
  static Future<http.Response> delete(String url) async {
    final response = await http.delete(Uri.parse(url));
    return response;
  }
}
