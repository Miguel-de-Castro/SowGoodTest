import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sow_good/models/patient.dart';
import 'package:sow_good/services/patient_service.dart';
import '../services/auth_service.dart';

class ProfilePatientViewmodel extends ChangeNotifier {
  ProfilePatientViewState state = ProfilePatientViewState.started;
  String? error;
  Patient? patient;

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
    try {
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

  String imageLink =
      'https://cdn.pixabay.com/photo/2015/03/17/01/57/kid-677080_1280.jpg';

  Future<void> getPatientData() async {
    try {
      update(ProfilePatientViewState.loading);
      patient = await PatientService().getPatient();
      if (patient != null) {
        update(ProfilePatientViewState.requestPatientDataSucceed);
      } else {
        update(ProfilePatientViewState.requestFailed);
      }
    } catch (e) {
      update(ProfilePatientViewState.requestFailed);
    }
  }

  int getCurrentAge(String birthDate) {
    try {
      final inputFormat = DateFormat('dd/MM/yyyy');
      var birthday = inputFormat.parse(birthDate);
      DateTime currentDate = DateTime.now();
      int age = currentDate.year - birthday.year;
      int month1 = currentDate.month;
      int month2 = birthday.month;
      if (month2 > month1) {
        age--;
      } else if (month1 == month2) {
        int day1 = currentDate.day;
        int day2 = birthday.day;
        if (day2 > day1) {
          age--;
        }
      }
      return age;
    } on Exception catch (e) {
      return 0;
    }
  }
}

enum ProfilePatientViewState {
  started,
  loading,
  navigateToDoctor,
  navigateToDiary,
  requestFailed,
  requestLogoutSucceed,
  requestPatientDataSucceed
}
