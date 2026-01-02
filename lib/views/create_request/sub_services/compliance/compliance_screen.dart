import 'package:nanduba/export.dart';

class ComplianceScreen extends StatefulWidget {
  const ComplianceScreen(
      {super.key,
      this.sheet = false,
      this.showForIndex = -1,
      this.showForTitle = ''});
  final bool sheet;
  final int showForIndex;
  final String showForTitle;
  @override
  State<ComplianceScreen> createState() => _ComplianceScreenState();
}

class _ComplianceScreenState extends State<ComplianceScreen> {
  List<String> allServices = AppText.complianceServices;
  List<String> filteredServices = AppText.complianceServices;

  @override
  void initState() {
    super.initState();
    isBorder =
        List.generate(AppText.complianceServices.length, (index) => false);
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredServices = allServices;
      } else {
        filteredServices = allServices
            .where((service) =>
                service.toLowerCase().contains(query.toLowerCase()))
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
                title: AppText.roadCompliance,
                isSearch: true,
                onSearchChanged: _onSearchChanged,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < filteredServices.length; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: ServicesBottomSheet(
                          title: filteredServices[i],
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
