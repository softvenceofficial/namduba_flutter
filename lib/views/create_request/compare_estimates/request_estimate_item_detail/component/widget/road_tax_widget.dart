import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';

class DurationSelectWidget extends StatelessWidget {
  final int selectedQuarter;
  final ValueChanged<int> onChanged;
  final DateTime insuranceExpiry;

  const DurationSelectWidget({
    super.key,
    required this.selectedQuarter,
    required this.onChanged,
    required this.insuranceExpiry,
  });

  bool _isAvailable(int quarter) {
    // Example rule:
    // Only 1–2 quarters allowed, others locked
    return quarter <= 2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // vpadding: 12,
      // hpadding: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _durationTile(
            title: '1 Quarter',
            value: 1,
            enabled: _isAvailable(1),
          ),
          _durationTile(
            title: '2 Quarters',
            value: 2,
            enabled: _isAvailable(2),
          ),
          _durationTile(
            title: '3 Quarters - Insurance Expires Before This Period',
            value: 3,
            enabled: _isAvailable(3),
            locked: true,
          ),
          _durationTile(
            title: '4 Quarters - Insurance expires before this period',
            value: 4,
            enabled: _isAvailable(4),
            locked: true,
          ),
          const Divider(height: 24),
          Text(
            'Longer durations unavailable',
            style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
              fontSize: 10.sp,
              color: AppColors.midGrey,
            ),
          ),
          0.6.height,
          Text(
            'Insurance expires on ${DateFormat('d MMM yyyy').format(insuranceExpiry)}',
            style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
              fontSize: 10.sp,
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          0.6.height,
          GestureDetector(
            onTap: () {
              // Navigate to extend insurance
            },
            child: Text(
              'Extend insurance to enable 3–4 quarters',
              style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                fontSize: 10.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _durationTile({
    required String title,
    required int value,
    required bool enabled,
    bool locked = false,
  }) {
    return InkWell(
      onTap: enabled ? () => onChanged(value) : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Radio<int>(
              value: value,
              groupValue: selectedQuarter,
              onChanged: enabled
                  ? (val) {
                      if (val != null) {
                        onChanged(val);
                      }
                    }
                  : null,
              activeColor: AppColors.primary,
            ),
            Expanded(
              child: Text(
                title,
                style: Textfontstyle.TextStyle12w500c212121poppins.copyWith(
                  fontSize: 11.sp,
                  color: enabled ? AppColors.textColor : AppColors.midGrey,
                ),
              ),
            ),
            if (locked)
              const Icon(
                Icons.lock_outline,
                size: 16,
                color: AppColors.midGrey,
              ),
          ],
        ),
      ),
    );
  }
}
