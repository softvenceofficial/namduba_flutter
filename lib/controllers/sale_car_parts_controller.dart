import 'package:get/get.dart';

import '../utils/images.dart';

class SaleCarPartsController extends GetxController {
  RxInt expense = 11.obs;
  RxInt itemCount = 1.obs;

  RxBool readMore = false.obs;

  void incrementItem() {
    itemCount.value++;
  }

  // Function to decrement expense
  void decrementItem() {
    if (itemCount.value > 1) {
      itemCount.value--;
    }
  }



  List<Map<String, String>> carDetails = [
    {
      "carName" : 'Audi A1',
      "carFullName": "Audi A1 Sportback Hatchback",
      'carPic': AppImages.bmw,
      'interiorColor': 'Black',
      'exteriorColor': 'Silver',
      'engine': "Electrical Engine",
      'feulType': "Petrol",
      'condition': 'Good',
      'transmission': 'Automatic',
      'vin': "BAC, 1412",
      'stockNumber': 'KM235L',
      'mileage': '40 km/l',
      'model': 'AAA 545'
    },
    {
      "carName" : 'Audi A1',
      "carFullName": "Audi A1 Sportback Hatchback",
      'carPic': AppImages.honda,
      'interiorColor': 'Black',
      'exteriorColor': 'Silver',
      'engine': "Electrical Engine",
      'feulType': "Petrol",
      'condition': 'Good',
      'transmission': 'Automatic',
      'vin': "BAC, 1412",
      'stockNumber': 'KM235L',
      'mileage': '40 km/l',
      'model': 'AAA 545'
    },
    {
      "carName" : 'Audi A1',
      "carFullName": "Audi A1 Sportback Hatchback",
      'carPic': AppImages.honda,
      'interiorColor': 'Black',
      'exteriorColor': 'Silver',
      'engine': "Electrical Engine",
      'feulType': "Petrol",
      'condition': 'Good',
      'transmission': 'Automatic',
      'vin': "BAC, 1412",
      'stockNumber': 'KM235L',
      'mileage': '40 km/l',
      'model': 'AAA 545'
    },
    {
      "carName" : 'Audi A1',
      "carFullName": "Audi A1 Sportback Hatchback",
      'carPic': AppImages.honda,
      'interiorColor': 'Black',
      'exteriorColor': 'Silver',
      'engine': "Electrical Engine",
      'feulType': "Petrol",
      'condition': 'Good',
      'transmission': 'Automatic',
      'vin': "BAC, 1412",
      'stockNumber': 'KM235L',
      'mileage': '40 km/l',
      'model': 'AAA 545'
    },
  ];

}