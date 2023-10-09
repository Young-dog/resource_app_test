import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class ProfileButton extends StatelessWidget {
  ProfileButton({
    super.key,
  });


  final userProfile = GetIt.instance<UserProfileBloc>().state.userProfile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        context.router.push(EditProfileRoute(userProfile: userProfile));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: theme.spacings.x2,
          horizontal: theme.spacings.x2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            theme.radiuses.x4,
          ),
          color: theme.palette.textSecondary.withOpacity(0.5),
        ),
        child: Row(
          children: [
            Container(
              height: theme.spacings.x15,
              width: theme.spacings.x15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.palette.bgPrimary,
              ),
            ),
            SizedBox(
              width: theme.spacings.x6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userProfile.username ?? '',
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                Text(
                  userProfile.email ?? '',
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.navigate_next,
              color: theme.palette.iconPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
