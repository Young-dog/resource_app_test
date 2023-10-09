import '../../data/data.dart';

abstract class CategoriesRepository {
  const CategoriesRepository();

  Future<void> addStartCategories();

  Future<void> addCategory({
    required String name,
    required String color,
  });

  Future<void> delCategory({required int index});
}

class CategoriesRepositoryImpl implements CategoriesRepository {
  const CategoriesRepositoryImpl({
    required LocaleCategoryDataSource localCategoryDataSource,
  }) : _localCategoryDataSource = localCategoryDataSource;

  final LocaleCategoryDataSource _localCategoryDataSource;

  @override
  Future<void> addStartCategories() async {
    await _localCategoryDataSource.addStartCategory();
  }

  @override
  Future<void> addCategory({
    required String name,
    required String color,
  }) async {
    await _localCategoryDataSource.addCategory(
      category: CategoryTaskRequestDto(
        name: name,
        color: color,
      ),
    );
  }

  @override
  Future<void> delCategory({required int index}) async {
    await _localCategoryDataSource.delCategory(index: index);
  }
}
