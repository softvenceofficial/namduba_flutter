import 'package:get/get.dart';
import 'package:nanduba/export.dart';

class InspectionReportController extends GetxController{

  RxBool interior = false.obs;
  RxBool exterior = false.obs;
  RxBool engine = false.obs;
  RxBool roadworthiness = false.obs;

  RxMap<int, bool> expandedStates = <int, bool>{}.obs;

  // Method to toggle expanded state
  void toggleExpanded(int index) {
    expandedStates[index] = !(expandedStates[index] ?? false);
  }

  RxList<String> results = <String>[
    "Interior Check",
    "Exterior Check",
    'Engine Check',
    "Roadworthiness Check"
  ].obs;

  RxList<String> basicResult = <String>[
    "Inspection",
    "Assessment ",
    'Works carried out',
    "Items that need attention"
  ].obs;

  RxList<String> basicResultIcons = <String>[
    AppSvgs.searchIcon,
    AppSvgs.clipboard_tick,
    AppSvgs.briefcase,
    AppSvgs.danger
  ].obs;

  RxList<String> resultsIcons = <String>[
    AppSvgs.result_seat,
    AppSvgs.result_body,
    AppSvgs.result_engine,
    AppSvgs.result_license
  ].obs;

  RxList<Map<String, dynamic>> interiorCheck = <Map<String, dynamic>>[
    {"property": "Dashboard", "working": true},
    {"property": "Horn", "working": true},
    {"property": "Storing Mechanism", "working": true},
    {"property": "Hand brake", "working": true},
    {"property": "Radio", "working": true},
    {"property": "Air conditioner", "working": false},
    {"property": "Seats, belts, mats", "working": true},
    {"property": "Ceiling, panels, switches", "working": true},
    {"property": "Accessories", "working": true},
    {"property": "Car battery", "working": true},
  ].obs;


  RxList<Map<String, dynamic>> exteriorCheck = <Map<String, dynamic>>[
    {"property": "Car body", "working": true},
    {"property": "Lights", "working": true},
    {"property": "Storing Mechanism", "working": true},
    {"property": "Tires", "working": true},
    {"property": "Exhaust", "working": true},
    {"property": "Air conditioner", "working": true},
    {"property": "Boot shocks", "working": false},
  ].obs;

  RxList<Map<String, dynamic>> engineCheck = <Map<String, dynamic>>[
    {"property": "Cleanliness", "working": true},
    {"property": "Fluids", "working": true},
  ].obs;

  RxList<Map<String, dynamic>> roadworthinessCheck = <Map<String, dynamic>>[
    {"property": "Licenses/Certifications", "working": true},
  ].obs;
}