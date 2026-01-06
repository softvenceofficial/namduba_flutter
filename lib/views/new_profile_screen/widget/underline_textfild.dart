import 'dart:ui';

import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/widgets/core/underline_textfild.dart';

class EditableField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool initiallyEditable;
  final TextEditingController? controller;
  final String? edittext;

  final VoidCallback? onEditTap;

  const EditableField({
    super.key,
    required this.label,
    required this.hintText,
    this.initiallyEditable = false,
    this.edittext,
    this.controller,
    this.onEditTap,
  });

  @override
  State<EditableField> createState() => _EditableFieldState();
}

class _EditableFieldState extends State<EditableField> {
  late bool _isEditing;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.initiallyEditable;
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                fontSize: 12.sp,
                color: AppColors.textColor,
              ),
            ),
            InkWell(
              onTap: widget.onEditTap ?? _toggleEdit,
              child: Text(
                _isEditing ? "Done" : (widget.edittext ?? "Edit"),
                style: Textfontstyle.TextStyle14w500c212121poppins.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.textColor,
                  fontSize: 12.sp,
                  color: AppColors.textColor,
                ),
              ),
            ),
          ],
        ),
        UnderlineTextField(
          hintText: widget.hintText,
          controller: _controller,
          enabled: _isEditing,
        ),
      ],
    );
  }
}
