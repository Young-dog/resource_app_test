// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_request_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskRequestDtoAdapter extends TypeAdapter<TaskRequestDto> {
  @override
  final int typeId = 1;

  @override
  TaskRequestDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskRequestDto(
      title: fields[0] as String,
      subtasks: (fields[1] as List).cast<SubtaskRequestDto>(),
      note: fields[2] as String?,
      dateFirst: fields[3] as DateTime?,
      notify: fields[4] as DateTime?,
      level: fields[6] as LevelImportance?,
      category: fields[7] as CategoryTaskRequestDto?,
      dateSecond: fields[5] as DateTime?,
      finish: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskRequestDto obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtasks)
      ..writeByte(2)
      ..write(obj.note)
      ..writeByte(3)
      ..write(obj.dateFirst)
      ..writeByte(4)
      ..write(obj.notify)
      ..writeByte(5)
      ..write(obj.dateSecond)
      ..writeByte(6)
      ..write(obj.level)
      ..writeByte(7)
      ..write(obj.category)
      ..writeByte(8)
      ..write(obj.finish);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskRequestDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskRequestDto _$TaskRequestDtoFromJson(Map<String, dynamic> json) =>
    TaskRequestDto(
      title: json['title'] as String,
      subtasks: (json['subtasks'] as List<dynamic>)
          .map((e) => SubtaskRequestDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      note: json['note'] as String?,
      dateFirst: json['dateFirst'] == null
          ? null
          : DateTime.parse(json['dateFirst'] as String),
      notify: json['notify'] == null
          ? null
          : DateTime.parse(json['notify'] as String),
      level: $enumDecodeNullable(_$LevelImportanceEnumMap, json['level']),
      category: json['category'] == null
          ? null
          : CategoryTaskRequestDto.fromJson(
              json['category'] as Map<String, dynamic>),
      dateSecond: json['dateSecond'] == null
          ? null
          : DateTime.parse(json['dateSecond'] as String),
      finish: json['finish'] as bool,
    );

Map<String, dynamic> _$TaskRequestDtoToJson(TaskRequestDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtasks': instance.subtasks,
      'note': instance.note,
      'dateFirst': instance.dateFirst?.toIso8601String(),
      'notify': instance.notify?.toIso8601String(),
      'dateSecond': instance.dateSecond?.toIso8601String(),
      'level': _$LevelImportanceEnumMap[instance.level],
      'category': instance.category,
      'finish': instance.finish,
    };

const _$LevelImportanceEnumMap = {
  LevelImportance.critical: 'critical',
  LevelImportance.important: 'important',
  LevelImportance.medium: 'medium',
  LevelImportance.low: 'low',
  LevelImportance.deferred: 'deferred',
};
