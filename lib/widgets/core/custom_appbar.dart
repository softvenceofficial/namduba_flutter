import 'package:flutter_svg/flutter_svg.dart';
import 'package:nanduba/constants/colors.dart';
import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/add_vehicle/purchase_history/purchase_history.dart';
import 'package:nanduba/widgets/core/my_text.dart';

class CustomAppbar extends StatefulWidget {
  final String title;
  final bool isPop;
  final bool isSearch;
  final bool isRequestAdd;
  final ValueChanged<String>? onSearchChanged;
  final String? toggleIcon;
  final bool showCart;
  final VoidCallback? onTogglePressed; // Add this property
  final VoidCallback? onAddButtonTap; // Add this property

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
                          child: Text(widget.title,
                              key: const ValueKey<int>(0),
                              style: Textfontstyle.TextStyle18w700c212121poppins
                                  .copyWith(
                                fontSize: 14.sp,
                              )),
                        ),
                ),
              ),
              2.width,
              if (widget.isSearch)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSearching = !_isSearching;
                    });
                  },
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
              if (widget.toggleIcon != null)
                GestureDetector(
                  onTap: widget
                      .onTogglePressed, // Call the onTogglePressed callback
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
              // if (widget.showCart)
              //   GestureDetector(
              //     onTap: () {
              //       AppCustomNavigator.push(context, PurchaseHistory());
              //     },
              //     child: Badge(
              //       position: BadgePosition.topEnd(top: 0.h, end: 0.h),
              //       showBadge: true,
              //       badgeStyle: const BadgeStyle(
              //           borderSide: BorderSide(color: AppColors.white)),
              //       child: SvgPicture.asset(
              //         AppSvgs.cart,
              //         height: 3.5.h,
              //       ),
              //     ),
              //   ),
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
