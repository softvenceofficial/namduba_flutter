import 'package:flutter/foundation.dart';

class ViewRequestProvider with ChangeNotifier {
  int _isExpanded = -1;
  int _showCancelRequest = -1;
  int _vehicleExpand=-1;

  int get isExpanded => _isExpanded;
  int get showCancelRequest => _showCancelRequest;
  int get vehicleExapnd => _vehicleExpand;

  void toggle(int index) {
    _isExpanded = _isExpanded == index ? -1 : index;
    notifyListeners();
  }
  void showCancelRequestButton(int index) {
    _showCancelRequest = _showCancelRequest == index ? -1 : index;
    notifyListeners();
  }

  void showVehicles(int index) {
    _vehicleExpand = _vehicleExpand == index ? -1 : index;
    notifyListeners();
  }
  List<Map<String,dynamic>> requests=[
    {
      "category":"Compilance",
      "requestDate":"March 11, 2024",
      "services":[
        {
          "service":"Ex-Red Book",


        },
        {
          "service":"Road Tax Renewal",

        },
        {
          "service":"Change Ownership",
        }
      ],
      "estimated":false,
    },
    {
      "category":"Repair",
      "requestDate":"March 11, 2024",
      "services":[
        {
          "service":"Change of Ownership",
          "vehicle":[
            "Toyota Hilux ABC 1812",
            "Mercedes Benz ACB 1613",
          ]


        },
        {
          "service":"Time Up Scheduled Maintenance",
          "vehicle":[
            "Jeep Hilux ABC 1812",
          ]

        },
      ],
      "estimated":true,
    },
  ];



//   **************Order Detail Pop up**************
  bool _showPop = false;

  bool get showPop=>_showPop;

  void showPopUp() {
   _showPop=!_showPop;
    notifyListeners();
  }
}
