import 'package:get/get.dart';

import '../export.dart';
import '../utils/images.dart';

class SellerShopInfoController extends GetxController {
  TextEditingController searchController = TextEditingController();

  // List of cars
  List<Map<String, dynamic>> cars = [
    {"name": "BMW", "price": "500.00", "rating": "2.5", "info": "K110.00-40km/l", "image": AppImages.bmw},
    {"name": "Corolla", "price": "300.00", "rating": "3.5", "info": "K110.00-40km/l", "image": AppImages.Car_Benz},
    {"name": "BMW", "price": "400.00", "rating": "2.8", "info": "K110.00-40km/l", "image": AppImages.bmw},
    {"name": "Benz", "price": "700.00", "rating": "4.5", "info": "K110.00-40km/l", "image": AppImages.Car_Benz},
    {"name": "Honda", "price": "800.00", "rating": "4.0", "info": "K110.00-40km/l", "image": AppImages.honda},
  ];

  // Observable list of filtered cars
  RxList<Map<String, dynamic>> filteredCars = RxList<Map<String, dynamic>>();

  @override
  void onInit() {
    super.onInit();
    // Initially, all cars are displayed
    filteredCars.value = cars;

    // Add a listener to the search controller
    searchController.addListener(() {
      filterCars(searchController.text);
    });
  }

  // Method to filter cars
  void filterCars(String query) {
    if (query.isEmpty) {
      filteredCars.value = cars;
    } else {
      filteredCars.value = cars
          .where((car) => car['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}