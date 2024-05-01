import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _apikey = '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';
  String get apikey => _apikey;
  set apikey(String _value) {
    _apikey = _value;
  }

  String _speechToTextResponse = '';
  String get speechToTextResponse => _speechToTextResponse;
  set speechToTextResponse(String _value) {
    _speechToTextResponse = _value;
  }

  int _timerValue = 0;
  int get timerValue => _timerValue;
  set timerValue(int _value) {
    _timerValue = _value;
  }

  String _apiKey = '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';
  String get apiKey => _apiKey;
  set apiKey(String _value) {
    _apiKey = _value;
  }
}
