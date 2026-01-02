import '../../../../export.dart';

class RequestServiceDetailsList extends StatelessWidget {
  final Map<String, dynamic> requests;
  const RequestServiceDetailsList({super.key, required this.requests});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          requests['detail'].length, (moreindex) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: AppColors.border,
                  ),
                  // Row(
                  //   children: [
                  //     Text("2018 BMW",
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .bodyMedium!
                  //             .copyWith(
                  //                 color: AppColors.textColor,
                  //                 fontWeight: FontWeight.w500)),
                  //     SizedBox(
                  //       width: 6,
                  //     ),
                  //     Container(
                  //       height: 6,
                  //       width: 6,
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         color: AppColors.primary,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 6,
                  //     ),
                  //     Text(requests['detail'][moreindex]['number'],
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .bodyMedium!
                  //             .copyWith(
                  //                 color: AppColors.midDarkGrey,
                  //                 fontWeight: FontWeight.w500)),
                  //   ],
                  // ),
                  1.height,
                  Text("Breakdown Location",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.midDarkGrey,
                          fontWeight: FontWeight.w500)),
                  0.5.height,
                  Text(
                    "123 New Street, Cape Town 504050",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  1.height,
                  Text("Towing Location",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.midDarkGrey,
                          fontWeight: FontWeight.w500)),
                  0.5.height,
                  Text(
                    "123 New Street,  Polokwane 540987",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  if (moreindex == requests['detail'].length - 1)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(color: AppColors.border,),
                      // Text(
                      //     "Quantity ${requests['detail'].length.toString()}",
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .bodyMedium!
                      //         .copyWith(
                      //         color:
                      //         AppColors.textColor,
                      //         fontWeight:
                      //         FontWeight.w500)),
                      0.5.height,
                      Row(
                        children: [
                          Text("2018 BMW",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(requests['detail'][moreindex]['number'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                  color: AppColors.midDarkGrey,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),

                ],
              )),
    );
  }
}
