import 'package:nanduba/export.dart';

class WheelsTiresScreen extends StatefulWidget {
  const WheelsTiresScreen({super.key});

  @override
  State<WheelsTiresScreen> createState() => _WheelsTiresScreenState();
}

class _WheelsTiresScreenState extends State<WheelsTiresScreen> {
  List<String> allWheelsTiresCategories = AppText.wheelsTiresCategory;
  List<String> filteredWheelsTiresCategories = AppText.wheelsTiresCategory;

  @override
  void initState() {
    super.initState();
    isBorder = List.generate(allWheelsTiresCategories.length, (index) => false);
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredWheelsTiresCategories = allWheelsTiresCategories;
      } else {
        filteredWheelsTiresCategories = allWheelsTiresCategories
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
                title: AppText.wheelsTires,
                isSearch: true,
                onSearchChanged: _onSearchChanged,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0;
                        i < filteredWheelsTiresCategories.length;
                        i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: ServicesBottomSheet(
                          title: filteredWheelsTiresCategories[i],
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
