import 'package:nanduba/export.dart';

class RepairScreen extends StatefulWidget {
  const RepairScreen({super.key});

  @override
  State<RepairScreen> createState() => _RepairScreenState();
}

class _RepairScreenState extends State<RepairScreen> {
  String _searchText = '';
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleTextChange(String? value) {
    setState(() {
      _searchText = value!;
    });
  }

  void _handleEditingComplete() {
    FocusScope.of(context).unfocus(); // Close keyboard on "Done"
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Close keyboard on tap outside
        },
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: const CustomAppbar(
                  title: AppText.repairs,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          focusNode: _focusNode,
                          name: 'search',
                          enableBorder: AppColors.kEnableBorderGrey,
                          prefixIcon: SvgPicture.asset(
                            AppSvgs.searchIcon,
                            fit: BoxFit.scaleDown,
                          ),
                          hintText: AppText.search,
                          showShadow: true,
                          onChanged: _handleTextChange,
                          onEditComplete: _handleEditingComplete,
                          isList: false, // No list is required here
                        ),
                        2.height,
                        Text(AppText.browseCategory,
                            style: Theme.of(context).textTheme.headlineMedium),
                        1.height,
                        Text(AppText.whatKindRepair,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: AppColors.grey, fontSize: 10.sp)),
                        1.height,
                        // Displaying repair categories based on search text
                        ...AppText.repairCategory
                            .where((category) => category
                                .toLowerCase()
                                .contains(_searchText.toLowerCase()))
                            .map((category) {
                          final int index =
                              AppText.repairCategory.indexOf(category);
                          return CustomTile(
                            prefixSvgImage: AppSvgs.repairCategory[index],
                            title: category,
                            isButton: false,
                            onTap: () =>
                                Navigators.repairNavigator[index](context),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
