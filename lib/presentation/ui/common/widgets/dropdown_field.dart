import 'package:flutter/material.dart';

import '../../../../app/app.dart';

class DropdownField<T> extends StatelessWidget {
  const DropdownField({
    required this.values,
    super.key,
  });

  final List<T> values;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: theme.spacings.x20 * 2,
      child: DropdownButtonFormField<T>(
        dropdownColor: theme.palette.iconSecondary,
        style: theme.textTheme.bodyMedium,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(theme.radiuses.x2),
          ),
        ),
        iconSize: 0,
        isExpanded: true,
        menuMaxHeight: theme.spacings.x20,
        items: _buildItems(),
        onChanged: (Object? value) {},
      ),
    );
  }

  List<DropdownMenuItem<T>> _buildItems() {
    return values
        .map(
          (T value) => DropdownMenuItem<T>(
            child: Text(
              value.toString(),
            ),
            value: value,
          ),
        )
        .toList();
  }
}
