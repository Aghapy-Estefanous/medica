import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
class DetailsScreen extends StatelessWidget {
  final clinicData;
  DetailsScreen(this.clinicData, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    String title = 'clinics details';
    return Scaffold(
      appBar: MyAppBarWidget(context, title),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: MediaQuery.sizeOf(context).width * 0.92,
                child: Image.asset(
                  'assets/images/home-Images/baby.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(clinicData.name,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.group,
                        size: 20,
                        color: AppColor.primaryColor,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(clinicData.reservationCount.toString(),
                          style: const TextStyle(
                              fontSize: 18,
                              color: AppColor.orangcolor,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
              ],
            ),
            Text(
              clinicData.description == null ||
                      clinicData.description.toString().isEmpty
                  ? "thise is the discription of the place in floor2 room num :321"
                  : clinicData.description,
              style: TextStyle(
                color: Color.fromARGB(255, 133, 129, 129),
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.020),
              child: Container(
                height: height * .10,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    String day = allDaysOfWeek[index];
                    bool isWorkday = clinicData.workdays.contains(day);
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: isWorkday
                          ? avilableDayContainer(day)
                          : UnavilableDayContainer(day),
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
                  const Icon(
                    Iconsax.timer_start,
                    size: 20,
                    color: AppColor.orangcolor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                      "Start time : ${convertDateTime(clinicData.shifts[0].startTime)["time"]!}",
                      style: TextStyle(
                        color: Color.fromARGB(255, 133, 129, 129),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.020),
              child: Row(
                children: [
                  const Icon(
                    Iconsax.timer_pause,
                    size: 20,
                    color: AppColor.orangcolor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                      "End time :${convertDateTime(clinicData.shifts[0].endTime)["time"]!}",
                      style: TextStyle(
                        color: Color.fromARGB(255, 133, 129, 129),
                      )),
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.orangcolor,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  height: 55, // MediaQuery.sizeOf(context).height * 0.09,
                  width: MediaQuery.sizeOf(context).width * 0.93,
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
                              //  weight: 20,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'price',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Text(clinicData.price.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
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

  Container avilableDayContainer(String day) {
    return Container(
        decoration: const BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        height: 80,
        width: 75,
        child: Center(
            child: Text(
          day,
          style: TextStyle(color: AppColor.whiteColor, fontSize: 12),
        )));
  }

  Container UnavilableDayContainer(String day) {
    return Container(
        decoration: const BoxDecoration(
            color: AppColor.whiteColor,
            border: Border(
                top: BorderSide(color: AppColor.orangcolor, width: 1.2),
                left: BorderSide(color: AppColor.orangcolor, width: 1.2),
                bottom: BorderSide(color: AppColor.orangcolor, width: 1.2),
                right: BorderSide(color: AppColor.orangcolor, width: 1.2)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        height: 80,
        width: 75,
        child: Center(
            child: Text(
          day,
          style: TextStyle(color: AppColor.orangcolor, fontSize: 12),
        )));
  }
}

List<String> allDaysOfWeek = [
  "Saturday",
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
];
