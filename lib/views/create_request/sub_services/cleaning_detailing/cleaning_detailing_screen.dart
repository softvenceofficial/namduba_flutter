import 'package:nanduba/export.dart';

class CleaningDetailingScreen extends StatefulWidget {
  const CleaningDetailingScreen({super.key});

  @override
  State<CleaningDetailingScreen> createState() =>
      _CleaningDetailingScreenState();
}

class _CleaningDetailingScreenState extends State<CleaningDetailingScreen> {
  List<String> allDetailingTypes = AppText.cleaningDetailingTypes;
  List<String> filteredDetailingTypes = AppText.cleaningDetailingTypes;

  @override
  void initState() {
    super.initState();
    isBorder = List.generate(allDetailingTypes.length, (index) => false);
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredDetailingTypes = allDetailingTypes;
      } else {
        filteredDetailingTypes = allDetailingTypes
            .where((type) => type.toLowerCase().contains(query.toLowerCase()))
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
                title: AppText.cleaningDetailing,
                isSearch: true,
                onSearchChanged: _onSearchChanged,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < filteredDetailingTypes.length; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: ServicesBottomSheet(
                          title: filteredDetailingTypes[i],
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
