import 'package:flutter/material.dart';
import '../../../../app/app.dart';
import '../../../../domain/domain.dart';

class LevelImportanceMenu extends StatelessWidget {
  const LevelImportanceMenu({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final LevelImportance? value;
  final void Function(LevelImportance?) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return value == null
        ? IconButton(
            onPressed: () {
              _showLevels(context);
            },
            icon: const Icon(Icons.warning_amber_rounded),
          )
        : GestureDetector(
            onTap: () {
              _showLevels(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: theme.spacings.x2,
                vertical: theme.spacings.x1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  theme.radiuses.x4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: value!.color,
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Text(
                value!.level,
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
  }

  void _showLevels(
    BuildContext context,
  ) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      backgroundColor: theme.palette.bgPrimary,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(theme.spacings.x4),
        ),
      ),
      builder: (context) {
        const levels = LevelImportance.values;

        return SafeArea(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: theme.spacings.x20 * 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (value != null)
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        onChanged.call(null);
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.delete_forever,
                        color: theme.palette.iconSecondary,
                      ),
                    ),
                  ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: levels.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return ListTile(
                      leading: Icon(
                        Icons.warning_amber_rounded,
                        color: levels[index].color,
                      ),
                      title: Text(
                        levels[index].level,
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          color: levels[index].color,
                        ),
                      ),
                      onTap: () {
                        onChanged(levels[index]);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
