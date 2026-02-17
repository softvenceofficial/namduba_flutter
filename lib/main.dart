import 'package:get/get.dart';
import 'package:nanduba/controllers/address_controler.dart';
import 'package:nanduba/controllers/car_sales_controller.dart';
import 'package:nanduba/controllers/inspection_report_controller.dart';
import 'package:nanduba/controllers/order_detail_controller.dart';
import 'package:nanduba/controllers/rent_car_controller.dart';
import 'package:nanduba/controllers/sale_car_parts_controller.dart';
import 'package:nanduba/controllers/vehicle_info_controller.dart';
import 'package:nanduba/controllers/vehicle_profile_controller.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/providers/chat_provider.dart';
import 'package:nanduba/providers/estimate_provider.dart';
import 'package:nanduba/providers/view_request_provider.dart';
import 'package:nanduba/views/auth/signin_signup/with_out_signin.dart';
import 'controllers/seller_shop_info_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(RentCarController());
  Get.put(CarSalesController());
  Get.put(SaleCarPartsController());
  Get.put(VehicleProfileController());
  Get.put(InspectionReportController());
  Get.put(OrderDetailController());
  Get.put(VehicleInfoController());
  Get.put(SellerShopInfoController());
  Get.put(AddressControler());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ViewRequestProvider()),
        ChangeNotifierProvider(create: (_) => EstimateProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Sizer(
          builder: (context, language, child) {
            return GetMaterialApp(
              title: AppText.appName,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                //   textTheme: TextTheme(
                //     headlineLarge: GoogleFonts.poppins(
                //       fontWeight: FontWeight.w800,
                //       fontSize: 18.sp,
                //     ),
                //     headlineMedium: GoogleFonts.poppins(
                //       fontWeight: FontWeight.w700,
                //       fontSize: 16.sp,
                //     ),
                //     headlineSmall: GoogleFonts.poppins(
                //       fontWeight: FontWeight.w600,
                //       fontSize: 15.sp,
                //     ),
                //     bodyLarge: GoogleFonts.poppins(
                //       fontWeight: FontWeight.w500,
                //       fontSize: 14.sp,
                //     ),
                //     bodyMedium: GoogleFonts.poppins(
                //       fontWeight: FontWeight.w400,
                //       fontSize: 12.sp,
                //     ),
                //     bodySmall: GoogleFonts.poppins(
                //       fontWeight: FontWeight.w300,
                //       fontSize: 11.sp,
                //     ),
                //   ),
                colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
                scaffoldBackgroundColor: AppColors.white,
                useMaterial3: true,
              ),
              home: const WithOutSignin(),
            );
          },
        ),
      ),
    );
  }
}
