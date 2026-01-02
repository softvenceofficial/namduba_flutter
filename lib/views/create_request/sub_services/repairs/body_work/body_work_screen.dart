import 'package:nanduba/export.dart';

class BodyWorkScreen extends StatefulWidget {
  const BodyWorkScreen({super.key});

  @override
  State<BodyWorkScreen> createState() => _BodyWorkScreenState();
}

class _BodyWorkScreenState extends State<BodyWorkScreen> {
  List<String> allBodyWorkCategories = AppText.bodyWorkCategories;
  List<String> filteredBodyWorkCategories = AppText.bodyWorkCategories;

  @override
  void initState() {
    super.initState();
    isBorder = List.generate(allBodyWorkCategories.length, (index) => false);
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredBodyWorkCategories = allBodyWorkCategories;
      } else {
        filteredBodyWorkCategories = allBodyWorkCategories
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
                title: AppText.bodyWork,
                isSearch: true,
                onSearchChanged: _onSearchChanged,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < filteredBodyWorkCategories.length; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: ServicesBottomSheet(
                          title: filteredBodyWorkCategories[i],
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
