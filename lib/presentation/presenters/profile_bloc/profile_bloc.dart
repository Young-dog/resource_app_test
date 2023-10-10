import 'dart:async';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/domain.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required ImagePicker picker,
    required UserProfileRepositories userProfileRepositories,
    String? username,
    String? email,
    String? uid,
    String? avatarUri,
  })  : _userProfileRepositories = userProfileRepositories,
        _picker = picker,
        super(
          ProfileState.initial(
            username: username,
            email: email,
            uid: uid,
            avatarUri: avatarUri,
          ),
        ) {
    on<ChangeProfileUsernameEvent>(_onChangeProfileUsername);
    on<ChangeProfileEmailEvent>(_onChangeProfileEmail);
    on<ChangeProfileAvatarEvent>(_onChangeProfileAvatar);
    on<SubmitChangesEvent>(_onSubmit);
  }

  final ImagePicker _picker;

  final UserProfileRepositories _userProfileRepositories;

  Future<void> _onChangeProfileUsername(
    ChangeProfileUsernameEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ProfileStatus.changed,
        username: event.username,
      ),
    );
  }

  Future<void> _onChangeProfileEmail(
    ChangeProfileEmailEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ProfileStatus.changed,
        email: event.email,
      ),
    );
  }

  Future<void> _onChangeProfileAvatar(
    ChangeProfileAvatarEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final response = await _picker.pickImage(
        source: ImageSource.gallery,
      );

      if (response != null) {
        emit(
          state.copyWith(
            status: ProfileStatus.loadingImg,
          ),
        );
        final file = File(response.path);
        final uri = await _userProfileRepositories.changeImageAvatar(
          file: file,
          uid: state.uid,
        );
        emit(
          state.copyWith(
            avatarUri: uri,
          ),
        );
      }
      emit(
        state.copyWith(
          status: ProfileStatus.changedImg,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: ProfileStatus.failure,
        ),
      );
    }
  }

  Future<void> _onSubmit(
    SubmitChangesEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ProfileStatus.loading,
      ),
    );

    try {
      await _userProfileRepositories.setUserSessionRemote(
        userProfile: UserProfile(
          uid: state.uid,
          username: state.username,
          email: state.email,
          avatarUri: state.avatarUri,
        ),
      );
      emit(
        state.copyWith(
          status: ProfileStatus.success,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: ProfileStatus.failure,
        ),
      );
    }
  }
}
