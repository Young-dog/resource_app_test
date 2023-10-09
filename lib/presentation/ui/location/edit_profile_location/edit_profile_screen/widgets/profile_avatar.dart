import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../app/app.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    required this.avatar,
    required this.onChanged,
    super.key,
  });

  final String avatar;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onChanged,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          theme.radiuses.x10 * 2,
        ),
        child: Container(
          height: theme.spacings.x20 * 2,
          width: theme.spacings.x20 * 2,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: theme.palette.borderSecondary,
              width: theme.spacings.x1 / 2,
            ),
          ),
          child: avatar.isEmpty
              ? Center(
                  child: SizedBox(
                    height: theme.spacings.x20,
                    width: theme.spacings.x20,
                    child: SvgPicture.asset(
                      AssetNames.userAvatar,
                      color: theme.palette.iconSecondary,
                    ),
                  ),
                )
              : FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Image.asset(
                    avatar,
                  ),
                ),
        ),
      ),
    );
  }
}
