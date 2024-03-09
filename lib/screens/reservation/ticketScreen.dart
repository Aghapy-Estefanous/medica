// import 'package:flutter/material.dart';
// import 'package:medica/shared/styles/AppColor.dart';

// var l=[{
//  "orderId":22,

// }];


// class TicketScreen extends StatelessWidget {
//   const TicketScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(children: [
//           Container(
//             decoration: const BoxDecoration(
//                 color: Color.fromARGB(177, 50, 173, 218),
//                 borderRadius: BorderRadius.all(Radius.circular(13))),
//             height: 300,
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
               
//                 Expanded(
//                   child: ListView.builder(
//                           physics: const BouncingScrollPhysics(),
//                           itemBuilder: (context, index) {
//                             var Ticket =l[index];
//                             return Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               child: Container(
//                                 height: 280,
//                                 // width: MediaQuery.sizeOf(context).width * .75,
//                                 decoration: BoxDecoration(
//                     color: Colors.white, // Color.fromARGB(242, 208, 236, 233),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color.fromARGB(255, 174, 172, 172)
//                             .withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(15)),
//                                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       itemInCard(
//                         text: 'رقم الطلب : # ${Ticket.orderId}',
//                       ),
//                       Divider(
//                         color: Colors.grey,
//                       ),
//                       itemInCard(
//                         text: 'اسم الخدمة : ${Ticket.orderName}',
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       itemInCard(
//                         text: 'معاد الطلب : ${Ticket.orderDate} ',
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       itemInCard(
//                         text: 'طريقة الدفع : الدفع كاش ',
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Divider(
//                         color: Colors.grey,
//                       ),
//                       Row(
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {
//                               showDialogDetailsOrder(context, index,l);
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColor.primaryColor,
//                             ),
//                             child: const Text(
//                               'التفاصيل ',
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColor.primaryColor,
//                             ),
//                             child: const Text(
//                               ' حذف ',
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                           itemCount: l.length),
//                 )
//               ],
//             ),
//           )
//           // Expanded(child:
//           // ListView.builder(itemBuilder: (context,index)=>Container()))
//         ]),
//       ),
//     );
//   }
// }

// void showDialogDetailsOrder(BuildContext context, int index, List TicketList) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       var ticket = TicketList[index];
//       return AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         backgroundColor: const Color.fromARGB(255, 239, 119, 119),
//         title: const Text(
//           "تفاصيل الطلب",
//           style: TextStyle(color: Colors.white),
//         ),
//         content: Padding(
//           padding: const EdgeInsets.all(6.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   width: 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Expanded(
//                       child: itemInCard(
//                         text: "national id:  ${ticket.userNId} ",
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Divider(
//                   color: AppColor.dividerColor,
//                 ),
//                 itemInCard(
//                   text: 'user name:  ${ticket.userName}',
//                   color: Colors.white,
//                 ),
//                 Divider(
//                   color: AppColor.dividerColor,
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 itemInCard(
//                   text: 'number of patiens Before you: ${ticket.waitingList}',
//                   color: Colors.white,
//                 ),
//                 Divider(
//                   color: AppColor.dividerColor,
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 itemInCard(
//                   text: 'Clinic name: ${ticket.Clinicname}',
//                   color: Colors.white,
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Divider(
//                   color: AppColor.dividerColor,
//                 ),
//                 itemInCard(
//                    text: 'price: ${ticket.price}',
               
//                   color: Colors.white,
//                 ),
//                 Divider(
//                   color: AppColor.dividerColor,
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 itemInCard(
//                   text: ' TicketDate :  ${ticket.TicketDate} ',
//                   color: Colors.white,
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Divider(
//                   color: AppColor.dividerColor,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 5,
//                     ),
                 
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//         actions: <Widget>[
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColor.bink,
//             ),
//             child: const Text(
//               "الغاء",
//               style: TextStyle(),
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

// class itemInCard extends StatelessWidget {
//   itemInCard({
//     required this.text,
//     this.color,
//     super.key,
//   });
//   String? text;
//   Color? color;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text ?? "no info",
//       textAlign: TextAlign.right,
//       style: TextStyle(color: color, fontSize: 16),
//     );
//   }
// }
