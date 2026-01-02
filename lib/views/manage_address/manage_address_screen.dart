import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nanduba/views/manage_address/add_address.dart';

import '../../controllers/address_controler.dart';
import '../../export.dart';
import '../../widgets/core/my_text.dart';

class ManageAddressScreen extends StatefulWidget {
final bool comingFromRequest;
  const ManageAddressScreen({super.key,  this.comingFromRequest=false,  });

  @override
  State<ManageAddressScreen> createState() => _ManageAddressScreenState();
}

class _ManageAddressScreenState extends State<ManageAddressScreen> with TickerProviderStateMixin{

  // List of AnimationControllers and Animations
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _offsetAnimations;
  final AddressControler addressControler = Get.find();



  List<String> data = [
    'Home',
    "Office",
    "Others",
  ];

  List<String> icons = [
    AppSvgs.home,
    AppSvgs.office,
    AppSvgs.location,
  ];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (index) => AnimationController(vsync: this, duration: Duration(milliseconds: 300)));
    _offsetAnimations = _controllers.map((controller) => Tween<Offset>(begin: Offset.zero, end: Offset(-0.2, 0)).animate(controller)).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void deleteItem(int index) {
    // Call your delete function here
    print('Delete item at index: $index');
    // Example: saleCarPartsController.deleteItem(index);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 2.h),
          child: Column(
            children: [
              CustomAppbar(title: "Manage Address"),
              2.height,
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        if(widget.comingFromRequest==true){
                        addressControler.address.value='123 Demo Street Florida USA, FL 123456';
                        Get.back();
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: index != 0 ? 2.h : 0),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  child: SvgPicture.asset(AppSvgs.trash, color: Colors.white, height: 3.h,)
                              ),
                            ),
                            SlideTransition(
                              position: _offsetAnimations[index],
                              child: GestureDetector(
                                onHorizontalDragUpdate: (details) {
                                  if (details.primaryDelta! < -4) {
                                    _controllers[index].forward();
                                  } else if (details.primaryDelta! > 4) {
                                    _controllers[index].reverse();
                                  }
                                },
                                child: CustomContainer(
                                  hpadding: 8,
                                  vpadding: 7,
                                  borderRadius: 20,
                                  width: Get.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 8.h,
                                        width: 8.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: AppColors.secondary
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: SvgPicture.asset(icons[index], color: AppColors.primary, height: 1.h,),
                                        ),
                                      ),
                                      SizedBox(width: 14),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            MyText(
                                              text: data[index],
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black,
                                            ),
                                            0.8.height,
                                            MyText(
                                              text: "123 Demo Street Florida USA, FL 123456",
                                              color: AppColors.grey,
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              CustomButton(label: "Add New Address", onPressed: (){
                Get.to(AddAddress());
              }),

            ],
          ),
        ),
      ),
    );
  }
}
