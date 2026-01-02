import 'package:flutter/foundation.dart';

class EstimateProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _services = [
    {
      "service": "Change of OwnerShip",
      "quantity":2,
      "price":900,
      "requestDate":"March 23, 2024",
      "vehicles":[
        "Toyota Hilux ABC 1812",
        "Mercedes Benz ACB 1613",
      ],
    },
    {
      "service": "Time up Scheduled Maintance",
      "quantity":2,
      "price":300,
      "requestDate":"March 23, 2024",
      "vehicles":[
        "Jeep Cheke ACJ 1222"
      ],

    },
  ];

  List<Map<String, dynamic>> get services => _services;

  void removeService(Map<String, dynamic> service) {
    services.remove(service);
    _calculateTotal();
    notifyListeners();
  }


  int _totalPrice = 0;

  int get total => _totalPrice;

  EstimateProvider() {
    _calculateTotal();
  }

  void _calculateTotal() {
    _totalPrice = _services.fold(0, (sum, service) => sum + (service['price'] as int));
    notifyListeners();
  }



  //*************************Estimate details*********************//
  int _isExpanded = -1;
  int get isExpanded => _isExpanded;
  void toggle(int index) {
    _isExpanded = _isExpanded == index ? -1 : index;
    notifyListeners();
  }
  //*************************Estimate Item details*********************//
bool _showItems = false;

bool get showItems => _showItems;

void showMoreItem(){
  _showItems=!_showItems;
  notifyListeners();
}

  //*************************Payment Method*********************//
  int _selectedPayment = -1;

  int get selectedPayment => _selectedPayment;

  void selectPaymentMethod(int index){
    _selectedPayment = index;
    notifyListeners();
  }



}
