import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../app/app.dart';
import '../../../../data/data.dart';
import '../../../presentation.dart';

class CategoriesMenu extends StatelessWidget {
  const CategoriesMenu({
    this.onChanged,
    this.value,
    this.onTap = true,
    super.key,
  });

  final void Function(CategoryTaskRequestDto)? onChanged;
  final bool onTap;
  final CategoryTaskRequestDto? value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return value == null
        ? IconButton(
            onPressed: () {
              _showCategories(context);
            },
            icon: const Icon(Icons.tag),
          )
        : GestureDetector(
            onTap: () {
              if (onTap) {
                _showCategories(context);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: theme.spacings.x1,
                horizontal: theme.spacings.x2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(theme.radiuses.x4),
                color: Color(
                  int.parse('0xFF${value!.color}'),
                ).withOpacity(0.5),
              ),
              child: Text(
                value!.name,
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: theme.spacings.x3,
                  fontWeight: FontWeight.w700,
                  color: Color(
                    int.parse('0xFF${value!.color}'),
                  ),
                ),
              ),
            ),
          );
  }

  Future<void> _showCategories(
    BuildContext context,
  ) async {
    final theme = Theme.of(context);

    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: theme.palette.bgPrimary,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(theme.spacings.x4),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(

            constraints: BoxConstraints(
              maxHeight: theme.spacings.x20 * 4,
            ),
            child: BlocProvider(
              create: (context) =>
                  CategoriesBloc(categoriesRepository: GetIt.instance()),
              child: ShowCategories(
                onChanged: onChanged, category: value,
              ),
            ),
          ),
        );
      },
    );
  }
}
