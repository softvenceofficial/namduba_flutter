import 'package:flutter/material.dart';
import 'package:nanduba/export.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              myAppBar(
                title: 'Account Settings',
                icon: AppSvgs.filter2,
                isSearch: false,
                isToggle: true,
                onTogglePressed: () {
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20,),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(28, 28, 28, 0.1),
                        offset: Offset(0, 2),
                        blurRadius: 20,
                        spreadRadius: 0,
                      ),
                    ],
                    
                    
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildRow('Login & Security'),
                        SizedBox(height: 3.h),
                        _buildRow('Payments & Payouts'),
                        SizedBox(height: 3.h),
                        _buildRow('Taxes'),
                        SizedBox(height: 3.h),
                        _buildRow('Notifications'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(31, 31, 31, 1),
          ),
        ),
        Image.asset(
          AppImages.arrow_circle_right,
          width: 18,
          height: 18,
        ),
      ],
    );
  }
}
