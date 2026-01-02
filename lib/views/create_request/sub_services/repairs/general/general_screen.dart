import 'package:nanduba/export.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen(
      {super.key,
      this.sheet = false,
      this.showForIndex = -1,
      this.showForTitle = ''});
  final bool sheet;
  final int showForIndex;
  final String showForTitle;
  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  List<String> allGeneralCategories = AppText.generalCategory;
  List<String> filteredGeneralCategories = AppText.generalCategory;

  @override
  void initState() {
    super.initState();
    isBorder = List.generate(allGeneralCategories.length, (index) => false);
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredGeneralCategories = allGeneralCategories;
      } else {
        filteredGeneralCategories = allGeneralCategories
            .where((category) =>
                category.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: CustomAppbar(
                title: AppText.general,
                isSearch: true,
                onSearchChanged: _onSearchChanged,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < filteredGeneralCategories.length; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: ServicesBottomSheet(
                          title: filteredGeneralCategories[i],
                          index: i,
                          shouldShowBottomSheet: widget.sheet,
                          showForIndex: widget.showForIndex,
                          showForTitle: widget.showForTitle,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
