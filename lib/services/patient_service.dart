import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sow_good/models/patient.dart';

class PatientService {

  static const String apiUrl = 'http://ec2-18-119-119-203.us-east-2.compute.amazonaws.com:80/api/v1/patients';

    Future<Map<String, dynamic>?> getPatient(String uidAuth) async {
        final response = await http.get(Uri.parse('$apiUrl/$uidAuth'));
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
    final http.Response response = await http
        .post(Uri.parse(apiUrl), body: jsonEncode(patient.toJson()), headers: {
      'Content-Type': 'application/json',
    });
    return response.body;
  }
}
