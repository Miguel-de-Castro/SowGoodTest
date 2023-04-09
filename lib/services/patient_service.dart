// TO-DO
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class PatientService {
  static const String apiUrl = 'http://localhost:8080/api/v1/patients';


  Future<void> getPatients(String uidAuth) async {
    print('$apiUrl/$uidAuth');
      final response = await http.get(
        Uri.parse('$apiUrl/$uidAuth'),
      );
    (response.statusCode);
  }
}