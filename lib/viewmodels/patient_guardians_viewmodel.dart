import 'package:flutter/material.dart';
import 'package:sow_good/models/patient.dart';
import 'package:sow_good/services/patient_service.dart';

import '../models/default_view_state.dart';

class RegisterPatientGuardiansViewModel extends ChangeNotifier {
  late Patient patient;
  final List<TextEditingController> _textControllers =
      <TextEditingController>[];
  static const String routeName = '/registerGuardians';
  DefaultViewState state = DefaultViewState.started;

  RegisterPatientGuardiansViewModel();
  List<TextEditingController> get textControllers => _textControllers;

  void update(DefaultViewState newState) {
    state = newState;
    notifyListeners();
  }

  void add() {
    _textControllers.add(TextEditingController());
  }

  Future<String> registerPatient(Patient patient) async {
    try {
      update(DefaultViewState.loading);
      patient.guardians = [];
      for (TextEditingController guardiansController in textControllers) {
        patient.guardians!.add(guardiansController.text);
      }
      update(DefaultViewState.requestSucceed);
      return await PatientService().postPatients(patient);
    } catch (e) {
      update(DefaultViewState.requestFailed);
      return 'Erro';
    }
  }

  Future<void> addGuardian() async {
    _textControllers.add(TextEditingController());
    notifyListeners();
  }

  Future<void> removeGuardian(int index) async {
    _textControllers.removeAt(index);
    notifyListeners();
  }

  void register() async {}
}
