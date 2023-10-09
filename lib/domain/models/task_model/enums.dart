import 'dart:ui';

enum LevelImportance {
  critical(
    'Критичная',
    Color(0xFF9d0208),
  ),
  important(
    'Важная',
    Color(0xFFe85d04),
  ),
  medium(
    'Средняя',
    Color(0xFFffba08),
  ),
  low(
    'Низкая',
    Color(0xFF55a630),
  ),
  deferred(
    'Отложенная',
    Color(0xFFcaf0f8),
  );

  const LevelImportance(this.level, this.color);

  final String level;
  final Color color;
}

enum DaysOfWeek {
  monday('Пн', DateTime.monday),
  tuesday('Вт', DateTime.tuesday),
  wednesday('Ср', DateTime.wednesday),
  thursday('Чт', DateTime.thursday),
  friday('Пт', DateTime.friday),
  saturday('Сб', DateTime.saturday),
  sunday('Вс', DateTime.sunday);

  const DaysOfWeek(this.name, this.day);

  final String name;
  final int day;

}
