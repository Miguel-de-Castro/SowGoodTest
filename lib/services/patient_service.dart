// TO-DO
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class PatientService {
  static const String apiUrl = 'http://localhost:8080/api/v1/patients';

  final FirebaseAuth auth;

  PatientService({required this.auth});

  Future<String?> getIdToken() async {
    final User? user = auth.currentUser;
    if (user != null) {
      final String idToken = await user.getIdToken();
      return idToken;
    }
    return null;
  }

  Future<void> getPatients(String uidAuth) async {
    final String? idToken = await getIdToken();
    if (idToken != null) {
      final response = await http.get(
        Uri.parse('$apiUrl/$uidAuth'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $idToken',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
        },
      );
      print(response.body);
    } else {
      // Handle the error
    }
  }
}