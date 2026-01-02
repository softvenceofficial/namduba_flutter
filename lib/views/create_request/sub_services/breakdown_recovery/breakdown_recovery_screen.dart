import 'package:nanduba/export.dart';

class BreakdownRecoveryScreen extends StatefulWidget {
  const BreakdownRecoveryScreen({super.key});

  @override
  State<BreakdownRecoveryScreen> createState() =>
      _BreakdownRecoveryScreenState();
}

class _BreakdownRecoveryScreenState extends State<BreakdownRecoveryScreen> {
  List<String> allRecoveryTypes = AppText.breakdownRecoveryTypes;
  List<String> filteredRecoveryTypes = AppText.breakdownRecoveryTypes;

  @override
  void initState() {
    super.initState();

    isBorder =
        List.generate(AppText.breakdownRecoveryTypes.length, (index) => false);
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredRecoveryTypes = allRecoveryTypes;
      } else {
        filteredRecoveryTypes = allRecoveryTypes
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
                title: AppText.breakdownRecovery,
                isSearch: true,
                onSearchChanged: _onSearchChanged,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < filteredRecoveryTypes.length; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: BreakdownBottomsheet(
                          title: filteredRecoveryTypes[i],
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
