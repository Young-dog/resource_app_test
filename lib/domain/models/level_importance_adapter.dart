import 'package:hive_flutter/hive_flutter.dart';

import '../domain.dart';

class LevelImportanceAdapter extends TypeAdapter<LevelImportance> {
  @override
  final typeId = 4;

  @override
  LevelImportance read(BinaryReader reader) {
    final index = reader.readInt();
    return LevelImportance.values[index];
  }

  @override
  void write(BinaryWriter writer, LevelImportance obj) {
    writer.writeInt(obj.index);
  }
}
