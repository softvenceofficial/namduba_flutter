import 'package:nanduba/export.dart';

class ElectricalScreen extends StatefulWidget {
  const ElectricalScreen({super.key});

  @override
  State<ElectricalScreen> createState() => _ElectricalScreenState();
}

class _ElectricalScreenState extends State<ElectricalScreen> {
  List<String> allElectricalCategories = AppText.electricalCategory;
  List<String> filteredElectricalCategories = AppText.electricalCategory;

  @override
  void initState() {
    super.initState();
    isBorder = List.generate(allElectricalCategories.length, (index) => false);
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredElectricalCategories = allElectricalCategories;
      } else {
        filteredElectricalCategories = allElectricalCategories
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
                title: AppText.electrical,
                isSearch: true,
                onSearchChanged: _onSearchChanged,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0;
                        i < filteredElectricalCategories.length;
                        i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: ServicesBottomSheet(
                          title: filteredElectricalCategories[i],
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
