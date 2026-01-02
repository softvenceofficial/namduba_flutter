import 'package:nanduba/export.dart';
import 'package:nanduba/providers/estimate_provider.dart';
import 'package:nanduba/views/create_request/thank_you_order/thank_you_order.dart';
import 'package:nanduba/widgets/core/card_widget.dart';
import 'package:nanduba/widgets/core/my_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class ChosePayment extends StatelessWidget {
  final PageController controller=PageController(viewportFraction: 0.85);
  final List<Map<String, String>> cards = [
    {
      'number': 'XXXX XXXX XXXX 5028',
      'name': 'JON DEO',
      'expiry': '05/2026',
      'image': AppImages.redcard,
    },
    {
      'number': 'XXXX XXXX XXXX 1234',
      'name': 'JANE DOE',
      'expiry': '08/2025',
      'image': AppImages.blackcard,
    },
  ];
  final List<Map<String, String>> paymentMethods = [

    {
      'name': 'Apple Pay',
      'image': AppSvgs.applepay,

    },
    {
      'name': 'Paypal',
      'image': AppSvgs.paypal,

    },
    {
      'name': 'Mobile Money',
      'image': AppSvgs.mobilemoney,

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
                title: "Choose Payment Method",
                isPop: true,
                isSearch: false,
                isRequestAdd: false,
              ),
            ),
            2.height,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        height: 168,
                        child: PageView.builder(
                          controller: controller,
                          padEnds: false,
                          itemCount: cards.length,
                          itemBuilder: (context, index) {
                            return CardWidget(
                              number: cards[index]['number']!,
                              name: cards[index]['name']!,
                              expiry: cards[index]['expiry']!,
                              image:cards[index]['image']!,
                              color: index==0?AppColors.primary:Color(0xff212121),
                            );
                          },
                        ),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          2.height,
                          Center(
                            child: SmoothPageIndicator(
                              controller: controller,
                              count: 2,
                              effect: WormEffect(
                                activeDotColor: Colors.red,
                                dotHeight: 8.0,
                                dotWidth: 8.0,
                              ),
                            ),
                          ),
                          2.height,
                          Text("Payment Methods",style: Theme.of(context)!.textTheme.bodyMedium!.copyWith(
                              fontSize: 13.sp,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600
                          ),),
                          Consumer<EstimateProvider>(
                            builder: (context, provider, child) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: paymentMethods.length,
                                  itemBuilder: (context,index) {
                                    final payment=paymentMethods[index];
                                    return GestureDetector(
                                      onTap: (){
                                        provider.selectPaymentMethod(index);
                                      },
                                      child: CustomContainer(
                                        borderRadius: 5.w,
                                        vMargin: 1.h,
                                        // hMargin: 5.w,
                                        hpadding: 3.w,
                                        vpadding: 1.3.h,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 5.5.h,
                                              width: 10.5.w,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: AppColors.secondary,
                                                  borderRadius: BorderRadius.circular(14)
                                              ),
                                              child: SvgPicture.asset(payment['image']??''),

                                            ),
                                            2.width,
                                            Text(payment['name']??"",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.textColor
                                            ),),
                                            Spacer(),
                                            Container(
                                              height: 22,
                                              width: 22,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color:provider.selectedPayment==index?AppColors.primary:AppColors.border)
                                              ),
                                              child: provider.selectedPayment==index?CircleAvatar(radius: 8,backgroundColor: AppColors.primary,):SizedBox.shrink(),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                              );

                            },
                          ),
                          10.height,



                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(60),
                              border: Border.all(width: 1,color: Color.fromRGBO(217, 50, 67, 1))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                                  child: Text('Add Payment Method',style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(217, 50, 67, 1)

                                  ),),
                                ),
                              ],
                            ),
                          ),
                          2.height,
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            )





          ],
        ),
      ),
    );
  }
}







