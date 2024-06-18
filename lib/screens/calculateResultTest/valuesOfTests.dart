import 'package:flutter/material.dart';
import 'package:medica/shared/styles/AppColor.dart';

class CalculateTestVitResultScreen extends StatefulWidget {
  const CalculateTestVitResultScreen({Key? key}) : super(key: key);

  @override
  _CalculateTestVitResultScreenState createState() =>
      _CalculateTestVitResultScreenState();
}

TextEditingController _valuecontroller = TextEditingController();
final _formKey = GlobalKey<FormState>();
String? selectedGender;
String? selectedTestName;
String? resultMessage;

class _CalculateTestVitResultScreenState
    extends State<CalculateTestVitResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculate result of tests"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/backgrounds/calculate.png",
                height: 200,
                width: 200,
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(
                        215, 2, 78, 154), // Change the color here as needed
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            /// Drop list
                            DropdownButtonFormField<String>(
                              value: selectedTestName,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedTestName = newValue;
                                });
                              },
                              validator: (String? value) {
                                if (value == null) {
                                  return 'Please choose a test';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Test Name',
                              ),
                              items: vitaminsList2.map((test) {
                                return DropdownMenuItem<String>(
                                  value: test['name'],
                                  child: Text(test['name'].toString()),
                                );
                              }).toList(),
                            ),

                            SizedBox(height: 10),

                            /// Value of results
                            TextFormField(
                              controller: _valuecontroller,
                              decoration: const InputDecoration(
                                  labelText: 'Value of Test Result'),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter value of test result';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Please enter a valid number';
                                }
                                return null;
                              },
                            ),

                            /// Gender
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RadioListTile<String>(
                                  title: Text('Woman'),
                                  value: 'woman',
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: Text('Man'),
                                  value: 'man',
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: Text('Child'),
                                  value: 'child',
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value;
                                    });
                                  },
                                ),
                              ],
                            ),

                            /// Submit and Reset buttons
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      calculateResult();
                                      print("add yours${resultMessage}");
                                    }
                                  },
                                  child: Text('Calculate'),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    _formKey.currentState!.reset();
                                    setState(() {
                                     setState(() {
                                      selectedTestName = null;
                                      selectedGender = null;
                                      resultMessage = null;
                                    }); });
                                  },
                                  child: Text('Reset'),
                                ),
                              ],
                            ),

                            SizedBox(height: 10),

                            /// Display result message
                            if (resultMessage != null)
                              if (resultMessage == "0")
                                Text(
                                  "Result is not normal",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            if (resultMessage == "1")
                              Text(
                                "Result is  normal",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (resultMessage == "-1")
                              Text(
                                "Normal range not found for the selected gender",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateResult() {
    double enteredValue = double.parse(_valuecontroller.text);

    // Find the selected test in vitaminsList2
    var selectedTest =
        vitaminsList2.firstWhere((test) => test['name'] == selectedTestName);

    // Get the normal value range based on selected gender
    var normalRange = selectedTest['normalValues'][selectedGender];

    if (normalRange != null) {
      var normalRangeParts = normalRange.split(' - ');

      double minNormalValue = double.parse(normalRangeParts[0]);
      double maxNormalValue = double.parse(normalRangeParts[1]);
      print(
          "add yours${minNormalValue} ${maxNormalValue} enterd =${enteredValue}");
      print(enteredValue >= minNormalValue && enteredValue <= maxNormalValue);
      if (enteredValue >= minNormalValue && enteredValue <= maxNormalValue) {
        setState(() {
          resultMessage = "1";
        });
      } else {
        setState(() {
          resultMessage = '0';
        });
      }
    }
  }
}

List<Map<String, dynamic>> vitaminsList2 = [
  {
    'name': "Vitamin B12",
    "normalValues": {
      "woman": "106 - 638",
      "man": "106 - 638",
      "child": "106 - 638",
    }
  },
  {
    'name': "Vitamin B1",
    "normalValues": {
      "woman": "74.0 - 222.0",
      "man": "74.0 - 222.0",
      "child": "74.0 - 222.0",
    }
  },
  {
    'name': "Vitamin E",
    "normalValues": {
      "woman": "5.5 - 17.0",
      "man": "5.5 - 17.0",
      "child": "3.0 - 18.4",
    }
  },
  {
    'name': "Vitamin C",
    "normalValues": {
      "woman": "0.2 - 0.4",
      "man": "0.2 - 0.4",
      "child": "0.2 - 0.4",
    }
  },
  {
    'name': "Vitamin A",
    "normalValues": {
      "woman": "18.9 - 62",
      "man": "18.9 - 62",
      "child": "18.9 - 62",
    }
  },
  {
    'name': "Vitamin D",
    "normalValues": {
      "woman": "20 - 50",
      "man": "20 - 50",
      "child": "20 - 50",
    }
  },
  {
    'name': "Vitamin K",
    "normalValues": {
      "woman": "20 - 50",
      "man": "20 - 50",
      "child": "20 - 50",
    }
  },
  {
    'name': "Vitamin B3",
    "normalValues": {
      "woman": "0.5 - 8.45",
      "man": "0.5 - 8.45",
      "child": "0.5 - 8.45",
    }
  },
  {
    'name': "Serum iron test",
    "normalValues": {
      "woman": "50 - 170",
      "man": "70 - 175",
      "child": "50 - 120",
    }
  },
];
