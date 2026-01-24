import 'package:flutter/material.dart';
import 'package:nanduba/constants/colors.dart';
import 'package:nanduba/widgets/core/custom_button.dart';

class PolicyPeriodPickerDialog extends StatefulWidget {
  final int initialSelectedQuarters;
  final ValueChanged<int> onConfirmed;

  const PolicyPeriodPickerDialog({
    Key? key,
    required this.initialSelectedQuarters,
    required this.onConfirmed,
  }) : super(key: key);

  @override
  State<PolicyPeriodPickerDialog> createState() =>
      _PolicyPeriodPickerDialogState();
}

class _PolicyPeriodPickerDialogState extends State<PolicyPeriodPickerDialog> {
  late int _selectedQuarters;

  @override
  void initState() {
    super.initState();
    _selectedQuarters = widget.initialSelectedQuarters;
  }

  @override
  Widget build(BuildContext context) {
    final options = [
      {'quarters': 1, 'months': 3},
      {'quarters': 2, 'months': 6},
      {'quarters': 3, 'months': 9},
      {'quarters': 4, 'months': 12},
    ];

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            const Text(
              'Select Policy Period',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Adjust coverage limits for the entire policy.',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),

            const SizedBox(height: 12),
            const Divider(thickness: 1),

            // Options with dividers
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(options.length, (index) {
                    final quarters = options[index]['quarters']!;
                    final months = options[index]['months']!;
                    return Column(
                      children: [
                        RadioListTile<int>(
                          contentPadding: EdgeInsets.zero,
                          value: quarters,
                          groupValue: _selectedQuarters,
                          title: Text(
                            '$quarters Quarter${quarters > 1 ? 's' : ''} ($months months)',
                          ),
                          onChanged: (val) {
                            setState(() {
                              _selectedQuarters = val!;
                            });
                          },
                        ),
                        // Add divider between all options except last
                        if (index != options.length - 1)
                          const Divider(thickness: 0.5, height: 0),
                      ],
                    );
                  }),
                ),
              ),
            ),

            const Divider(thickness: 1),
            const SizedBox(height: 8),

            // Description
            const Text(
              'This amount represents the maximum value your vehicle is insured for in the event of a total loss.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    borderColor: AppColors.cBEBEBE,
                    textcolor: AppColors.textColor,
                    backgroundColor: AppColors.white,
                    vPadding: 0,
                    height: 40,
                    borderRadius: 10,
                    label: 'Cancel',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    height: 40,
                    borderRadius: 10,
                    label: 'Confirm',
                    onPressed: () {
                      widget.onConfirmed(_selectedQuarters);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
