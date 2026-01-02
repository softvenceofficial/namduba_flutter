import 'package:flutter/material.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/widgets/core/my_text.dart';

class CarPartsContainer extends StatefulWidget {
  const CarPartsContainer({
    super.key,
    required this.carPic,
    required this.carName,
    required this.carModel,
    this.isSelected = false,
  });

  final String carPic;
  final String carName;
  final String carModel;
  final bool isSelected;

  @override
  State<CarPartsContainer> createState() => _CarPartsContainerState();
}

class _CarPartsContainerState extends State<CarPartsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.0.h,
      padding: EdgeInsets.all(1.6.w),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: widget.isSelected ? AppColors.primary : AppColors.transparent, // Change border color to grey when not selected
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 12.h,
            width: 12.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(widget.carPic),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 5),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: widget.carName,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              SizedBox(height: 1),
              MyText(
                text: widget.carModel,
                fontSize: 9.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.carPartGrey,
              ),
            ],
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}



class CarPartsContainerWithChange extends StatefulWidget {
  const CarPartsContainerWithChange({
    super.key,
    required this.carPic,
    required this.carName,
    required this.carModel,
    this.isSelected = false, required this.onChange,
  });

  final String carPic;
  final String carName;
  final String carModel;
  final bool isSelected;
  final VoidCallback onChange;

  @override
  State<CarPartsContainerWithChange> createState() => _CarPartsContainerWithChangeState();
}

class _CarPartsContainerWithChangeState extends State<CarPartsContainerWithChange> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.0.h,
      padding: EdgeInsets.all(1.6.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: AppColors.primary , // Change border color to grey when not selected
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 12.h,
            width: 12.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(widget.carPic),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: widget.carName,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                SizedBox(height: 1),
                MyText(
                  text: widget.carModel,
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.carPartGrey,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: widget.onChange,
            child: MyText(
              text: 'Change',
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}