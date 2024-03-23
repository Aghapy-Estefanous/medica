import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:medica/shared/styles/AppColor.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(listener: (context, state) {
      if (state is ReservationSuccessState) {}
    }, builder: (context, state) {
      return State is ReservationLoadingState
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              // backgroundColor: AppColor.primaryColor,
              body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.36,
                              width: MediaQuery.sizeOf(context).width * .90,
                              decoration: BoxDecoration(
                                  color: Colors
                                      .white, // Color.fromARGB(242, 208, 236, 233),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 174, 172, 172)
                                          .withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Divider(
                                      color: Colors.grey,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_month,
                                              size: 23,
                                            ),
                                            Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.038,
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 233, 206, 232),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(4),
                                                  )),
                                              child: Text(
                                                '${convertDateTime(cubit.myReservationsList?[index].time)['date']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!
                                                    .copyWith(
                                                        color: AppColor.bink,
                                                        fontSize: 13),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.timer_outlined,
                                              size: 22,
                                              weight: 30,
                                            ),
                                            Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.037,
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      157,
                                                      141,
                                                      192,
                                                      240), // Color.fromARGB( 255, 233, 206, 232),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(4),
                                                  )),
                                              child: Text(
                                                '${convertDateTime(cubit.myReservationsList?[index].time)['time']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!
                                                    .copyWith(
                                                        color: AppColor
                                                            .primaryColor,
                                                        fontSize: 13),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    myContianerTitleText("Name :", context),
                                    Text(
                                      "${cubit.myReservationsList?[index].firstname} ${cubit.myReservationsList?[index].lastname} ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    myContianerTitleText(
                                        "Clinic Name :", context),
                                    Text(
                                      " ${cubit.myReservationsList?[index].placeName}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.group_add_outlined,
                                              size: 22,
                                              weight: 30,
                                              color: AppColor.orangcolor,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.015,
                                            ),
                                            Text(
                                              '${cubit.myReservationsList?[index].waiting} ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge!
                                                  .copyWith(),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.041,
                                          decoration: BoxDecoration(
                                              color: AppColor.orangcolor,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(12),
                                              )),
                                          child: TextButton(
                                              onPressed: () {
                                                showDialogDetailsOrder(
                                                    context,
                                                    index,
                                                    cubit.myReservationsList);
                                              },
                                              child: Text(
                                                'Details',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!
                                                    .copyWith(
                                                        color: AppColor
                                                            .whiteColor),
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: cubit.myReservationsList?.length),
                  )
                ],
              ),
            )
              // Expanded(child:

              );
    });
  }

  Container myContianerTitleText(String TitleName, BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.038,
      decoration: const BoxDecoration(
          color: Color.fromARGB(
              100, 208, 206, 206), // Color.fromARGB(255, 193, 225, 238),
          borderRadius: BorderRadius.all(
            Radius.circular(3),
          )),
      child: TextButton(
          onPressed: () {},
          child: Text(
            '${TitleName}',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                ),
          )),
    );
  }
}

void showDialogDetailsOrder(BuildContext context, int index, TicketList) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      //  var ticket = TicketList[index];
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          "Ticket details",
          style: TextStyle(color: Colors.white),
        ),
        content: TicketWidget(
            width: double.infinity,
            height: 450,
            isCornerRounded: true,
            padding: EdgeInsets.all(20),
            //shadow: [BoxShadow()],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Name',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text('User Name'),
                Divider(),
                Text(
                  'NID',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text('12345678901234'),
                Divider(),
                Text(
                  'Clinic Name',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text('Ay haga'),
                Divider(),
                Column(
                  children: [
                    Text(
                      'num in waiting list',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '15',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Divider(),
                Column(
                  children: [
                    Text(
                      'Address',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text('Cairo ,Egypt'),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Date',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text('1/1/1111'),
                      ],
                    ),
                    // Spacer(),
                    Column(
                      children: [
                        Text(
                          'price',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          '100 EGP',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
                Image(
                  image: AssetImage('assets/images/home-Images/Barcode.png'),
                ),
              ],
            )),
      );
    },
  );
}

class itemInCard extends StatelessWidget {
  itemInCard({
    required this.text,
    this.color,
    super.key,
  });
  String? text;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "no info",
      textAlign: TextAlign.right,
      style: TextStyle(color: color, fontSize: 16),
    );
  }
}

Map<String, String> convertDateTime(String? dateTimeString) {
  // String dateTimeString = "2024-03-16T22:23:23.9849549";

  DateTime dateTime = DateTime.parse(dateTimeString!);

  // Format time in 12-hour format (e.g., "12:22pm")
  String formattedTime = DateFormat.jm().format(dateTime);

  // Format date (e.g., "16/3/2024")
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return {'date': formattedDate, 'time': formattedTime};
}
