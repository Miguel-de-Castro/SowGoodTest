import 'package:flutter/material.dart';
import 'package:sow_good/models/default_view_state.dart';
import 'package:sow_good/models/doctor.dart';
import 'package:sow_good/services/patient_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../models/health_insurance.dart';
import '../views/screens/profile_doctor.dart';

class ProfileDoctorViewmodel extends ChangeNotifier {
  DefaultViewState state = DefaultViewState.started;
  List<HealthInsurance> healthInsurances = [
    const HealthInsurance(
        name: 'Bradesco',
        image:
            'data:image/png;base64,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'),
    const HealthInsurance(
        name: 'Bradesco',
        image:
            'data:image/png;base64,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'),
    const HealthInsurance(
        name: 'Bradesco',
        image:
            'data:image/png;base64,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'),
  ];

  void update(DefaultViewState newState) {
    state = newState;
    notifyListeners();
  }

  void nextScreen(BuildContext context) {
    print("nextScreen");
  }

  void openMaterials() async {}

  Map<String, dynamic> doctor = {};

  String name = ' ';
  String crm = ' ';
  String expertise = ' ';
  String adress = ' ';
  String description = ' ';
  String rqe = ' ';

  Future<bool> getDoctorData() async {
    update(DefaultViewState.loading);

    doctor = await PatientService().getDoctorFromPatient() ?? {};
    Doctor current = Doctor.fromJson(doctor);
    this.name = current.name ?? "-----Caiunaleituradaviewmodel";
    this.crm = current.crm ?? "-----Caiunaleituradaviewmodel";
    this.expertise = current.expertise ?? "-----Caiunaleituradaviewmodel";
    this.adress = current.address ?? "-----Caiunaleituradaviewmodel";
    this.description = current.description ?? "-----Caiunaleituradaviewmodel";
    this.rqe = current.rqe ?? "-----Caiunaleituradaviewmodel";

    update(DefaultViewState.requestSucceed);
    return true;
  }

  String getname() {
    return name;
  }

  String getCrm() {
    return crm;
  }

  String getExpertise() {
    return expertise;
  }

  String getAdress() {
    return adress;
  }

  String getDescription() {
    return description;
  }

  String getRqe() {
    return rqe;
  }

  Future<void> openMap() async {
    double lat = -30.0592974;
    double longi = -51.1729965;
    String googleURL =
        'https://www.google.com/maps/search/?api=1&query=$lat,$longi';

    if (await canLaunchUrlString(googleURL)) {
      await launchUrlString(googleURL);
    } else {
      throw 'couldnt open map';
    }
  }
}
