import 'package:flutter/material.dart';

import '/backend/backend.dart';
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

  String _text = '';
  String get text => _text;
  set text(String _value) {
    _text = _value;
  }

  String _pushnotification = '';
  String get pushnotification => _pushnotification;
  set pushnotification(String _value) {
    _pushnotification = _value;
  }

  DateTime? _Selectdate = DateTime.fromMillisecondsSinceEpoch(1700814720000);
  DateTime? get Selectdate => _Selectdate;
  set Selectdate(DateTime? _value) {
    _Selectdate = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
