import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../app/app.dart';

class ProfileInput extends StatelessWidget {
  const ProfileInput({
    required this.title,
    required this.initialValue,
    required this.icon,
    required this.onChanged,
    this.enabled,
    super.key,
  });

  final String title;
  final String initialValue;
  final String icon;
  final bool? enabled;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: theme.spacings.x1,
        ),
        Container(
          constraints: BoxConstraints(
            maxHeight: theme.spacings.x13,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacings.x2,
            vertical: theme.spacings.x1,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.palette.borderSecondary,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(
              theme.radiuses.x2,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: theme.spacings.x6,
                color: theme.palette.iconPrimary,
              ),
              SizedBox(width: theme.spacings.x2,),
              Expanded(
                child: TextFormField(
                  enabled: enabled,
                  textAlignVertical: TextAlignVertical.top,
                  textInputAction: TextInputAction.done,
                  style: theme.textTheme.bodySmall,
                  initialValue: initialValue,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
