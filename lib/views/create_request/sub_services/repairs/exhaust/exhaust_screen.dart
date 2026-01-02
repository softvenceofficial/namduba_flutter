import 'package:nanduba/export.dart';

class ExhaustScreen extends StatefulWidget {
  const ExhaustScreen({super.key});

  @override
  State<ExhaustScreen> createState() => _ExhaustScreenState();
}

class _ExhaustScreenState extends State<ExhaustScreen> {
  List<String> allExhaustCategories = AppText.exhaustCategory;
  List<String> filteredExhaustCategories = AppText.exhaustCategory;

  @override
  void initState() {
    super.initState();
    isBorder = List.generate(allExhaustCategories.length, (index) => false);
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredExhaustCategories = allExhaustCategories;
      } else {
        filteredExhaustCategories = allExhaustCategories
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
                title: AppText.exhaust,
                isSearch: true,
                onSearchChanged: _onSearchChanged,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < filteredExhaustCategories.length; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: ServicesBottomSheet(
                          title: filteredExhaustCategories[i],
                          index: i,
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
