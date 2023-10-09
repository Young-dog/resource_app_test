import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subtask_request_dto.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class SubtaskRequestDto extends Equatable {
  const SubtaskRequestDto({
    required this.title,
    required this.finish,
  });

  @HiveField(0)
  final String title;

  @HiveField(1)
  final bool finish;

  factory SubtaskRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SubtaskRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubtaskRequestDtoToJson(this);

  @override
  List<Object?> get props => [
        title,
        finish,
      ];
}
