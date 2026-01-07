import 'package:nanduba/constants/textfontstyle.dart';
import 'package:nanduba/export.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/screen/select_currency_widget.dart';
import 'package:nanduba/views/new_profile_screen/marketplace/widget/drop_down_model.dart';
import 'package:nanduba/views/new_profile_screen/your_garage/widget/drop_down_widget.dart';

class ConsignmentDetailsScreen extends StatefulWidget {
  const ConsignmentDetailsScreen({super.key});

  @override
  State<ConsignmentDetailsScreen> createState() =>
      _ConsignmentDetailsScreenState();
}

class _ConsignmentDetailsScreenState extends State<ConsignmentDetailsScreen> {
  DestinationModel selectedDestination = destinations.first;
  TravelOrigin selectedOrigin = travelOrigins.first;
  TransportMode selectedTransport = transportModes.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppbar(title: "Consignment details"),
                2.height,
                Text(
                  "What do you want to insure?",
                  style: Textfontstyle.TextStyle14w400midgreyinter.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                2.height,
                const CustomTextField(
                  hintText: "Ex. Vehicles, trucks , equipment",
                  titleText: "Nature of Goods",
                ),
                2.height,
                Row(
                  children: [
                    const Expanded(
                      child: CustomTextField(
                        hintText: "10",
                        titleText: "Quantity",
                      ),
                    ),
                    2.width,
                    const Expanded(
                      child: CustomTextField(
                        hintText: "\$50,000",
                        titleText: "Value",
                      ),
                    ),
                  ],
                ),
                2.height,
                Text(
                  "Mode of transport ",
                  style: Textfontstyle.TextStyle14w400midgreyinter.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                0.5.height,
                CustomPrefixDropdown<TransportMode>(
                  value: selectedTransport,
                  items: transportModes,
                  onChanged: (value) {
                    setState(() {
                      selectedTransport = value!;
                    });
                  },
                  itemBuilder: (item) {
                    return Text(item.name);
                  },
                ),
                2.height,
                Text(
                  "Origin",
                  style: Textfontstyle.TextStyle14w400midgreyinter.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                0.5.height,
                CustomPrefixDropdown<TravelOrigin>(
                  value: selectedOrigin,
                  items: travelOrigins,
                  onChanged: (value) {
                    setState(() {
                      selectedOrigin = value!;
                    });
                  },
                  itemBuilder: (item) {
                    return Text(item.name);
                  },
                ),
                2.height,
                Text(
                  "Destination",
                  style: Textfontstyle.TextStyle14w400midgreyinter.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                0.5.height,
                CustomPrefixDropdown<DestinationModel>(
                  value: selectedDestination,
                  items: destinations,
                  onChanged: (value) {
                    setState(() {
                      selectedDestination = value!;
                    });
                  },
                  itemBuilder: (item) {
                    return Text(item.name);
                  },
                ),
                3.height,
                Text(
                  "Note",
                  style: Textfontstyle.TextStyle14w400midgreyinter.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                0.5.height,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.cBEBEBE, width: 1)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppSvgs.addNotes,
                          ),
                          2.width,
                          Text(
                            "Add Notes",
                            style: Textfontstyle.TextStyle14w400midgreyinter
                                .copyWith(
                              fontSize: 10.sp,
                              color: AppColors.cBEBEBE,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                6.height,
                CustomButton(
                  label: AppText.next,
                  onPressed: () {
                    AppCustomNavigator.push(
                        context, const SelectCurrencyWidget());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
