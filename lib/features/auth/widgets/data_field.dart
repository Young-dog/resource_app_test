import 'package:flutter/material.dart';

class DataField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextTheme theme;
  final String error;
  final String name;

  const DataField({
    required this.controller,
    required this.theme,
    required this.focusNode,
    required this.error,
    required this.name,
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
          if (widget.name == 'Отображаемое имя')  {
            if (value.length < 3) {
              return 'Слишком короткое имя';
            }
          }
          return null;
        },
      ),
    );
  }
}
