// import 'package:flutter/material.dart';

// class VitaminDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> vitamin;

//   VitaminDetailScreen({required this.vitamin});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(vitamin['name']),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//         children: [
          
//           ],
//         ),
//       ),
//     );
//   }
// }

// class VitaminValueChecker extends StatefulWidget {
//   final Map<String, dynamic> vitamin;

//   VitaminValueChecker({required this.vitamin});

//   @override
//   _VitaminValueCheckerState createState() => _VitaminValueCheckerState();
// }

// class _VitaminValueCheckerState extends State<VitaminValueChecker> {
//   final _formKey = GlobalKey<FormState>();
//   final _valueController = TextEditingController();
//   String _selectedGender = 'child';

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             controller: _valueController,
//             decoration: InputDecoration(labelText: 'Enter value'),
//             keyboardType: TextInputType.number,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter a value';
//               }
//               return null;
//             },
//           ),
//           SizedBox(height: 16.0),
//           DropdownButtonFormField<String>(
//             value: _selectedGender,
//             items: ['child', 'woman', 'man'].map((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//             onChanged: (newValue) {
//               setState(() {
//                 _selectedGender = newValue!;
//               });
//             },
//             decoration: InputDecoration(labelText: 'Select gender'),
//           ),
//           SizedBox(height: 16.0),
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 _checkValue();
//               }
//             },
//             child: Text('Check Value'),
//           ),
//           SizedBox(height: 16.0),
//         ],
//       ),
//     );
//   }

//   void _checkValue() {
//     double value = double.parse(_valueController.text);
//     List<String> range = widget.vitamin['normal_values'][_selectedGender].split(' − ');
//     double min = double.parse(range[0]);
//     double max = double.parse(range[1]);

//     String result;
//     if (value < min) {
//       result = 'The value is below normal.';
//     } else if (value > max) {
//       result = 'The value is above normal.';
//     } else {
//       result = 'The value is within the normal range.';
//     }

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           content: Text(result),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }