// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtask_request_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubtaskRequestDtoAdapter extends TypeAdapter<SubtaskRequestDto> {
  @override
  final int typeId = 2;

  @override
  SubtaskRequestDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubtaskRequestDto(
      title: fields[0] as String,
      finish: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SubtaskRequestDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.finish);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubtaskRequestDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubtaskRequestDto _$SubtaskRequestDtoFromJson(Map<String, dynamic> json) =>
    SubtaskRequestDto(
      title: json['title'] as String,
      finish: json['finish'] as bool,
    );

Map<String, dynamic> _$SubtaskRequestDtoToJson(SubtaskRequestDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'finish': instance.finish,
    };
