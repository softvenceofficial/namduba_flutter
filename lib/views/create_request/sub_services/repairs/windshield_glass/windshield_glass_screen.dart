import 'package:nanduba/export.dart';

class WindshieldGlassScreen extends StatefulWidget {
  const WindshieldGlassScreen({super.key});

  @override
  State<WindshieldGlassScreen> createState() => _WindshieldGlassScreenState();
}

class _WindshieldGlassScreenState extends State<WindshieldGlassScreen> {
  List<String> allWindshieldCategories = AppText.windshieldCategory;
  List<String> filteredWindshieldCategories = AppText.windshieldCategory;

  @override
  void initState() {
    super.initState();
    isBorder = List.generate(allWindshieldCategories.length, (index) => false);
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredWindshieldCategories = allWindshieldCategories;
      } else {
        filteredWindshieldCategories = allWindshieldCategories
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
                title: AppText.glassAndWindshield,
                isSearch: true,
                onSearchChanged: _onSearchChanged,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0;
                        i < filteredWindshieldCategories.length;
                        i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: ServicesBottomSheet(
                          title: filteredWindshieldCategories[i],
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
