import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final String hintText;
  final String? titleText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final InputBorder? enableBorder;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final Function()? onTap;
  final List<Function()?>? onListItemTap;
  final String? initialValue;
  final bool readOnly;
  final Color? fillColor;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String?)? onChanged;
  final VoidCallback? onEditComplete;
  final int maxLines;
  final int? minLines;
  final TextInputType keyboardType;
  final bool showShadow;
  final bool isList;
  final List<String>? svgList;
  final List<String>? titleList;

  const CustomTextField({
    super.key,
    required this.name,
    required this.hintText,
    this.onEditComplete,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.style,
    this.enableBorder,
    this.validator,
    this.initialValue,
    this.textInputAction = TextInputAction.done,
    this.onTap,
    this.fillColor,
    this.readOnly = false,
    this.keyboardType = TextInputType.name,
    this.maxLines = 1,
    this.minLines,
    this.titleText,
    this.showShadow = false,
    this.isList = false,
    this.svgList,
    this.titleList,
    this.onListItemTap,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText != null
            ? Text(
                titleText!,
                style: Textfontstyle.TextStyle14w400greypoppins,
              )
            : const SizedBox.shrink(),
        titleText != null ? 0.5.height : const SizedBox.shrink(),
        Container(
          decoration: BoxDecoration(
            color: isList ? AppColors.white : null,
            border: isList ? Border.all(color: AppColors.cGrey) : null,
            borderRadius: isList ? BorderRadius.circular(14.sp) : null,
            boxShadow: showShadow
                ? [
                    const BoxShadow(
                      color: AppColors.shadow,
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ]
                : [],
          ),
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilderTextField(
                textInputAction: textInputAction,
                validator: validator,
                controller: controller,
                focusNode: focusNode,
                onEditingComplete: onEditComplete ?? () {},
                onChanged: onChanged,
                onTap: onTap,
                name: name,
                readOnly: readOnly,
                initialValue: initialValue,
                style: style ??
                    Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.grey),
                cursorColor: AppColors.grey,
                obscureText: obscureText,
                keyboardType: keyboardType,
                maxLines: maxLines,
                minLines: minLines,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15.0),
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  hintStyle: hintStyle ??
                      Theme.of(context).textTheme.bodyMedium?.copyWith(
                          letterSpacing: 1,
                          color: AppColors.grey.withOpacity(0.7)),
                  fillColor: fillColor ?? AppColors.white,
                  filled: true,
                  enabled: true,
                  enabledBorder: !isList
                      ? enableBorder ?? AppColors.kEnableBorder
                      : UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.lightGrey),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.sp),
                              topRight: Radius.circular(12.sp))),
                  focusedBorder: !isList
                      ? AppColors.kFocuseBorder
                      : UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.lightGrey),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.sp),
                              topRight: Radius.circular(12.sp))),
                  errorBorder: !isList ? AppColors.kErrorOutlineBorder : null,
                  focusedErrorBorder:
                      !isList ? AppColors.kErrorOutlineBorder : null,
                ),
              ),
              isList
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppText.popularServices,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          2.height,
                          for (int i = 0; i < titleList!.length; i++) ...{
                            i != 0 ? 1.height : 0.height,
                            GestureDetector(
                              onTap: () {
                                if (onListItemTap![i] != null) {
                                  onListItemTap![i]!();
                                }
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(svgList![i]),
                                      2.width,
                                      Text(
                                        titleList![i],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(AppSvgs.arrowCircleRight),
                                ],
                              ),
                            ),
                            1.height,
                            i != titleList!.length - 1
                                ? const Divider(
                                    color: AppColors.lightGrey,
                                  )
                                : const SizedBox.shrink(),
                          }
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
