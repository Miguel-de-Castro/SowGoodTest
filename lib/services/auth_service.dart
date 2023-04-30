import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final AuthService _authService = AuthService._internal();

  UserCredential? _userCredential;

  factory AuthService() {
    return _authService;
  }

  AuthService._internal();

  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    _userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userCredential != null;
  }

  Future<String?> refreshToken() async {
    final token = await _userCredential?.user?.getIdTokenResult();
    return token?.token;
  }
}
