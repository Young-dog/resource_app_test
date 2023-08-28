import 'package:flutter/material.dart';

class SnackBarService extends LabeledGlobalKey<ScaffoldMessengerState> {
  SnackBarService({String? debugLabel}) : super(debugLabel);

  void show({required SnackBar snackBar}) =>
      currentState?.showSnackBar(snackBar);
}
