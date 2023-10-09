// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../../app/app.dart';
import '../../../../../../generated/l10n.dart';

class SubtaskInput extends StatefulWidget {
  SubtaskInput({
    required this.onPressed,
    this.controller,
    this.name,
    this.value = false,
    super.key,
  });

  final TextEditingController? controller;
  String? name;
  bool value;
  final void Function({
    required String name,
    required bool value,
  }) onPressed;

  @override
  State<SubtaskInput> createState() => _SubtaskInputState();
}

class _SubtaskInputState extends State<SubtaskInput> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 0.8,
          child: CheckboxTheme(
            data: const CheckboxThemeData(
              shape: CircleBorder(),
            ),
            child: Checkbox(
              activeColor: Colors.transparent,
              value: widget.value,
              onChanged: (value) {
                if (widget.controller == null) {
                  widget.onPressed(
                    name: widget.name ?? '',
                    value: value ?? false,
                  );
                  setState(() {
                    widget.value = value ?? false;
                  });
                }

              },
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            initialValue: widget.name,
            controller: widget.controller,
            maxLines: null,
            maxLength: 150,
            cursorColor: theme.palette.textTertiary,
            decoration: InputDecoration(
              counterText: '',
              hintText: S.of(context).subtaskHintTitle,
              hintStyle: theme.textTheme.bodySmall!.copyWith(
                color: theme.palette.textTertiary,
              ),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            onChanged: (value) {
              if (widget.controller == null) {
                widget.onPressed(
                  name: value,
                  value: widget.value,
                );
              }
              widget.name = value;
            },
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.multiline,
            style: theme.textTheme.bodySmall!.copyWith(
              color: theme.palette.textTertiary,
              decoration: widget.value ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
        SizedBox(
          width: theme.spacings.x2,
        ),
        if (widget.controller != null)
          Transform.scale(
            scale: 0.8,
            child: IconButton(
              onPressed: () {
                widget.onPressed(
                    name: widget.controller?.text ?? widget.name ?? '',
                    value: widget.value,);
              },
              icon: const Icon(Icons.add),
            ),
          ),
      ],
    );
  }
}
