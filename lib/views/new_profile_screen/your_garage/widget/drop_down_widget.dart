import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class CustomPrefixDropdown<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final ValueChanged<T?> onChanged;

  final Widget Function(T item) itemBuilder;

  final Widget? prefix;

  final double height;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Color borderColor;
  final Widget? icon;
  final Color? dropdownColor;

  const CustomPrefixDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.itemBuilder,
    this.prefix,
    this.height = 50,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.borderColor = AppColors.cBEBEBE,
    this.icon,
    this.dropdownColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1),
        borderRadius: borderRadius,
      ),
      child: Row(
        children: [
          if (prefix != null) ...[
            prefix!,
            const SizedBox(width: 4),
          ],
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                style: Textfontstyle.TextStyle14w400c212121poppins.copyWith(
                  fontSize: 10.sp,
                  color: AppColors.textColor,
                ),
                value: value,
                isExpanded: true,
                icon: icon ??
                    SvgPicture.asset(
                      AppSvgs.arrowdown,
                      color: AppColors.darkGrey,
                    ),
                dropdownColor: dropdownColor ?? AppColors.white,
                borderRadius: borderRadius,
                onChanged: onChanged,
                items: items
                    .map(
                      (item) => DropdownMenuItem<T>(
                        value: item,
                        child: itemBuilder(
                          item,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
