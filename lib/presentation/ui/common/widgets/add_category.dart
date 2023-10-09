import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../../app/app.dart';
import '../../../presentation.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({
    required this.name,
    required this.color,
    required this.onColorChanged,
    required this.onNameChanged,
    super.key,
  });

  final String? color;
  final String? name;
  final void Function(String) onColorChanged;
  final void Function(String) onNameChanged;

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  
  late TextEditingController _controller;
  
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: theme.spacings.x2,
        horizontal: theme.spacings.x3,
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              child: AddCategoryInput(
                showColor: _showColor,
                color: widget.color,
                onChanged: widget.onNameChanged,
                controller: _controller,
              ),
            ),
          ),
          SizedBox(
            width: theme.spacings.x6,
          ),
          IconButton(
            onPressed: () {
              context.read<CategoriesBloc>().add(const AddCategoryEvent());
              _controller.clear();
              FocusScope.of(context).unfocus();
            },
            icon: Icon(
              Icons.add_circle_outline,
              size: theme.spacings.x8,
              color: theme.palette.borderPrimary,
            ),
          ),
        ],
      ),
    );
  }

  void _showColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: Color(int.parse('0xFF${widget.color ?? '38b000'}')),
              onColorChanged: (Color value) {
                widget.onColorChanged(value.value.toRadixString(16).substring(2));
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }
}
