import 'package:flutter/material.dart';
import 'package:sow_good/models/default_view_state.dart';
import 'package:sow_good/models/patient.dart';
import 'package:sow_good/utils.dart';

import '../services/patient_service.dart';

class AddDiaryViewModel extends ChangeNotifier {
  String diaryError = '';
  DefaultViewState state = DefaultViewState.started;

  void update(DefaultViewState newState) {
    state = newState;
    notifyListeners();
  }

  Future<bool> createDiary(
    String title,
    String date,
    String description,
    String link,
  ) async {
    try {
      update(DefaultViewState.loading);
      if (description == '') {
        description = ' ';
      }
      Diary diary =
          Diary(title: title, date: date, description: description, link: link);
      String? response = await PatientService().postDiary(diary);
      if (response == null) {
        update(DefaultViewState.requestSucceed);
      } else {
        diaryError = response;
        update(DefaultViewState.requestFailed);
      }
      return false;
    } catch (e) {
      update(DefaultViewState.requestFailed);
      return false;
    }
  }
}
