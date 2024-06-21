import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/models/reservationModel.dart';
import 'package:medica/screens/%E2%9C%85connections.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is AppNoInternetState
              ? NoInternetScreen(onRetry: () {
                  cubit.retryAllApiCalls();
                })
              : State is ReservationLoadingState
                  ? Center(child: CircularProgressIndicator())
                  : Scaffold(
                      appBar: MyAppBarWidget(context, "Your reservations"),
                      body: cubit.myReservationsList!.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                  child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Image.asset(
                                        'assets/images/backgrounds/emptydata.png'),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "There is no reservations just now!",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              )),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.33,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  .90,
                                              decoration: BoxDecoration(
                                                  color: Colors
                                                      .white, // Color.fromARGB(242, 208, 236, 233),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          const Color.fromARGB(
                                                                  255,
                                                                  174,
                                                                  172,
                                                                  172)
                                                              .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset:
                                                          const Offset(0, 3),
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Divider(
                                                      color: Colors.grey,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .calendar_month,
                                                              size: 23,
                                                            ),
                                                            Container(
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.034,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          233,
                                                                          206,
                                                                          232),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                        Radius.circular(
                                                                            4),
                                                                      )),
                                                              child: Center(
                                                                child: Text(
                                                                  '${convertDateTime(cubit.myReservationsList?[index].time)['date']}',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .labelLarge!
                                                                      .copyWith(
                                                                          color: AppColor
                                                                              .bink,
                                                                          fontSize:
                                                                              14),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .timer_outlined,
                                                              size: 22,
                                                              weight: 30,
                                                            ),
                                                            Container(
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.034,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                      color: Color.fromARGB(
                                                                          157,
                                                                          141,
                                                                          192,
                                                                          240), // Color.fromARGB( 255, 233, 206, 232),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                        Radius.circular(
                                                                            4),
                                                                      )),
                                                              child: Center(
                                                                child: Text(
                                                                  '${convertDateTime(cubit.myReservationsList?[index].time)['time']}',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .labelLarge!
                                                                      .copyWith(
                                                                          color: AppColor
                                                                              .primaryColor,
                                                                          fontSize:
                                                                              14),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.020,
                                                    ),
                                                    myContianerTitleText(
                                                        "Name :", context),
                                                    SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.010,
                                                    ),
                                                    Text(
                                                      "${cubit.myReservationsList?[index].firstname} ${cubit.myReservationsList?[index].lastname} ",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16),
                                                    ),
                                                    SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.010,
                                                    ),
                                                    myContianerTitleText(
                                                        "Clinic Name :",
                                                        context),
                                                    SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.010,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        " ${cubit.myReservationsList?[index].placeName}",
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .group_add_outlined,
                                                              size: 22,
                                                              weight: 30,
                                                              color: AppColor
                                                                  .orangcolor,
                                                            ),
                                                            SizedBox(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.015,
                                                            ),
                                                            Text(
                                                              '${cubit.myReservationsList?[index].waiting} ',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelLarge!
                                                                  .copyWith(),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.041,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: AppColor
                                                                      .orangcolor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            12),
                                                                  )),
                                                          child: TextButton(
                                                              onPressed: () {
                                                                showDialogDetailsOrder(
                                                                    context,
                                                                    index,
                                                                    cubit.myReservationsList?[
                                                                        index]);
                                                              },
                                                              child: Text(
                                                                'Details',
                                                                style: Theme.of(
                                                                        context)
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
                                        itemCount:
                                            cubit.myReservationsList?.length),
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
      child: Center(
        child: Text(
          '${TitleName}',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.black,
                fontSize: 14,
              ),
        ),
      ),
    );
  }
}

void showDialogDetailsOrder(
    BuildContext context, int index, DataUserReservation? ticketmodel) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      //print(ticket);
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Name',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text('${ticketmodel?.firstname} ${ticketmodel?.lastname}'),
                  Divider(),
                  Text(
                    'NID',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text('${ticketmodel?.nid}'),
                  Divider(),
                  Text(
                    'Clinic Name',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text('${ticketmodel?.placeName}'),
                  Divider(),
                  Column(
                    children: [
                      Text(
                        'num in waiting list',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        '${ticketmodel?.waiting}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Divider(),
                  // Column(
                  //   children: [
                  //     Text(
                  //       'Address',
                  //       style: Theme.of(context).textTheme.bodySmall,
                  //     ),
                  //     Text('Cairo ,Egypt'),
                  //   ],
                  // ),
                  // Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Date',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text('${convertDateTime(ticketmodel?.time)['date']}'),
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
                            '${ticketmodel?.price}',
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
              ),
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
