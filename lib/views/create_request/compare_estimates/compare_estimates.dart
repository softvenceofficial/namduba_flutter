import 'dart:math';
import 'package:nanduba/export.dart';

import 'estimate_details/estimate_details.dart';


class CompareEstimates extends StatelessWidget {
List<Map<String,dynamic>> shops=[
  {
    "shopName":"Carlaw Tire & Auto Service Centre",
    "price":"1000",
    "shopImage":AppImages.shop1,
    "shopLocation":"45 Pondfield Rd W #1C",
  },
  {
    "shopName":"Almer’s Tire & Auto Workshop",
    "price":"1500",
    "shopImage":AppImages.shop2,
    "shopLocation":"Seattle, Washington, USA",

  },

  {
    "shopName":"Khawar Tire & Auto Service Centre",
    "price":"2000",
    "shopImage":AppImages.shop3,
    "shopLocation":"45 Pondfield Rd W #1C",

  }, {
    "shopName":"Khawar Tire & Auto Service Centre",
    "price":"2000",
    "shopImage":AppImages.shop3,
    "shopLocation":"45 Pondfield Rd W #1C",

  },


];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            2.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w,),
              child: const CustomAppbar(
                title: "Compare Estimates",
                isPop: true,
                isSearch: false,
                isRequestAdd: false,
              ),
            ),
            1.height,
           Expanded(
             child: ListView.builder(
               shrinkWrap: true,
               itemCount: shops.length,
               padding: EdgeInsets.zero,
               itemBuilder: (context,index) {
                 final data=shops[index];
                 return CustomContainer(
                   borderRadius: 5.w,
                   vMargin: 0.6.h,
                   hMargin: 5.w,
                  hpadding: 3.w,
                   vpadding: 1.1.h,
                   child: Column(
                   children: [
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           height: 10.h,
                           width: 21.w,
                           clipBehavior: Clip.hardEdge,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(3.w)
                           ),
                           child: Image.asset(data['shopImage'],fit: BoxFit.fill,),),
                         2.width,
                         Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(
                                     width: 50.w,
                                     child: Text(data['shopName'],
                                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                             color: AppColors.textColor,
                                             fontSize: 11.sp,
                                             fontWeight: FontWeight.w500,height: 1)),
                                   ),
                                   Spacer(),
                                   GestureDetector(
                                     onTap: () {
                                     },
                                     child: Transform.rotate(
                                         angle: pi / 2,
                                         child: SvgPicture.asset(
                                           AppSvgs.more,
                                           color: AppColors.primary,
                                         )),
                                   ),

                                 ],
                               ),
                               Row(
                                 children: [
                                   Text("\$${data['price']}",
                                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                           color: AppColors.primary,
                                           fontSize: 14.sp,
                                           fontWeight:FontWeight.w600)),
                                   Spacer(),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.end,
                                     children: [
                                       Container(
                                         padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.5.h),
                                         margin: EdgeInsets.only(top: 7),
                                         decoration: BoxDecoration(
                                             color: AppColors.yellow,
             
                                           borderRadius: BorderRadius.circular(5.w)
                                         ),
                                         child: Row(
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           children: [
                                             Icon(Icons.star_rate_rounded,color: Colors.white,size: 18,),
                                             Text("4.5",
                                                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                     color: Colors.white,
                                                     fontWeight:FontWeight.w600,fontSize: 10.sp)),
                                           ],
                                         ),
                                       ),
                                       0.5.height,
                                       Text("1.5k ratings",
                                           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                               color: AppColors.grey,
                                               fontWeight:FontWeight.w500,fontSize: 10.sp)),
                                       0.5.height,
             
                                     ],
                                   ),
             
                                 ],
                               ),
             
             
                             ],
                           ),
                         ),
             
                       ],
                     ),
                     0.5.height,
                     Divider(color: AppColors.border,),
                     0.5.height,

                     Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         SvgPicture.asset(AppSvgs.location,height: 2.2.h,width: 2.2.w,),
                         1.width,
                         Text(data['shopLocation'],style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                           color: AppColors.midDarkGrey,
                           fontWeight: FontWeight.w500,
                           fontSize: 8.sp
             
                         )),
                         Spacer(),
                         CustomButton(
                           label: "View",
                           onPressed: () {
                             AppCustomNavigator.push(
                                 context,
                                 EstimateDetails());
                           },
                           width: 21.w,
                           height: 4.h,
                           vPadding: 0,
                           hPadding: 0,
                           labelFontSize: 11.sp,
                         )
                       ],
                     ),
                     0.7.height,
             
             
                   ],
                 ),);
               }
             ),
           )



          ],
        ),
      ),
    );
  }
}






