// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_task_request_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryTaskRequestDtoAdapter
    extends TypeAdapter<CategoryTaskRequestDto> {
  @override
  final int typeId = 0;

  @override
  CategoryTaskRequestDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryTaskRequestDto(
      name: fields[0] as String,
      color: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryTaskRequestDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryTaskRequestDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryTaskRequestDto _$CategoryTaskRequestDtoFromJson(
        Map<String, dynamic> json) =>
    CategoryTaskRequestDto(
      name: json['name'] as String,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$CategoryTaskRequestDtoToJson(
        CategoryTaskRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
    };
