import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_task_request_dto.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class CategoryTaskRequestDto extends Equatable {
  const CategoryTaskRequestDto({
    required this.name,
    required this.color,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String? color;

  factory CategoryTaskRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryTaskRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryTaskRequestDtoToJson(this);

  @override
  List<Object?> get props => [
        name,
        color,
      ];
}
