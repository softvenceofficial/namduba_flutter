import 'package:flutter/material.dart';
import 'package:nanduba/export.dart';

class OrderItem {
  final String imagePath;
  final String title;
  final String description;
  final double price;
  final String quantity;
  final String type;

  OrderItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.type,
  });
}

class ItemDetailMain extends StatefulWidget {
  const ItemDetailMain({super.key});

  @override
  State<ItemDetailMain> createState() => _ItemDetailMainState();
}

class _ItemDetailMainState extends State<ItemDetailMain> {
  final List<OrderItem> orderItems = [
    OrderItem(
      imagePath: AppImages.Plug,
      title: 'Spark Plug',
      description: 'Mercedes-Benz AAZ 1234',
      price: 1200.00,
      quantity: 'Qty: 1',
      type: 'Product',
    ),
    OrderItem(
      imagePath: AppImages.air_filter,
      title: 'Air Filter',
      description: 'Mercedes-Benz AAZ 1234',
      price: 500.00,
      quantity: 'Qty: 1',
      type: 'Service',
    ),
    OrderItem(
      imagePath: AppImages.oil_filter,
      title: 'Oil Filter',
      description: 'Mercedes-Benz AAZ 1234',
      price: 200.00,
      quantity: 'Qty: 1',
      type: 'Service',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: const CustomAppbar(
                  title: "Tune up - scheduled maintenance",
                  isPop: true,
                  isSearch: false,
                  isRequestAdd: false,
                  // toggleIcon: AppImages.toggle, // Replace with your toggle image path



                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(28, 28, 28, 0.1),
                        offset: Offset(0, 2),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 9.h,
                          width: 17.w,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(239, 239, 239, 1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              AppImages.Car,
                            ),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Tune Up - Scheduled Maintenance',
                                      style: GoogleFonts.poppins(textStyle: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(31, 31, 31, 1)

                                      ),

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 0.7.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Mercedes-Benz AAZ 1234',
                                      style: GoogleFonts.poppins(textStyle: TextStyle(
                                        color: Color.fromRGBO(159, 159, 159, 1),
                                        fontSize: 9.sp,
                                      )
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          'Qty: 3',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0,
                                              )
                                          ),
                                        ),
                                      ),

                                      Text(
                                        '\$958.50',
                                        style: GoogleFonts.poppins(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(217, 50, 67, 1)
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: orderItems.map((orderItem) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          orderItem.imagePath,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      orderItem.title,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(31, 31, 31, 1),
                                      ),
                                    ),
                                    Text(
                                      '\$${orderItem.price.toStringAsFixed(2)}',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Color.fromRGBO(217, 50, 67, 1),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 0.7.h,),
                              Text(
                                orderItem.description,
                                style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(159, 159, 159, 1),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      orderItem.quantity,
                                      style: GoogleFonts.poppins(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(159, 159, 159, 1),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(252, 242, 242, 1),
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Text(
                                        orderItem.type,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Color.fromRGBO(217, 50, 67, 1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 14,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Attachments',style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(31, 31, 31, 1)
                    ),),
                    Image.asset(AppImages.just,height: 5.h,width: 5.w,)
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: Container(
                  padding: EdgeInsets.all(8.0), // Adjust padding as needed
                  decoration: BoxDecoration(
                    color: Colors.white, // Set a background color if needed
                    borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(28, 28, 28, 0.1), // Shadow color
                        offset: Offset(0, 2), // Offset of the shadow
                        blurRadius: 20, // Blur radius of the shadow
                        spreadRadius: 0, // Spread radius of the shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Circular container with image
                      Container(
                        height: 6.h,
                        width: 10.w,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(252, 242, 242, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            AppImages.pdf,
                          ),
                        ),
                      ),
                      // Expanded widget to push the text and the second image to the edges
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            ' Registration Certificate',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(31, 31, 31, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Circular container with image
                      ClipOval(
                        child: Container(
                          width: 30, // Adjust the width of the circular container
                          height: 30, // Adjust the height of the circular container
                          color: Color.fromRGBO(217, 50, 67, 1), // Background color for the circular container
                          child: Center(
                            child: Image.asset(
                              AppImages.cloud, // Replace with your image path
                              width: 16.8, // Adjust width as needed
                              height: 14.0, // Adjust height as needed
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Reports',style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(31, 31, 31, 1)
                    ),),
                    Image.asset(AppImages.just,height: 5.h,width: 5.w,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(8.0), // Adjust padding as needed
                  decoration: BoxDecoration(
                    color: Colors.white, // Set a background color if needed
                    borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(28, 28, 28, 0.1), // Shadow color
                        offset: Offset(0, 2), // Offset of the shadow
                        blurRadius: 20, // Blur radius of the shadow
                        spreadRadius: 0, // Spread radius of the shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Circular container with image
                      Container(
                        height: 6.h,
                        width: 10.w,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(252, 242, 242, 1),
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            AppImages.document,
                            fit: BoxFit.cover, // Adjust as needed
                          ),
                        ),
                      ),
                      // Expanded widget to push the text and the second image to the edges
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Vehicle Maintenance Report',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(31, 31, 31, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                      // Circular container with image
                      ClipOval(
                        child: Container(
                          width: 30.0, // Adjust the width of the circular container
                          height: 30.0, // Adjust the height of the circular container
                          color: Color.fromRGBO(217, 50, 67, 1), // Background color for the circular container
                          child: Center(
                            child: Image.asset(
                              AppImages.arrow_right, // Replace with your image path
                              width: 16.8, // Adjust width as needed
                              height: 14.0, // Adjust height as needed
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(8.0), // Adjust padding as needed
                  decoration: BoxDecoration(
                    color: Colors.white, // Set a background color if needed
                    borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(28, 28, 28, 0.1), // Shadow color
                        offset: Offset(0, 2), // Offset of the shadow
                        blurRadius: 20, // Blur radius of the shadow
                        spreadRadius: 0, // Spread radius of the shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Circular container with image
                      Container(
                        height: 6.h,
                        width: 10.w,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(252, 242, 242, 1),
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            AppImages.document,
                            fit: BoxFit.cover, // Adjust as needed
                          ),
                        ),
                      ),
                      // Expanded widget to push the text and the second image to the edges
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    ' Vehicle Service Report',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(31, 31, 31, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                      // Circular container with image
                      ClipOval(
                        child: Container(
                          width: 30.0, // Adjust the width of the circular container
                          height: 30.0, // Adjust the height of the circular container
                          color: Color.fromRGBO(217, 50, 67, 1), // Background color for the circular container
                          child: Center(
                            child: Image.asset(
                              AppImages.arrow_right, // Replace with your image path
                              width: 16.8, // Adjust width as needed
                              height: 14.0, // Adjust height as needed
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 2.h,)


            ],
          ),
        ),
      ),
    );
  }
}