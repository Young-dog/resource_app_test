import 'package:flutter/material.dart';

class DataField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode passFocusNode;
  final TextTheme theme;

  const DataField({
    required this.controller,
    required this.theme,
    required this.passFocusNode,
    super.key,
  });

  @override
  State<DataField> createState() => _DataFieldState();
}

class _DataFieldState extends State<DataField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        style: widget.theme.labelSmall,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
          ),
          labelText: "E-mail",
        ),
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(widget.passFocusNode);
        },
        onSaved: (value) {
          widget.controller.text = value!;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Укажите E-mail';
          }
          return null;
        },
      ),
    );
  }
}
