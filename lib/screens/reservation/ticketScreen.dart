// import 'package:flutter/material.dart';
// import 'package:medica/shared/styles/AppColor.dart';

// class TicketScreen extends StatelessWidget {
//   const TicketScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // backgroundColor: AppColor.primaryColor,
//         body: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   List x = [1, 2, 3, 4];
//                   return Padding(
//                     padding: const EdgeInsets.all(6.0),
//                     child: Container(
//                       height: 260,
//                       width: MediaQuery.sizeOf(context).width * .90,
//                       decoration: BoxDecoration(
//                           color: Colors
//                               .white, // Color.fromARGB(242, 208, 236, 233),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color.fromARGB(255, 174, 172, 172)
//                                   .withOpacity(0.5),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: const Offset(0, 3),
//                             ),
//                           ],
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Divider(
//                               color: Colors.grey,
//                             ),
//                             myContianerTitleText("Name :", context),
//                             Text(
//                               "Ahmed hussien  ali ali ali ali ali ",
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 16),
//                             ),
//                             myContianerTitleText("waiting list :", context),

//                             Text(
//                               " 6677 person",
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 16),
//                             ),
//                             // //clinic
//                             // Divider(
//                             //   color: Colors.grey,
//                             // ),
//                             myContianerTitleText("Clinic Name :", context),
//                             Text(
//                               " dentist clinicdentist clinicdentist clinic",
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 16),
//                             ),
//                             Divider(
//                               color: Colors.grey,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 // ElevatedButton(
//                                 //   onPressed: () {
//                                 //     //      showDialogDetailsOrder(context, index,l);
//                                 //   },
//                                 //   style: ElevatedButton.styleFrom(
//                                 //     backgroundColor: AppColor.primaryColor,
//                                 //   ),
//                                 //   child: const Text(
//                                 //     'Show ',
//                                 //     style: TextStyle(
//                                 //       color: Colors.white,
//                                 //     ),
//                                 //   ),
//                                 // ),
//                                 // const SizedBox(
//                                 //   width: 20,
//                                 // ),
//                                 // ElevatedButton(
//                                 //   onPressed: () {},
//                                 //   style: ElevatedButton.styleFrom(
//                                 //     backgroundColor: AppColor.primaryColor,
//                                 //   ),
//                                 //   child: const Text(
//                                 //     ' Delete ',
//                                 //     style: TextStyle(
//                                 //       color: Colors.white,
//                                 //     ),
//                                 //   ),
//                                 // )
//                                 Container(
//                                   height: 22,
//                                   decoration: BoxDecoration(
//                                       color: Color.fromARGB(255, 242, 223, 166),
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(20),
//                                       )),
//                                   child: TextButton(
//                                       onPressed: () {},
//                                       child: Text(
//                                         '123 \$',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .labelLarge!
//                                             .copyWith(
//                                                 color: AppColor.orangcolor),
//                                       )),
//                                 ),

//                                 Container(
//                                   height: 22,
//                                   decoration: BoxDecoration(
//                                       color: AppColor.orangcolor,
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(20),
//                                       )),
//                                   child: TextButton(
//                                       onPressed: () {
//                                         showDialogDetailsOrder(
//                                             context, index, x);
//                                       },
//                                       child: Text(
//                                         'Details',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .labelLarge!
//                                             .copyWith(
//                                                 color: AppColor.whiteColor),
//                                       )),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: 10),
//           )
//         ],
//       ),
//     )
//         // Expanded(child:

//         );
//   }

//   Container myContianerTitleText(String TitleName, BuildContext context) {
//     return Container(
//       height: 20,
//       decoration: const BoxDecoration(
//           color: Color.fromARGB(255, 193, 225, 238),
//           borderRadius: BorderRadius.all(
//             Radius.circular(20),
//           )),
//       child: TextButton(
//           onPressed: () {},
//           child: Text(
//             '${TitleName}',
//             style: Theme.of(context).textTheme.labelLarge!.copyWith(
//                   color: AppColor.primaryColor,
//                 ),
//           )),
//     );
//   }
// }

// void showDialogDetailsOrder(BuildContext context, int index, List TicketList) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//     //  var ticket = TicketList[index];
//       return AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         backgroundColor: const Color.fromARGB(255, 239, 119, 119),
//         title: const Text(
//           "تفاصيل الطلب",
//           style: TextStyle(color: Colors.white),
//         ),
//         content:TicketWidget
//         (
          
//                   width: 250, //MediaQuery.of(context).size.width * 0.9,
//                   height: 400, //MediaQuery.of(context).size.height * 0.9,
//                   isCornerRounded: true,
//                   padding: EdgeInsets.all(20),
//                   shadow: [BoxShadow()],
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Name',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       ),
//                       Text('User Name'),
//                       Divider(),
//                       Text(
//                         'NID',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       ),
//                       Text('12345678901234'),
//                       Divider(),
//                       Text(
//                         'Clinic Name',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       ),
//                       Text('Ay haga'),
//                       Divider(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 'num in waiting list',
//                                 style: Theme.of(context).textTheme.bodySmall,
//                               ),
//                               Text(
//                                 '15',
//                                 style: Theme.of(context).textTheme.bodyLarge,
//                               ),
//                             ],
//                           ),
//                           // Spacer(),
//                           Column(
//                             children: [
//                               Text(
//                                 'Address',
//                                 style: Theme.of(context).textTheme.bodySmall,
//                               ),
//                               Text('Cairo ,Egypt'),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Divider(),
//                       Row(
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 'Date',
//                                 style: Theme.of(context).textTheme.bodySmall,
//                               ),
//                               Text('1/1/1111'),
//                             ],
//                           ),
//                           Spacer(),
//                           Column(
//                             children: [
//                               Text(
//                                 'price',
//                                 style: Theme.of(context).textTheme.bodySmall,
//                               ),
//                               Text(
//                                 '100 EGP',
//                                 style: Theme.of(context).textTheme.bodyLarge,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Divider(),
//                       Image(
//                         image:
//                             AssetImage('assets/images/home-Images/Barcode.png'),
//                       ),
//                     ],
//                   )),
      
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
