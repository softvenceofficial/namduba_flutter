import 'package:nanduba/export.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  List<String> allFinanceTypes = AppText.financeTypes;
  List<String> filteredFinanceTypes = AppText.financeTypes;

  @override
  void initState() {
    super.initState();
    isBorder = List.generate(allFinanceTypes.length, (index) => false);
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredFinanceTypes = allFinanceTypes;
      } else {
        filteredFinanceTypes = allFinanceTypes
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
                title: AppText.finance,
                isSearch: true,
                onSearchChanged: _onSearchChanged,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < filteredFinanceTypes.length; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: FinanceBottomsheet(
                          title: filteredFinanceTypes[i],
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
