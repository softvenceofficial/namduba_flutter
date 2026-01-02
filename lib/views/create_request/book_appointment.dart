import 'package:nanduba/export.dart';
import 'package:nanduba/views/create_request/payment_methods/choose_payment_methods.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  int? selectedHour=9;
  String selectedTime='AM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: const CustomAppbar(
                title: AppText.bookAppointment,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select a Date',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      2.height,
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.shadow,
                                spreadRadius: 2,
                                blurRadius: 10,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          child: TableCalendar(
                            availableGestures: AvailableGestures.none,
                            daysOfWeekHeight: 2.h,
                            daysOfWeekStyle: DaysOfWeekStyle(
                                weekdayStyle: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 1.5.h),
                                weekendStyle: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 1.5.h)),
                            headerStyle: HeaderStyle(
                                titleCentered: true,
                                titleTextFormatter: (date, locale) =>
                                    DateFormat.yMMMM(locale).format(date),
                                formatButtonVisible: false,
                                titleTextStyle: TextStyle(
                                    fontSize: 12.sp, fontWeight: FontWeight.w600)),
                            firstDay: DateTime.now(),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: selectedDate,
                            calendarStyle: const CalendarStyle(
                              outsideDaysVisible: false,
                              selectedDecoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            selectedDayPredicate: (day) {
                              return isSameDay(selectedDate, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                selectedDate = selectedDay;
                              });
                            },
                          ),
                        ),
                      ),
                      3.height,
                      Text(
                        'Select a Time',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 9; i <= 19; i++) ...{
                              TimeContainer(
                                onTap: () {
                                  setState(() {
                                    selectedHour = i;
                                    selectedTime= selectedHour!<12?'AM':'PM';
                                  });
                                },
                                text: i < 12
                                    ? '${i == 0 ? 12 : i}:00 AM'
                                    : '${i == 12 ? 12 : i % 12}:00 PM',
                                containerColor: selectedHour == i
                                    ? AppColors.primary
                                    : AppColors.white,
                                textColor: selectedHour == i
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                            }
                          ],
                        ),
                      ),
                      Container(
                        width:  double.maxFinite,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical:  1.h, horizontal:  2.w),
                
                        decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(12.sp)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Your appointment on ${DateFormat('EEEE').format(selectedDate)},\n${DateFormat('MMMM d').format(selectedDate)} at ${selectedHour}:00 ${selectedTime}. ",
                              style: Theme.of(context)!.textTheme.bodyMedium!.copyWith(
                                fontSize: 11.sp,
                                color: AppColors.textColor2,
                                fontWeight: FontWeight.w500,

                            ),textAlign: TextAlign.center,),

                          ],
                        ),
                
                      ),
                      5.height,
                      CustomButton(
                        label:"Confirm",
                        onPressed: () {
                          AppCustomNavigator.push(context,ChoosePaymentMethods());
                        },
                      ),
                      2.height,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeContainer extends StatelessWidget {
  const TimeContainer({
    super.key,
    required this.text,
    required this.containerColor,
    required this.textColor,
    required this.onTap,
  });
  final String text;
  final Color containerColor;
  final Color textColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.h),
        height: 6.5.h,
        width: 30.w,
        decoration: BoxDecoration(
          color: containerColor,
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
