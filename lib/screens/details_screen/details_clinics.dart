import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:easy_localization/easy_localization.dart';

class DetailsScreen extends StatelessWidget {
  final clinicData;
  DetailsScreen(this.clinicData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    String title = 'clinics_details'.tr(); // Localized title

    return Scaffold(
      appBar: MyAppBarWidget(context, title),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.92,
                child: Image.asset(
                  'assets/images/home-Images/baby.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  clinicData.name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.group,
                        size: 20,
                        color: AppColor.primaryColor,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        clinicData.reservationCount.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.orangcolor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              clinicData.description == null || clinicData.description.isEmpty
                  ? 'description_placeholder'.tr()
                  : clinicData.description,
              style: TextStyle(
                color: Color.fromARGB(255, 133, 129, 129),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                availabilityIndicator(true), // Available
                SizedBox(width: 10),
                availabilityIndicator(false), // Unavailable
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.020),
              child: Container(
                height: height * .10,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    context.locale.toString() == "en"
                        ? allDaysOfWeekan[index]
                        : allDaysOfWeekar[index];
                    /////////////////////
                    String day = allDaysOfWeekan[index];
                    bool isWorkday = clinicData.workdays.contains(day);
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: isWorkday
                          ? availableDayContainer(
                              context.locale.toString() == "en"
                                  ? allDaysOfWeekan[index]
                                  : allDaysOfWeekar[index])
                          : unavailableDayContainer(
                              context.locale.toString() == "en"
                                  ? allDaysOfWeekan[index]
                                  : allDaysOfWeekar[index]),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.020),
              child: Row(
                children: [
                  Icon(
                    Iconsax.timer_start,
                    size: 20,
                    color: AppColor.orangcolor,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'start_time'.tr() +
                        '${convertDateTime(clinicData.shifts[0].startTime)["time"]!}',
                    style: TextStyle(
                      color: Color.fromARGB(255, 133, 129, 129),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.020),
              child: Row(
                children: [
                  Icon(
                    Iconsax.timer_pause,
                    size: 20,
                    color: AppColor.orangcolor,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'end_time'.tr() +
                        '${convertDateTime(clinicData.shifts[0].endTime)["time"]!}',
                    style: TextStyle(
                      color: Color.fromARGB(255, 133, 129, 129),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.orangcolor,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.93,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Iconsax.ticket,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'price'.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          clinicData.price.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget availabilityIndicator(bool available) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: available ? AppColor.primaryColor : AppColor.orangcolor,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 5),
        Text(
          available ? 'available'.tr() : 'unavailable'.tr(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Container availableDayContainer(String day) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      height: 80,
      width: 75,
      child: Center(
        child: Text(
          day,
          style: TextStyle(color: AppColor.whiteColor, fontSize: 12),
        ),
      ),
    );
  }

  Container unavailableDayContainer(String day) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        border: Border.all(color: AppColor.orangcolor, width: 1.2),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      height: 80,
      width: 75,
      child: Center(
        child: Text(
          day,
          style: TextStyle(color: AppColor.orangcolor, fontSize: 12),
        ),
      ),
    );
  }
}

List<String> allDaysOfWeekan = [
  "Saturday",
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
];
List<String> allDaysOfWeekar = [
  "السبت",
  "الأحد",
  "الاثنين",
  "الثلاثاء",
  "الأربعاء",
  "الخميس",
  " الجمعة"
];
