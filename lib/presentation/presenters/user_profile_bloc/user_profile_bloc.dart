import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc({required UserProfileRepositories userProfileRepositories})
      : _userProfileRepositories = userProfileRepositories,
        super(
          UserProfileState(
            userProfile: userProfileRepositories.userProfile,
          ),
        ) {
    on<ChangeUserProfileEvent>(_onChangeUserProfile);
    init();
  }

  late final StreamSubscription<UserProfile> _userProfileSubscription;

  final UserProfileRepositories _userProfileRepositories;

  void init() {
    _userProfileSubscription =
        _userProfileRepositories.userProfileChanges.listen((userProfile) {
      add(ChangeUserProfileEvent(userProfile: userProfile));
    });
  }

  void _onChangeUserProfile(
    ChangeUserProfileEvent event,
    Emitter<UserProfileState> emit,
  ) {
    final newState = UserProfileState(
      userProfile: event.userProfile,
    );

    emit(newState);
  }

  @override
  Future<void> close() {
    _userProfileSubscription.cancel();
    return super.close();
  }
}
