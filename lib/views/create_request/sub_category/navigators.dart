import 'package:nanduba/export.dart';

class Navigators {
  static List<Function(BuildContext)> repairNavigator = [
    (BuildContext context) {
      AppCustomNavigator.push(context, const GeneralScreen());
    },
    (BuildContext context) {
      AppCustomNavigator.push(context, const AirconScreen());
    },
    (BuildContext context) {
      AppCustomNavigator.push(context, const ElectricalScreen());
    },
    (BuildContext context) {
      AppCustomNavigator.push(context, const ExhaustScreen());
    },
    (BuildContext context) {
      AppCustomNavigator.push(context, const WindshieldGlassScreen());
    },
//TODO: screen not exists
    (BuildContext context) {
      AppCustomNavigator.push(context, const GeneralScreen());
    },
    (BuildContext context) {
      AppCustomNavigator.push(context, const BodyWorkScreen());
    },
    (BuildContext context) {
      AppCustomNavigator.push(context, const WheelsTiresScreen());
    },
  ];

  static List<Function(BuildContext)> insuranceNavigator = [
    (BuildContext context) {
      AppCustomNavigator.push(context, const InsureScreen());
    },
    (BuildContext context) {
      AppCustomNavigator.push(context, const ClaimScreen());
    },
  ];
}
