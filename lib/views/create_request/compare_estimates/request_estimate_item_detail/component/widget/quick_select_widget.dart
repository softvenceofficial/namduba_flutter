import 'package:nanduba/export.dart';

class EditComprehensiveCoverageDialog extends StatefulWidget {
  final String carName;
  final String? titel;
  final String? subtitle;

  final String? carReg;
  final double initialSumInsured;
  final String? icon;
  final Color? containerColor;
  final ValueChanged<double> onUpdate;

  const EditComprehensiveCoverageDialog({
    super.key,
    required this.carName,
    this.titel,
    this.subtitle,
    this.carReg,
    required this.initialSumInsured,
    required this.onUpdate,
    this.icon,
    this.containerColor,
  });

  @override
  State<EditComprehensiveCoverageDialog> createState() =>
      _EditComprehensiveCoverageDialogState();
}

class _EditComprehensiveCoverageDialogState
    extends State<EditComprehensiveCoverageDialog> {
  late TextEditingController _controller;
  late double _sumInsured;
  int? _selectedQuickAmountIndex;

  final List<double> quickAmounts = [30000, 50000, 50000, 100000];

  @override
  void initState() {
    super.initState();
    _sumInsured = widget.initialSumInsured;
    _controller = TextEditingController(text: _sumInsured.toStringAsFixed(0));

    // Pre-select quick amount if matches initialSumInsured
    _selectedQuickAmountIndex =
        quickAmounts.indexWhere((amount) => amount == _sumInsured);
    if (_selectedQuickAmountIndex == -1) _selectedQuickAmountIndex = null;
  }

  void _onQuickSelect(int index) {
    setState(() {
      _selectedQuickAmountIndex = index;
      _sumInsured = quickAmounts[index];
      _controller.text = _sumInsured.toStringAsFixed(0);
    });
  }

  void _onInputChanged(String val) {
    final parsed =
        double.tryParse(val.replaceAll(',', '').replaceAll('\$', '').trim());
    if (parsed != null) {
      setState(() {
        _sumInsured = parsed;
        _selectedQuickAmountIndex =
            null; // Clear quick selection if manual input
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              widget.titel ?? 'Edit Comprehensive Coverage',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              widget.subtitle ?? 'Adjust coverage limits for this vehicle.',
              style: const TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 20),

            // Car info card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: widget.containerColor ?? Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Car icon - use Icons.car_rental for example
                  SvgPicture.asset(
                    widget.icon ?? AppSvgs.carIcon,
                    height: 25,
                    width: 25,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.carName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        if (widget.carReg != null)
                          Text(
                            'Reg: ${widget.carReg}',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black54),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Sum insured label and input
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sum insured',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
              decoration: InputDecoration(
                prefixText: '\$ ',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
              onChanged: _onInputChanged,
            ),

            const SizedBox(height: 12),

            // Quick select buttons
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Quick select:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(quickAmounts.length, (index) {
                  final amount = quickAmounts[index];
                  final isSelected = _selectedQuickAmountIndex == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      backgroundColor: Colors.white,
                      label: Text('\$${amount.toStringAsFixed(0)}'),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          _onQuickSelect(index);
                        }
                      },
                      selectedColor: Colors.blue[900],
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 12),

            // Description text
            const Text(
              'This amount represents the maximum value your vehicle is insured for in the event of a total loss.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 10),

            // Buttons row
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    vPadding: 0,
                    label: 'Cancel',
                    borderRadius: 8,
                    backgroundColor: Colors.white,
                    textcolor: Colors.black87,
                    borderColor: Colors.grey.shade400,
                    height: 40,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    vPadding: 0,
                    label: 'Update',
                    borderRadius: 8,
                    backgroundColor: AppColors.primary,
                    textcolor: Colors.white,
                    height: 40,
                    onPressed: () {
                      widget.onUpdate(_sumInsured);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
