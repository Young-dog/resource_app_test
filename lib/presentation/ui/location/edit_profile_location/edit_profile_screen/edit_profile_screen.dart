import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../presentation.dart';
import 'view/view.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final userProfile = GetIt.instance<UserProfileBloc>().state.userProfile;

        return ProfileBloc(
          username: userProfile.username,
          uid: userProfile.uid,
          email: userProfile.email,
          avatarUri: userProfile.avatarUri,
          picker: GetIt.instance(),
          userProfileRepositories: GetIt.instance(),
        );
      },
      child: const EditProfileView(),
    );
  }
}
