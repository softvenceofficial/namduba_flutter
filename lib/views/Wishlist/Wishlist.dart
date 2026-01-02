import 'package:flutter/material.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/widgets/core/custom_appbar.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final List<Map<String, dynamic>> _items = [
    {
      'image': AppImages.dark_whole,
      'text1': 'Plain Black Magnetic Car Tax Disc Holder & Permit...',
      'text2': 'March 11, 2024',
      'text3': 'K110.00',
      'isFavorite': false,
      'detailText': '4.5',
    },
    {
      'image': AppImages.dark_whole,
      'text1': 'Plain Black Magnetic Car Tax Disc Holder & Permit...',
      'text2': 'March 11, 2024',
      'text3': 'K110.00',
      'isFavorite': false,
      'detailText': '4.5',
    },
    {
      'image': AppImages.dark_whole,
      'text1': 'Plain Black Magnetic Car Tax Disc Holder & Permit...',
      'text2': 'March 11, 2024',
      'text3': 'K110.00',
      'isFavorite': false,
      'detailText': '4.5',
    },
    {
      'image': AppImages.dark_whole,
      'text1': 'Plain Black Magnetic Car Tax Disc Holder & Permit...',
      'text2': 'March 11, 2024',
      'text3': 'K110.00',
      'isFavorite': false,
      'detailText': '4.5',
    },
    {
      'image': AppImages.dark_whole,
      'text1': 'Plain Black Magnetic Car Tax Disc Holder & Permit...',
      'text2': 'March 11, 2024',
      'text3': 'K110.00',
      'isFavorite': false,
      'detailText': '4.5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              children: [
                // SizedBox(height: 0.1.h,),
                myAppBar(title: 'Wishlist', icon: AppSvgs.filter2,),
                SizedBox(height: 4.h,),

                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color for the container
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(28, 28, 28, 0.1), // Shadow color
                            offset: Offset(0, 2), // Shadow offset
                            blurRadius: 20, // Shadow blur radius
                            spreadRadius: 0, // Shadow spread radius
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20.0), // Rounded corners
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0,left: 12,bottom: 9),
                            child: Container(
                              width: 22.w, // Responsive width
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color.fromRGBO(246, 246, 246, 1), // Grey container

                              ),
                              child: Center(
                                child: Image.asset(item['image'],height: 9.h,width: 13.w,),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0), // Space between grey container and content
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0,right: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item['text1'],
                                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                              fontFamily: 'Poppins',
                                              color: Color.fromRGBO(31, 31, 31, 1),
                                              fontSize: 9.sp, // Responsive font size
                                              fontWeight: FontWeight.w500,
                                              height: 1.5
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            item['isFavorite'] = !item['isFavorite'];
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 10.0),
                                          child: Icon(
                                            Icons.favorite,
                                            color: item['isFavorite'] ? Color.fromRGBO(217, 50, 67, 1) : Colors.grey[200],size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 1.h,),
                                Text(
                                  item['text2'],
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontFamily: 'Poppins',
                                    color: Color.fromRGBO(84, 84, 84, 1),
                                    fontSize: 9.sp, // Responsive font size
                                  ),
                                ),
                                SizedBox(height: 1.h,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item['text3'],
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          fontFamily: 'Poppins',
                                          color: Color.fromRGBO(217, 50, 67, 1),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.sp, // Responsive font size
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(60),
                                              color: Color.fromRGBO(244, 167, 41, 1),
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset(AppImages.star,height: 12,width: 12,),
                                                SizedBox(width: 4.0),
                                                Text(
                                                  item['detailText'],
                                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                      fontSize: 9.sp, // Responsive font size
                                                      fontWeight: FontWeight.w600
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 1.h,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}