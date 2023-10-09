part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object?> get props => [];
}

class ChangeColorEvent extends CategoriesEvent {
  const ChangeColorEvent({
    required this.color,
  });

  final String color;

  @override
  List<Object?> get props => [
        color,
      ];
}

class ChangeNameEvent extends CategoriesEvent {
  const ChangeNameEvent({
    required this.name,
  });

  final String name;

  @override
  List<Object?> get props => [
        name,
      ];
}

class AddCategoryEvent extends CategoriesEvent {
  const AddCategoryEvent();
}


class DelCategoryEvent extends CategoriesEvent {
  const DelCategoryEvent({required this.index});

  final int index;

  @override
  List<Object?> get props => [
        index,
      ];
}
