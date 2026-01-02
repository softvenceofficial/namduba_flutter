import 'package:nanduba/export.dart';

class InsuranceScreeen extends StatefulWidget {
  const InsuranceScreeen({super.key});

  @override
  State<InsuranceScreeen> createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreeen> {
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
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppbar(
                    title: AppText.insurance,
                  ),
                  2.height,
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
                  ),
                  2.height,
                  Text(AppText.browseCategory,
                      style: Theme.of(context).textTheme.headlineMedium),
                  1.height,
                  Text(AppText.whatKindInsurance,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.grey, fontSize: 10.sp)),
                  1.height,
                  ...AppText.insuranceCategory
                      .where((category) => category
                          .toLowerCase()
                          .contains(_searchText.toLowerCase()))
                      .map((category) {
                    final int index =
                        AppText.insuranceCategory.indexOf(category);
                    return CustomTile(
                      prefixSvgImage: AppSvgs.insuranceCategory[index],
                      title: category,
                      isButton: false,
                      onTap: () =>
                          Navigators.insuranceNavigator[index](context),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
