import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _busy = false;
  bool isDisposed = false;
  bool hasError = false;
  String? _errorMessage;

  Future<void> initModel();

  bool get busy => _busy;

  set busy(bool value) {
    _busy = value;
    if (!isDisposed) {
      notifyListeners();
    }
  }

  String? get errorMessage => _errorMessage;

  set errorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  bool get hasErrorMessage =>
      _errorMessage != null && _errorMessage!.isNotEmpty;

  late void Function() toRetry;

  void retry() {
    hasError = false;
    notifyListeners();
    toRetry();
  }

  void handleError(void Function() toRetryFunc) {
    hasError = true;
    toRetry = toRetryFunc;
  }

  @override
  void dispose() {
    debugPrint('Model disposed: $runtimeType');
    isDisposed = true;
    super.dispose();
  }
}
