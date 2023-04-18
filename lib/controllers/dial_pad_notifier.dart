import 'dart:async';
import 'package:flutter/material.dart';

class DialPadNotifier with ChangeNotifier {
  String _number = '';

  final StreamController<String> _numberController =
      StreamController<String>.broadcast();

  Stream<String> get number => _numberController.stream;
  String get rawNum => _number;

  void appendNumber({required String number, required int index}) {
    _number = _number.substring(0, index) + number + _number.substring(index);
    _numberController.sink.add(_number);
    notifyListeners();
  }

  void deleteNumber(int index) {
    if (_number.isNotEmpty && index > 0) {
      _number = _number.substring(0, index - 1) + _number.substring(index);
      _numberController.sink.add(_number);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _numberController.sink.close();
    super.dispose();
  }
}
