import 'package:flutter/material.dart';

class PassField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextTheme theme;
  final String error;
  final String name;

  const PassField({
    required this.controller,
    required this.theme,
    required this.focusNode,
    required this.error,
    required this.name,
    super.key,
  });

  @override
  State<PassField> createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        style: widget.theme.labelSmall,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
          ),
          labelText: widget.name,
        ),
        obscureText: true,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(widget.focusNode);
        },
        onSaved: (value) {
          widget.controller.text = value!;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return widget.error;
          }
          return null;
        },
      ),
    );
  }
}
