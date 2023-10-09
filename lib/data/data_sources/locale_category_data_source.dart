
import 'package:hive_flutter/hive_flutter.dart';

import '../../app/app.dart';
import '../data.dart';

abstract class LocaleCategoryDataSource {
  const LocaleCategoryDataSource();

  Future<void> addStartCategory();

  Future<void> addCategory({required CategoryTaskRequestDto category});

  Future<void> delCategory({required int index});
}

class LocaleCategoryDataSourceImpl implements LocaleCategoryDataSource {
  const LocaleCategoryDataSourceImpl._internal({
    required Box<CategoryTaskRequestDto> categoryBox,
  }) : _categoryBox = categoryBox;

  static Future<LocaleCategoryDataSourceImpl> create({
    required HiveInterface hive,
  }) async {
    final categoryBox = await hive.openBox<CategoryTaskRequestDto>(
      HiveBoxes.categoriesBox,
    );

    final hiveLocaleDataSource = LocaleCategoryDataSourceImpl._internal(
      categoryBox: categoryBox,
    );

    return hiveLocaleDataSource;
  }

  final Box<CategoryTaskRequestDto> _categoryBox;

  @override
  Future<void> addStartCategory() async {

    final categories = [
      const CategoryTaskRequestDto(name: 'Дом', color: '008000'),
      const CategoryTaskRequestDto(name: 'Работа', color: 'D00000'),
      const CategoryTaskRequestDto(name: 'Учеба', color: 'FFD60A'),
    ];
    await _categoryBox.addAll(categories);
  }

  @override
  Future<void> addCategory({required CategoryTaskRequestDto category}) async {
    await _categoryBox.add(category);
  }

  @override
  Future<void> delCategory({required int index}) async {
    await _categoryBox.deleteAt(index);
  }
}
