import 'package:get/get.dart';

class VehicleInfoController extends GetxController {

  RxBool showData = false.obs;


  // Odometer

  RxString odometer = "".obs;


  // Get my corolla

  RxString carLocation = ''.obs;
  RxString carRegistration = ''.obs;

  // Tyre info
  RxString tyreDetail = ''.obs;
  RxString tyreWidth = ''.obs;
  RxString tyreRatio = ''.obs;
  RxString tyreDiameter = ''.obs;
  RxString tyreOEM = ''.obs;

  // Certificate Info

  RxString certName = ''.obs;
  RxString certIssuer = ''.obs;
  RxString issueDate = ''.obs;
  RxString issueMonth = ''.obs;
  RxString issueYear = ''.obs;
  RxString expiryDate = ''.obs;
  RxString expiryMonth = ''.obs;
  RxString expiryYear = ''.obs;
  RxString certNumber = ''.obs;

  // Insurance Policy

  RxString coverType = ''.obs;
  RxString policyIssuer = ''.obs;
  RxString policyStartDate = ''.obs;
  RxString policyStartMonth = ''.obs;
  RxString policyStartYear = ''.obs;
  RxString policyEndDate = ''.obs;
  RxString policyEndMonth = ''.obs;
  RxString policyEndYear = ''.obs;
  RxString policyNumber = ''.obs;

  // Reminder Info

  RxString remindType = ''.obs;
  RxString serviceReminder = ''.obs;
  RxString serviceStartDate = ''.obs;
  RxString serviceStartMonth = ''.obs;
  RxString serviceStartYear = ''.obs;
  RxString serviceMileage = ''.obs;
  RxString serviceRepairs = ''.obs;

  // Estimated Value

  RxString estimatedValue = ''.obs;

  // Document info

  RxString registerCertificate = ''.obs;
}