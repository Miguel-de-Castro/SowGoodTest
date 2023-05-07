import 'package:flutter/material.dart';
import 'package:sow_good/models/diary_events.dart';
import 'package:sow_good/services/patient_service.dart';
import '../models/default_view_state.dart';

class DiaryEventsViewmodel extends ChangeNotifier {
  DefaultViewState state = DefaultViewState.started;
  DiaryEventsViewmodel();

  List<DiaryEvents> _diaryEvents = [];
  List<DiaryEvents> get diaryEvents => _diaryEvents;

  void update(DefaultViewState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> getDiaryEvents() async {
    try {
      update(DefaultViewState.loading);
      _diaryEvents = (await PatientService().getDiaryEvents())!;
      update(DefaultViewState.requestSucceed);
    } catch (e) {
      update(DefaultViewState.requestFailed);
    }
  }
}
