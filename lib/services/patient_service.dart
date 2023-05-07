import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sow_good/models/patient.dart';
import 'package:sow_good/services/api_constants.dart';
import 'package:sow_good/services/auth_service.dart';
import 'package:sow_good/utils.dart';

class PatientService {
  Future<Map<String, dynamic>?> getPatient() async {
    final String? token = await AuthService().refreshToken();
    final http.Response response =
        await http.get(Uri.parse(ApiConstants.patient), headers: {
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
    final http.Response response = await http.post(
        Uri.parse(ApiConstants.registerPatient),
        body: jsonEncode(patient.toJson()),
        headers: {
          'Content-Type': 'application/json',
        });
    return response.body;
  }

  Future<String?> postDiary(Diary diary) async {
    final String? token = await AuthService().refreshToken();
    final http.Response response = await http.post(
        Uri.parse(ApiConstants.addDiary),
        body: jsonEncode(diary.toJson()),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 204) {
      return null;
    }
    return decodeError(response.body);
  }
}
