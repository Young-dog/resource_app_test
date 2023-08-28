import 'package:flutter/material.dart';

class SuccessSnackBar extends SnackBar {
  SuccessSnackBar({
    required String message,
    super.key,
  }) : super(
    content: _buildContent(message),
  );

  static Widget _buildContent(String message) {
    return Text(message);
  }
}

