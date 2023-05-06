import 'dart:js';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sow_good/models/default_view_state.dart';
import 'package:sow_good/services/patient_service.dart';
import '../services/auth_service.dart';
import '../views/screens/profile_doctor.dart';
import '../views/screens/diary_events.dart';

class ProfilePatientViewmodel extends ChangeNotifier {
  DefaultViewState state = DefaultViewState.started;

  void update(DefaultViewState newState) {
    state = newState;
    notifyListeners();
  }

  void nextScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const ProfileDoctor(),
        ));
  }

  void navigateToDiaryScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const DiaryEvents(),
        ));
  }
}
