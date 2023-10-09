import 'package:hive/hive.dart';

class DurationAdapter extends TypeAdapter<Duration> {
  @override
  Duration read(BinaryReader reader) {
    final hour = reader.readInt();
    final minute = reader.readInt();
    return Duration(hours: hour, minutes: minute);
  }

  @override
  int get typeId => 5;

  @override
  void write(BinaryWriter writer, Duration obj) {
    writer
      ..writeInt(obj.inHours)
      ..writeInt(obj.inMinutes.remainder(60));
  }
}
