import 'package:nanduba/export.dart';

class AirconScreen extends StatefulWidget {
  const AirconScreen({super.key});

  @override
  State<AirconScreen> createState() => _AirconScreenState();
}

class _AirconScreenState extends State<AirconScreen> {
  List<String> allAirconCategories = AppText.airconCategory;
  List<String> filteredAirconCategories = AppText.airconCategory;

  @override
  void initState() {
    super.initState();
    isBorder = List.generate(allAirconCategories.length, (index) => false);
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredAirconCategories = allAirconCategories;
      } else {
        filteredAirconCategories = allAirconCategories
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
                title: AppText.aircon,
                isSearch: true,
                onSearchChanged: _onSearchChanged,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < filteredAirconCategories.length; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: ServicesBottomSheet(
                          title: filteredAirconCategories[i],
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
