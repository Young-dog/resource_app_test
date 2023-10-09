import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../app/app.dart';
import '../../../../data/data.dart';
import '../../../../generated/l10n.dart';
import '../../../presentation.dart';

class ShowCategories extends StatelessWidget {
  const ShowCategories({
    required this.onChanged,
    required this.category,
    super.key,
  });

  final void Function(CategoryTaskRequestDto)? onChanged;
  final CategoryTaskRequestDto? category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child:  ValueListenableBuilder(
          valueListenable:
              Hive.box<CategoryTaskRequestDto>(HiveBoxes.categoriesBox).listenable(),
          builder: (BuildContext context, value, _) {
            return BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                return ListView(
                  children: [
                    AddCategory(
                      name: state.name,
                      color: state.color,
                      onColorChanged: (value) {
                        context.read<CategoriesBloc>().add(
                              ChangeColorEvent(
                                color: value,
                              ),
                            );
                      },
                      onNameChanged: (value) {
                        context.read<CategoriesBloc>().add(
                              ChangeNameEvent(
                                name: value,
                              ),
                            );
                      },
                    ),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: value.values.length,
                      itemBuilder: (
                        context,
                        index,
                      ) {
                        return Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (direction) {
                            context.read<CategoriesBloc>().add(
                                  DelCategoryEvent(
                                    index: index,
                                  ),
                                );
                          },
                          background: ColoredBox(
                            color: theme.palette.buttonAccent,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.delete,
                                color: theme.palette.iconPrimary,
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                onChanged?.call(value.values.elementAt(index));
                                Navigator.of(context).pop();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: theme.spacings.x2,
                                  horizontal: theme.spacings.x4,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: theme.spacings.x2,
                                    horizontal: theme.spacings.x4,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        color: Color(
                                          int.parse(
                                            '0xFF${value.values.elementAt(index).color}',
                                          ),
                                        ),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    value.values.elementAt(index).name,
                                    style: theme.textTheme.bodySmall!.copyWith(
                                      fontSize: 14,
                                      color: Color(
                                        int.parse(
                                          '0xFF${value.values.elementAt(index).color}',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    if(category != null)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: theme.spacings.x4,),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.black.withOpacity(0.3),
                            ),
                          ),
                          onPressed: () {
                            onChanged?.call(const CategoryTaskRequestDto(name: '', color: null));
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: theme.spacings.x4,
                            ),
                            child: Text(
                              S.of(context).deleteButtonTitle,
                              style: theme.textTheme.bodySmall!.copyWith(
                                color: theme.palette.textTertiary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            );
          },
        ),
    );
  }
}
