import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanduba/constants/colors.dart';
import 'package:nanduba/widgets/core/custom_button.dart';

class CustomDatePickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final DateTime minDate;
  final DateTime maxDate;
  final String title;

  /// Callback when date is confirmed
  final ValueChanged<DateTime> onDateConfirmed;

  const CustomDatePickerDialog({
    super.key,
    required this.initialDate,
    required this.minDate,
    required this.maxDate,
    required this.onDateConfirmed,
    this.title = 'Select start date',
  });

  @override
  State<CustomDatePickerDialog> createState() => _CustomDatePickerDialogState();
}

class _CustomDatePickerDialogState extends State<CustomDatePickerDialog> {
  late DateTime _tempPickedDate;

  @override
  void initState() {
    super.initState();

    // Fix: Clamp initialDate between minDate and maxDate
    if (widget.initialDate.isBefore(widget.minDate)) {
      _tempPickedDate = widget.minDate;
    } else if (widget.initialDate.isAfter(widget.maxDate)) {
      _tempPickedDate = widget.maxDate;
    } else {
      _tempPickedDate = widget.initialDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Center(child: Text(widget.title)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 200,
            child: CupertinoDatePicker(
              backgroundColor: Colors.white,
              mode: CupertinoDatePickerMode.date,
              initialDateTime: _tempPickedDate,
              minimumDate: widget.minDate,
              maximumDate: widget.maxDate,
              onDateTimeChanged: (date) {
                _tempPickedDate = date;
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  borderColor: AppColors.cBEBEBE,
                  backgroundColor: AppColors.white,
                  textcolor: AppColors.textColor,
                  vPadding: 0,
                  width: 100,
                  height: 40,
                  borderRadius: 10,
                  label: "Cancel",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomButton(
                  vPadding: 0,
                  width: 100,
                  height: 40,
                  borderRadius: 10,
                  label: "Confirm",
                  onPressed: () {
                    widget.onDateConfirmed(_tempPickedDate);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
