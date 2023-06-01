import 'package:flutter/material.dart';

class FieldDataForUser extends StatefulWidget {
  final double height;
  final TextTheme theme;
  final String name;
  final Function callback;
  final TextEditingController controller;

  const FieldDataForUser({
    Key? key,
    required this.height,
    required this.theme,
    required this.name,
    required this.controller,
    required this.callback,
  }) : super(key: key);

  @override
  State<FieldDataForUser> createState() => _FieldDataForUserState();
}

class _FieldDataForUserState extends State<FieldDataForUser> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        style: widget.theme.labelSmall,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.white),
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
        onSaved: (value) {
          widget.controller.text = value!;
        },
        validator: (value) {
          return widget.callback(value);
        },
      ),
    );
  }
}
