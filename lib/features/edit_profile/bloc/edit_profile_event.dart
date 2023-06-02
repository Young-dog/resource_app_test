part of 'edit_profile_bloc.dart';

@immutable
abstract class EditProfileEvent {}

class UploadDataProfileEvent extends EditProfileEvent {
  final UserUpdate userUpdate;

  UploadDataProfileEvent({required this.userUpdate});
}
