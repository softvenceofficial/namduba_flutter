import 'dart:io';

import 'package:get/get.dart';

import '../export.dart';

class VehicleProfileController extends GetxController{
  RxBool showSpecsDetails=false.obs;
  RxBool showSavedTiresDetails=false.obs;
  RxBool showCertificatesDetails=false.obs;
  RxBool showRemindersDetails=false.obs;
  RxBool showEstimatedDetails=false.obs;
  RxBool showDocumentsDetails=false.obs;





  RxBool isOpen = false.obs;
  RxBool vehicleActive=true.obs;

  void showPopUp() {
    isOpen.value=!isOpen.value;
    update();
  }

  File? image;
  final ImagePicker picker = ImagePicker();
  Future<void> pickImage() async{
    final XFile? pickedImage =
    await picker.pickImage(
        imageQuality: 10,
        source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
      update();
      refresh();

    }
  }


  // **************vehcile listing screen
  RxInt listingIndex=0.obs;
  RxList<dynamic> listings=[
    {
      'name':"Eleanor's Car",
      'year':2010,
      'model': "Toyota Corolla ABC 1234"
    },
    {
      'name':"Eleanor's Car",
      'year':2014,
      'model': "Toyota Corolla ABC 1334"
    },
    {
      'name':"Eleanor's Car",
      'year':2020,
      'model': "Toyota Corolla ABC 1234"
    },
  ].obs;




//   *************vehicle info text controllers
final TextEditingController nameController = TextEditingController();
final TextEditingController odometer = TextEditingController();


// *************vehicle certificate sheet
  RxBool addExpiryDate = true.obs;






}