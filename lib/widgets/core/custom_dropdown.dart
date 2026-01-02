import 'package:nanduba/export.dart';

class CustomDropdown extends StatelessWidget {
  final String name;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final bool obscureText;
  final InputBorder? enableBorder;
  final String? Function(dynamic)? validator;
  final TextInputAction textInputAction;
  final Function()? onTap;
  final String? initialValue;
  final bool readOnly;
  final void Function(dynamic)? onChanged;
  final TextInputType keyboardType;
  final List<DropdownMenuItem> items;
  final bool isErrorState;
  const CustomDropdown({
    super.key,
    required this.name,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enableBorder,
    this.validator,
    this.initialValue,
    this.textInputAction = TextInputAction.done,
    this.onTap,
    this.readOnly = false,
    this.keyboardType = TextInputType.name,
    this.onChanged,
    required this.items,
    this.isErrorState = false, this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      icon: suffixIcon == null
          ? const Icon(
              Icons.keyboard_arrow_down_rounded,
            )
          : const SizedBox.shrink(),
      iconDisabledColor: AppColors.lightGrey,
      iconEnabledColor: AppColors.darkGrey,
      validator: validator,
      onTap: onTap,
      name: name,
      initialValue: initialValue,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: AppColors.black),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyMedium?.copyWith(
              letterSpacing: 0.5,
              color: AppColors.grey.withOpacity(0.7),
            ),
        fillColor: AppColors.white,
        filled: true,
        enabledBorder: AppColors.kEnableBorder,
        focusedBorder: AppColors.kFocuseBorder,
        errorBorder: AppColors.kErrorOutlineBorder,
        focusedErrorBorder: AppColors.kErrorOutlineBorder,
      ),
      onChanged: onChanged,
      items: items,
    );
  }
}
