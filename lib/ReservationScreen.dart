import 'package:flutter/material.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:ticket_widget/ticket_widget.dart';

class ReservScreen extends StatelessWidget {
  const ReservScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.primaryColor,
        child: Stack(
          children: [
            Center(
              child: TicketWidget(
                  width: 250, //MediaQuery.of(context).size.width * 0.9,
                  height: 400, //MediaQuery.of(context).size.height * 0.9,
                  isCornerRounded: true,
                  padding: EdgeInsets.all(20),
                  shadow: [BoxShadow()],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
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
                          // Spacer(),
                          Column(
                            children: [
                              Text(
                                'Address',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text('Cairo ,Egypt'),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
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
                          Spacer(),
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
                        image:
                            AssetImage('assets/images/home-Images/Barcode.png'),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
