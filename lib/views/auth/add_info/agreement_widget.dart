// import 'package:nanduba/export.dart';

// class AgreementWidget extends StatelessWidget {
//   const AgreementWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       text: TextSpan(
//         text: AppText.bySelecting,
//         style: Theme.of(context)
//             .textTheme
//             .bodySmall
//             ?.copyWith(color: AppColors.midGrey),
//         children: [
//           TextSpan(
//             text: AppText.agreeAndCont,
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyMedium
//                 ?.copyWith(fontWeight: FontWeight.w700),
//           ),
//           TextSpan(
//             text: AppText.iAgree,
//             style: Theme.of(context)
//                 .textTheme
//                 .bodySmall
//                 ?.copyWith(color: AppColors.midGrey),
//           ),
//           TextSpan(
//             text: AppText.termOfServices,
//             style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                   color: AppColors.primary,
//                   decoration: TextDecoration.underline,
//                   decorationColor: AppColors.primary,
//                 ),
//           ),
//           TextSpan(
//             text: ',\n',
//             style: Theme.of(context)
//                 .textTheme
//                 .bodySmall
//                 ?.copyWith(color: AppColors.midGrey),
//           ),
//           TextSpan(
//             text: AppText.paymentTermOfServices,
//             style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                   color: AppColors.primary,
//                   decoration: TextDecoration.underline,
//                   decorationColor: AppColors.primary,
//                 ),
//           ),
//           TextSpan(
//             text: AppText.acknowledge,
//             style: Theme.of(context)
//                 .textTheme
//                 .bodySmall
//                 ?.copyWith(color: AppColors.midGrey),
//           ),
//           TextSpan(
//             text: AppText.privacyPolicy,
//             style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                   color: AppColors.primary,
//                   decoration: TextDecoration.underline,
//                   decorationColor: AppColors.primary,
//                 ),
//           ),
//           TextSpan(
//             text: '.',
//             style: Theme.of(context)
//                 .textTheme
//                 .bodySmall
//                 ?.copyWith(color: AppColors.midGrey),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:nanduba/export.dart';

class AgreementWidget extends StatelessWidget {
  const AgreementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppText.bySelecting,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.midGrey,
              fontSize: 12.sp,
            ),
        children: [
          TextSpan(
            text: AppText.agreeAndCont,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                ),
          ),
          TextSpan(
            text: AppText.iAgree,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.midGrey,
                  fontSize: 12.sp,
                ),
          ),
          TextSpan(
            text: AppText.termOfServices,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                  fontSize: 12.sp,
                ),
          ),
          TextSpan(
            text: ',\n',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.midGrey,
                  fontSize: 12.sp,
                ),
          ),
          TextSpan(
            text: AppText.paymentTermOfServices,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                  fontSize: 12.sp,
                ),
          ),
          TextSpan(
            text: AppText.acknowledge,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.midGrey,
                  fontSize: 12.sp,
                ),
          ),
          TextSpan(
            text: AppText.privacyPolicy,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                  fontSize: 12.sp,
                ),
          ),
          TextSpan(
            text: '.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.midGrey,
                  fontSize: 12.sp,
                ),
          ),
        ],
      ),
    );
  }
}
