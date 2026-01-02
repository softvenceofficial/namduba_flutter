import 'package:nanduba/views/add_vehicle/vehicle_profile/widget/shop_for_ride_item_container.dart';
import 'package:nanduba/views/add_vehicle/vehicle_profile/widget/tire_shop_item_container.dart';
import 'package:nanduba/widgets/core/my_text.dart';

import '../../../../export.dart';
import '../../../shop/car_part_details.dart';

class VehicleShopForRideComponent extends StatelessWidget {
  // const VehicleShopForRideComponent({super.key});
List<dynamic> shopItems=[
  {
    "image":AppImages.headlights,
    "name":"19 20 21 22 ACURA ILX Genuine Headlamp...",
    "price":"900"
  },
  {
    "image":AppImages.brakes,
    "name":"EBC Brakes  DP33049C Redstuff Ceramic...",
    "price":"958.88"
  },
];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              MyText(text: "Shop For Your Ride",fontWeight: FontWeight.w600,fontSize: 13.sp,color: AppColors.textColor,),
              Spacer(),
              GestureDetector(
                  onTap: (){
                    AppCustomNavigator.push(context, CarSales(selectedIndex: 2,));

                  },
                  child: MyText(text: "Explore More",fontWeight: FontWeight.w400,fontSize: 11.sp,color: AppColors.primary,decoration: TextDecoration.underline,)),
            ],
          ),
          1.5.height,
          Row(

            children: List.generate(shopItems.length, (index)=>ShopForRideItemContainer(itemName: shopItems[index]["name"], itemPic: shopItems[index]["image"], price: shopItems[index]["price"],onTap: (){
              AppCustomNavigator.push(context, CarPartDetails());

            },),),
          ),
          2.height,
          Row(
            children: [
              MyText(text: "Tire Shop",fontWeight: FontWeight.w600,fontSize: 13.sp,color: AppColors.textColor,),
              Spacer(),
              GestureDetector(
                  onTap: (){
                    AppCustomNavigator.push(context, CarSales(selectedIndex: 2,));
                  },
                  child: MyText(text: "Step into the Tire Shop",fontWeight: FontWeight.w400,fontSize: 11.sp,color: AppColors.primary,decoration: TextDecoration.underline,)),
            ],
          ),
          1.5.height,

          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(2, (index)=>TireShopItemContainer(onTap:  (){
                AppCustomNavigator.push(context, CarPartDetails());

              },)),
            ),
          ),
          2.height,
          CustomButton(label: "Request Service", onPressed: (){
            AppCustomNavigator.push(context, ServicesScreen());
          }),
          2.height,



        ],
    );
  }
}
