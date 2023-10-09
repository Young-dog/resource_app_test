import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'avatar_uri_request_dto.g.dart';

@JsonSerializable()
class AvatarUriRequestDto extends Equatable {
  const AvatarUriRequestDto({
    required this.avatarUri,
  });

  final String avatarUri;

  factory AvatarUriRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AvatarUriRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarUriRequestDtoToJson(this);

  @override
  List<Object?> get props => [
        avatarUri,
      ];
}
