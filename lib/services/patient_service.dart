import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sow_good/models/patient.dart';
import 'package:sow_good/services/api_constants.dart';


class PatientService {

  Future<Map<String, dynamic>?> getPatient(String token) async {
    final response = await http.get(Uri.parse(ApiConstants.patient), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to get patient data');
    }
  }

  Future<String> postPatients(Patient patient) async {
    print(jsonEncode(patient.toJson()));
    final http.Response response = await http.post(
        Uri.parse(ApiConstants.registerPatient),
        body: jsonEncode(patient.toJson()),
        headers: {
          'Content-Type': 'application/json',
        });
    return response.body;
  }
}
