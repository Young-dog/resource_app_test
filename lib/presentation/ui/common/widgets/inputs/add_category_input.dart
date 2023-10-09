import 'package:flutter/material.dart';

import '../../../../../app/app.dart';

class AddCategoryInput extends StatelessWidget {
  const AddCategoryInput({
    required this.showColor,
    required this.color,
    required this.onChanged,
    this.controller,
    super.key,
  });

  final void Function(BuildContext context) showColor;
  final void Function(String) onChanged;
  final String? color;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Container(
          height: theme.spacings.x10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(theme.radiuses.x4),
            border: Border.all(color: theme.palette.iconSecondary),
          ),
          child: TextFormField(
            controller: controller,
            style: theme.textTheme.bodySmall!.copyWith(fontSize: 14),
            cursorColor: theme.palette.textTertiary,
            decoration: InputDecoration(
              hintStyle: theme.textTheme.bodySmall!.copyWith(
                color: theme.palette.textTertiary,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: theme.spacings.x4,
                vertical: 0,
              ),
              hintText: 'Введите название категории',
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: onChanged,
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: theme.spacings.x4,
          child: Center(
            child: GestureDetector(
              onTap: () {
                showColor(context);
              },
              child: Container(
                height: theme.spacings.x7,
                width: theme.spacings.x7,
                decoration: BoxDecoration(
                  color: Color(
                    int.parse('0xFF${color ?? '38b000'}'),
                  ),
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: theme.palette.iconSecondary, width: 2),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
