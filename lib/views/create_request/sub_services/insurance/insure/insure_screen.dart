import 'package:nanduba/export.dart';

class InsureScreen extends StatefulWidget {
  const InsureScreen(
      {super.key,
      this.sheet = false,
      this.showForIndex = -1,
      this.showForTitle = ''});
  final bool sheet;
  final int showForIndex;
  final String showForTitle;
  @override
  State<InsureScreen> createState() => _InsureScreenState();
}

class _InsureScreenState extends State<InsureScreen> {
  List<String> allInsureTypes = AppText.insureTypes;
  List<String> filteredInsureTypes = AppText.insureTypes;

  @override
  void initState() {
    super.initState();
    isBorder = List.generate(allInsureTypes.length, (index) => false);
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredInsureTypes = allInsureTypes;
      } else {
        filteredInsureTypes = allInsureTypes
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
                title: AppText.insure,
                isSearch: true,
                onSearchChanged: _onSearchChanged,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < filteredInsureTypes.length; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: BuyInsuranceBottomSheet(
                          title: filteredInsureTypes[i],
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
