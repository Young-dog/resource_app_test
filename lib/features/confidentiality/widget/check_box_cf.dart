import 'package:flutter/material.dart';

import '../../../theme/style_for_text.dart';

class CheckBoxCF extends StatefulWidget {
  bool valueConf;
  final String name;

  CheckBoxCF({super.key, required this.name, required this.valueConf});

  @override
  State<CheckBoxCF> createState() => _CheckBoxCFState();
}

class _CheckBoxCFState extends State<CheckBoxCF> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      side: const BorderSide(
        color: Colors.grey,
        width: 1,
      ),
      activeColor: Colors.transparent,
      title: Text(
        widget.name,
        style: styleForCountFollowersMedium,
      ),
      value: widget.valueConf,
      onChanged: (bool? value) {
        setState(() {
          widget.valueConf = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
