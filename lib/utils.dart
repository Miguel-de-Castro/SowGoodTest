import 'dart:convert';

String decodeError(String response) {
  Map<String, String> body = jsonDecode(response);
  return body['message'] ?? '';
}
