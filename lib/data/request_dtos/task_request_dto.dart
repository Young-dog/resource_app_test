import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/domain.dart';
import '../data.dart';

part 'task_request_dto.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class TaskRequestDto extends HiveObject with EquatableMixin {
  TaskRequestDto({
    required this.title,
    required this.subtasks,
    required this.note,
    required this.dateFirst,
    required this.notify,
    required this.level,
    required this.category,
    required this.dateSecond,
    required this.finish,
  });

  @HiveField(0)
  final String title;

  @HiveField(1)
  final List<SubtaskRequestDto> subtasks;

  @HiveField(2)
  final String? note;

  @HiveField(3)
  DateTime? dateFirst;

  @HiveField(4)
  DateTime? notify;

  @HiveField(5)
  DateTime? dateSecond;

  @HiveField(6)
  LevelImportance? level;

  @HiveField(7)
  CategoryTaskRequestDto? category;

  @HiveField(8)
  final bool finish;

  factory TaskRequestDto.fromJson(Map<String, dynamic> json) =>
      _$TaskRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskRequestDtoToJson(this);

  TaskRequestDto copyWith({
    String? title,
    List<SubtaskRequestDto>? subtasks,
    String? note,
    DateTime? dateFirst,
    DateTime? notify,
    DateTime? dateSecond,
    LevelImportance? level,
    CategoryTaskRequestDto? category,
    bool? finish,
  }) {
    return TaskRequestDto(
      title: title ?? this.title,
      subtasks: subtasks ?? this.subtasks,
      note: note ?? this.note,
      dateFirst: dateFirst ?? this.dateFirst,
      notify: notify ?? this.notify,
      level: level ?? this.level,
      category: category ?? this.category,
      dateSecond: dateSecond ?? this.dateSecond,
      finish: finish ?? this.finish,
    );
  }

  void deleteDateFirst() {
    dateFirst = null;
    dateSecond = null;
  }

  void deleteDateSecond() {
    dateSecond = null;
  }

  void deleteCategory() {
    category = null;
  }

  void deleteLevel() {
    level = null;
  }

  void deleteNotify() {
    notify = null;
  }

  @override
  List<Object?> get props => [
        title,
        subtasks,
        note,
        dateFirst,
        notify,
        dateSecond,
        level,
        category,
        finish,
      ];
}
