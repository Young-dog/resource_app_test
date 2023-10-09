part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  const CategoriesState({
    required this.name,
    required this.color,
  });

  const CategoriesState.initial()
      : name = null,
        color = '38b000';

  final String? name;
  final String color;

  CategoriesState copyWith({
    String? name,
    String? color,
  }) {
    return CategoriesState(
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  List<Object?> get props => [
        name,
        color,
      ];
}
