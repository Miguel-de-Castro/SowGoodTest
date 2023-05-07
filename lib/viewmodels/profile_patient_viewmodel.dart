import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class ProfilePatientViewmodel extends ChangeNotifier{

  ProfilePatientViewState state = ProfilePatientViewState.started;
  String? error;

  void update(ProfilePatientViewState newState) {
    state = newState;
    notifyListeners();
  }

  void navigateToDoctor() {
    update(ProfilePatientViewState.navigateToDoctor);
    
  }

  void navigateToDiaryScreen() {
     update(ProfilePatientViewState.navigateToDiary);
  }
  

  Future<void> logout() async {
    try{
    update(ProfilePatientViewState.loading);
    bool response = await AuthService().logout();
    if (response) {
      update(ProfilePatientViewState.requestLogoutSucceed);
    }
    } on Exception catch (e) {
      error = "Erro ao fazer logout";
      update(ProfilePatientViewState.requestFailed);
    }
  }
}

enum ProfilePatientViewState{
  started,
  loading,
  navigateToDoctor,
  navigateToDiary,
  requestFailed,
  requestLogoutSucceed,
}
  

