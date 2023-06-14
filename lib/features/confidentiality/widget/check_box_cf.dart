import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/style_for_text.dart';
import '../bloc/confidentiality_bloc.dart';


// ignore: must_be_immutable
class CheckBoxCF extends StatefulWidget {
  bool valueConf;
  final String name;
  final String nameKey;
  final String data;
  final String sdName;

  CheckBoxCF({
    super.key,
    required this.name,
    required this.valueConf,
    required this.data,
    required this.sdName,
    required this.nameKey,
  });

  @override
  State<CheckBoxCF> createState() => _CheckBoxCFState();
}

class _CheckBoxCFState extends State<CheckBoxCF> {
  @override
  Widget build(BuildContext context) {
    final confBloc = context.read<ConfidentialityBloc>();

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
          confBloc.add(
            ConfidentialityUpdateEvent(
              conf: value,
              fieldName: widget.nameKey,
              data: widget.data,
              fieldSdName: widget.sdName,
            ),
          );
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
