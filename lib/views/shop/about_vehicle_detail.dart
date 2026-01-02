import 'package:nanduba/export.dart';

class AboutVehicleDetail extends StatefulWidget {
  const AboutVehicleDetail({super.key});

  @override
  State<AboutVehicleDetail> createState() => _AboutVehicleDetailState();
}

class _AboutVehicleDetailState extends State<AboutVehicleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          children: [
            CustomAppbar(
              title: "See full details",
            ),
            2.height,
            _buildRow('2018 AUDI Q7 PREMIUM PLUS EDITION'),
            _buildRow('QUATTRO'),
            _buildRow('ALL WHEEL DRIVE'),
            _buildRow('TOP OF THE LINE'),
            _buildRow('SUNROOF'),
            _buildRow('GAS SAVER'),
            _buildRow('6 CYLINDER SUPERCHARGED ENGINE'),
            _buildRow('49K MILES'),
            _buildRow('AUTOMATIC TRANSMISSION'),
            _buildRow('LANE ASSIST'),
            _buildRow('BACK UP CAMERA'),
            _buildRow('KEYLESS ENTRY'),
            _buildRow('KEYLESS START'),
            2.height,
            _buildRow('LEATHER SEATS'),
            _buildRow('ALLOY WHEELS'),
            2.height,
            _buildRow('BEST OFFER AUCTION'),
          ],
        ),
      )),
    );
  }

  Widget _buildRow(String label) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.red, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
