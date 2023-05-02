import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sow_good/models/default_view_state.dart';
import 'package:sow_good/services/patient_service.dart';
import '../services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  String userError = '';
  DefaultViewState state = DefaultViewState.started;
  Map<String, dynamic> patient = {};

  void update(DefaultViewState newState){
    state = newState;
    notifyListeners();
  }

  void signIn(BuildContext context, TextEditingController emailController,
      TextEditingController passwordController) async {
    try {
      update(DefaultViewState.loading);
      await AuthService().login(
        email: emailController.text,
        password: passwordController.text,
      );

      patient = await PatientService().getPatient() ?? {};
      if (!patient.isNotEmpty) {
        userError = 'Apenas para pacientes';
        update(DefaultViewState.requestFailed);
      } else {
        update(DefaultViewState.requestSucceed);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        userError = 'Email invalido';
        update(DefaultViewState.requestFailed);
      }
      if (e.code == 'user-not-found') {
        userError = 'Usuário não encontrado';
        update(DefaultViewState.requestFailed);
      }
      if (e.code == 'wrong-password') {
        userError = 'Sua senha esta incorreta';
        update(DefaultViewState.requestFailed);
      }
    }
  }


}
