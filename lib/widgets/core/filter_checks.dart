import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanduba/constants/colors.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/widgets/core/my_text.dart';

class FilterChecks extends StatefulWidget {
  const FilterChecks({super.key, required this.title, this.backgroundColor, this.tick, this.onTap});

  final String title;
  final Color? backgroundColor;
  final Color? tick;
  final VoidCallback? onTap;

  @override
  _FilterChecksState createState() => _FilterChecksState();
}

class _FilterChecksState extends State<FilterChecks> {
  bool _isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            print(_isChecked);
            if(_isChecked == false){
              setState(() {
                _isChecked = true;
              });
            } else {
              setState(() {
                _isChecked = false;
              });
            }
            print(_isChecked);
          },
          child: Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
                color: _isChecked == false ?  Colors.white : widget.backgroundColor ?? AppColors.primary,
                border: Border.all(
                  width: 1,
                  color: _isChecked == false ? AppColors.border : widget.tick ?? AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(8)
            ),
            child: _isChecked == false ? SizedBox() : Icon(Icons.check, size: 14, color: widget.tick ?? Colors.white,),
          ),
        ),
        MyText(
          text: widget.title,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.grey,
        )
      ],
    );
  }
}