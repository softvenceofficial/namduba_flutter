import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nanduba/constants/colors.dart';
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/widgets/core/my_text.dart';

class CustomAppbar extends StatefulWidget {
  final String title;
  final bool isPop;
  final bool isSearch;
  final bool isRequestAdd;
  final ValueChanged<String>? onSearchChanged;
  final String? toggleIcon;
  final bool showCart;
  final VoidCallback? onTogglePressed;
  final VoidCallback? onAddButtonTap;
  final String? svgIconNextToTitle;
  final int? badgeNumber;
  final Color? svgIconColor;
  final VoidCallback? onSvgIconTap;
  final bool? isborder;
  final bool centerTitle;
  final bool? padding;

  const CustomAppbar({
    super.key,
    required this.title,
    this.isPop = true,
    this.isSearch = false,
    this.onSearchChanged,
    this.isRequestAdd = false,
    this.toggleIcon,
    this.showCart = false,
    this.onTogglePressed,
    this.onAddButtonTap,
    this.svgIconNextToTitle,
    this.badgeNumber,
    this.svgIconColor,
    this.onSvgIconTap,
    this.isborder = false,
    this.centerTitle = false,
    this.padding = true,
  });

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button
              if (widget.isPop)
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 5.h,
                    width: 5.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGrey),
                      borderRadius: BorderRadius.circular(15.w),
                    ),
                    child: const Center(
                      child: Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),
                ),
              3.width,

              // Title or Search
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _isSearching
                      ? CustomTextField(
                          controller: _searchController,
                          onChanged: (String? value) {
                            if (value != null && value.isNotEmpty) {
                              widget.onSearchChanged?.call(value);
                            }
                          },
                          onEditComplete: () {
                            setState(() => _isSearching = false);
                          },
                          key: const ValueKey<int>(1),
                          name: 'search',
                          hintText: AppText.search,
                        )
                      : Align(
                          alignment: widget.centerTitle
                              ? Alignment.center
                              : Alignment.centerLeft,
                          child: Text(
                            widget.title,
                            key: const ValueKey<int>(0),
                            textAlign: widget.centerTitle
                                ? TextAlign.center
                                : TextAlign.left,
                            style: Textfontstyle.TextStyle18w700c212121poppins
                                .copyWith(fontSize: 14.sp),
                          ),
                        ),
                ),
              ),
              2.width,

              // Search icon
              if (widget.isSearch)
                GestureDetector(
                  onTap: () => setState(() => _isSearching = !_isSearching),
                  child: Container(
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: SvgPicture.asset(
                      AppSvgs.searchIcon,
                      height: 2.5.h,
                    ),
                  ),
                ),

              // Add button
              if (widget.isRequestAdd)
                GestureDetector(
                  onTap: widget.onAddButtonTap,
                  child: Container(
                    height: 6.h,
                    width: 6.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(15.w),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              // Toggle icon
              if (widget.toggleIcon != null)
                GestureDetector(
                  onTap: widget.onTogglePressed,
                  child: Container(
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Image.asset(
                      widget.toggleIcon!,
                      height: 3.5.h,
                    ),
                  ),
                ),

              // SVG icon at the end with optional badge
              if (widget.svgIconNextToTitle != null) ...[
                8.width,
                InkWell(
                  onTap: widget.onSvgIconTap, // Only executes if provided
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 5.h,
                        width: 5.h,
                        padding: (widget.padding ?? true)
                            ? EdgeInsets.all(10)
                            : null,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: (widget.isborder ?? false)
                              ? Border.all(color: AppColors.cBEBEBE)
                              : null,
                        ),
                        child: SvgPicture.asset(
                          widget.svgIconNextToTitle!,
                          height: 3.h,
                          color: (widget.padding ?? true)
                              ? widget.svgIconColor ?? AppColors.primary
                              : null,
                        ),
                      ),
                      if (widget.badgeNumber != null && widget.badgeNumber! > 0)
                        Positioned(
                          right: 1.w,
                          top: -.5.w,
                          child: Container(
                            padding: EdgeInsets.all(1.w),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: MyText(
                              text: widget.badgeNumber.toString(),
                              fontSize: 8.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class myAppBar extends StatefulWidget {
  final String title;
  final String? columnText;
  final String? icon;
  final Color? iconColor;
  final Color? columnTextColor;
  final bool isPop;
  final bool isSearch;
  final bool? noCon;
  final bool? textColumn;
  final bool isToggle; // Property for toggling the icon
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onTogglePressed;

  const myAppBar({
    super.key,
    required this.title,
    this.isPop = true,
    this.noCon = false,
    this.iconColor,
    this.isSearch = false,
    this.isToggle = false, // Initialize the property
    this.onSearchChanged,
    this.icon,
    this.textColumn,
    this.columnText,
    this.onTogglePressed,
    this.columnTextColor,
  });

  @override
  State<myAppBar> createState() => _myAppBarState();
}

class _myAppBarState extends State<myAppBar> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.isPop)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 6.h,
                    width: 6.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGrey),
                      borderRadius: BorderRadius.circular(15.w),
                    ),
                    child: const Center(
                      child: Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),
                ),
              3.width,
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _isSearching
                      ? CustomTextField(
                          controller: _searchController,
                          onChanged: (String? value) {
                            if (value != null && value.isNotEmpty) {
                              widget.onSearchChanged?.call(value);
                            }
                          },
                          onEditComplete: () {
                            setState(() {
                              _isSearching = false;
                            });
                          },
                          key: const ValueKey<int>(1),
                          name: 'search',
                          hintText: AppText.search,
                        )
                      : Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                key: const ValueKey<int>(0),
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              if (widget.textColumn == true)
                                MyText(
                                  text: widget.columnText ?? "",
                                  fontSize: 12.sp,
                                  color: widget.columnTextColor ??
                                      AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                )
                            ],
                          ),
                        ),
                ),
              ),
              2.width,
              if (widget.noCon == true && widget.icon != null)
                SvgPicture.asset(
                  widget.icon ?? AppSvgs.danger,
                  color: widget.iconColor ?? AppColors.primary,
                  height: 2.3.h,
                ),
              if (widget.noCon == false && widget.icon != null)
                GestureDetector(
                  onTap: widget.onTogglePressed ??
                      () {
                        setState(() {
                          _isSearching = !_isSearching;
                        });
                      },
                  child: Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.lightGrey),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: SvgPicture.asset(
                        widget.icon ?? AppSvgs.danger,
                        color: widget.iconColor ?? AppColors.primary,
                        height: 2.3.h,
                      )),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
