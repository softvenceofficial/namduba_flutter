import 'package:nanduba/export.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  String _text = '';
  bool _isList = false;
  final FocusNode _focusNode = FocusNode();

  final List<Map<String, dynamic>> _tiles = [
    {
      'prefixSvgImage': AppSvgs.roadCompliance,
      'title': AppText.roadCompliance,
      'svgBackColor': AppColors.lightPurple,
      'onTap': (BuildContext context) {
        AppCustomNavigator.push(context, const ComplianceScreen());
      },
    },
    {
      'prefixSvgImage': AppSvgs.insurance,
      'title': AppText.insurance,
      'svgBackColor': AppColors.lightBlue,
      'svgColor': AppColors.blue,
      'onTap': (BuildContext context) {
        AppCustomNavigator.push(context, const InsuranceScreeen());
      },
    },
    {
      'prefixSvgImage': AppSvgs.repair,
      'title': AppText.repairs,
      'svgBackColor': AppColors.lightOrange,
      'svgColor': AppColors.orange,
      'onTap': (BuildContext context) {
        AppCustomNavigator.push(context, const RepairScreen());
      },
    },
    {
      'prefixSvgImage': AppSvgs.breakdown,
      'title': AppText.roadsideAssistance,
      'onTap': (BuildContext context) {
        AppCustomNavigator.push(context, const BreakdownRecoveryScreen());
      },
    },
    {
      'prefixSvgImage': AppSvgs.finance,
      'title': AppText.finance,
      'svgBackColor': AppColors.lightSkyBlue,
      'onTap': (BuildContext context) {
        AppCustomNavigator.push(context, const FinanceScreen());
      },
    },
    {
      'prefixSvgImage': AppSvgs.cleaningDetailing,
      'title': AppText.cleaningDetailing,
      'svgBackColor': AppColors.lightGreen,
      'onTap': (BuildContext context) {
        AppCustomNavigator.push(context, const CleaningDetailingScreen());
      },
    },
  ];

  List<Map<String, dynamic>> get _filteredTiles {
    if (_text.isEmpty) return _tiles;
    return _tiles
        .where((tile) => tile['title']
            .toString()
            .toLowerCase()
            .contains(_text.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _isList = _text.isEmpty;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleTextChange(String? value) {
    setState(() {
      _text = value!;
      _isList = _focusNode.hasFocus;
    });
  }

  void _handleEditingComplete() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isList = !_focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          _isList = !_focusNode.hasFocus;
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                children: [
                  2.height,
                  const CustomAppbar(
                    title: AppText.chooseServices,
                    isPop: false,
                  ),
                  3.height,
                  CustomTextField(
                    focusNode: _focusNode,
                    name: 'searchServices',
                    prefixIcon: SvgPicture.asset(
                      AppSvgs.searchIcon,
                      fit: BoxFit.scaleDown,
                    ),
                    onChanged: _handleTextChange,
                    onEditComplete: _handleEditingComplete,
                    hintText: AppText.searchServices,
                    showShadow: true,
                    isList: _isList,
                    onListItemTap: [
                      () => AppCustomNavigator.push(
                          context, const GeneralScreen()),
                      () => AppCustomNavigator.push(
                          context, const ComplianceScreen()),
                      () => AppCustomNavigator.push(
                          context, const InsureScreen()),
                    ],
                    svgList: const [
                      AppSvgs.tuneUp,
                      AppSvgs.changeOwnership,
                      AppSvgs.comprehensiveInsurance
                    ],
                    titleList: const [
                      AppText.tuneUp,
                      AppText.changeOwnership,
                      AppText.comprehensiveInsurance
                    ],
                  ),
                  2.height,
                  const CustomAppbar(
                    title: AppText.browseCategory,
                    isPop: false,
                  ),
                  1.height,
                  ..._filteredTiles.map((tile) => CustomTile(
                        prefixSvgImage: tile['prefixSvgImage'],
                        title: tile['title'],
                        svgColor: tile['svgColor'],
                        svgBackColor: tile['svgBackColor'],
                        isButton: false,
                        outBorderRadius: 20.sp,
                        onTap: () {
                          tile['onTap'](context);
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
