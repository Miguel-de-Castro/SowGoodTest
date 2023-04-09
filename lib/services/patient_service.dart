import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sow_good/models/patient.dart';

class PatientService {
  static const String apiUrl = 'http://localhost:8080/api/v1/patients';

  Future<Map<String, dynamic>> getPatients(String uidAuth) async {
    final http.Response response =
        await http.get(Uri.parse('$apiUrl/$uidAuth'), headers: {
      'Content-Type': 'application/json',
    });
    return response.body as Map<String, dynamic>;
  }

  Future<String> postPatients(Patient patient) async {
    print(jsonEncode(patient.toJson()));
    final http.Response response = await http
        .post(Uri.parse(apiUrl), body: jsonEncode(patient.toJson()), headers: {
      'Content-Type': 'application/json',
    });
    return response.body;
  }
}
