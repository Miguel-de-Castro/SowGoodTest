import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sow_good/models/patient.dart';
import 'package:sow_good/services/api_constants.dart';
import 'package:sow_good/services/auth_service.dart';
import 'package:sow_good/services/patient_service.dart';

import 'package:sow_good/utils.dart';

class DoctorService {
  Map<String, dynamic> patient = {};

  Future<Map<String, dynamic>?> getDoctorFromPatient() async {
    patient = await PatientService().getPatient() ?? {};
    Patient current = Patient.fromJson(patient);

    final String? token = current.doctorId;
    final http.Response response =
        await http.get(Uri.parse(ApiConstants.doctor), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to get Doctor Data');
    }
  }
}
