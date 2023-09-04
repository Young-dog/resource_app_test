import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request_dto.g.dart';

@JsonSerializable()
class SignInRequestDto extends Equatable {
  const SignInRequestDto({
    required this.email,
    required this.password,
});

  final String email;
  final String password;

  factory SignInRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestDtoToJson(this);

  @override
  List<Object?> get props => [
    email,
    password,
  ];

}