import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sow_good/models/patient.dart';
import 'package:sow_good/services/patient_service.dart';
import '../services/auth_service.dart';
import 'dart:io';

class ProfilePatientViewmodel extends ChangeNotifier {
  ProfilePatientViewState state = ProfilePatientViewState.started;
  String? error;
  File? file;
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
    } on Exception {
      error = 'Erro ao fazer logout';
      update(ProfilePatientViewState.requestFailed);
    }
  }

  Future<void> getPatientData(String? imageUrl) async {
    try {
      update(ProfilePatientViewState.loading);
      patient = await PatientService().getPatient();
      file = await PatientService().downloadImage(imageUrl!);
      if (patient != null && file != null) {
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
      final DateFormat inputFormat = DateFormat('dd/MM/yyyy');
      DateTime birthday = inputFormat.parse(birthDate);
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
    } on Exception {
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
