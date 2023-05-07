import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:sow_good/models/patient.dart';
import 'package:sow_good/services/api_constants.dart';
import 'package:sow_good/services/auth_service.dart';

import '../models/diary_events.dart';
import 'package:sow_good/utils.dart';

class PatientService {
  Future<Patient?> getPatient() async {
    final String? token = await AuthService().refreshToken();
    final http.Response response =
        await http.get(Uri.parse(ApiConstants.patient), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      Patient? patient = Patient.fromJson(jsonData);
      return patient;
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

  Future<List<DiaryEvents>?> getDiaryEvents() async {
    final String? token = await AuthService().refreshToken();
    final http.Response response =
        await http.get(Uri.parse(ApiConstants.getDiaryEvents), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      List<DiaryEvents> diaryEvents0 = [];
      List<dynamic> jsonData = jsonDecode(response.body);
      for (dynamic k in jsonData) {
        DiaryEvents diaryEvents = DiaryEvents.fromJson(k);
        diaryEvents0.add(diaryEvents);
      }
      return diaryEvents0;
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to get patient diary events');
    }
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

  Future<File> downloadImage(String s3Url) async {
    final http.Response response = await http.get(Uri.parse(s3Url));

    final Directory tempDir = await getTemporaryDirectory();

    final DateTime now = DateTime.now();
    final String fileName =
        '${now.year}${now.month}${now.day}${now.microsecondsSinceEpoch}.jpg';
    final File file = File('${tempDir.path}/$fileName');

    await file.writeAsBytes(response.bodyBytes);

    return file;
  }
}
