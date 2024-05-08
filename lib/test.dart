// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<void> fetchData() async {
//   final username = "11174179"; // Your username
//   final password = "60-dayfreetrial"; // Your password

//   // Encode the credentials for Basic Authentication
//   final basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

//   final url =
//       'http://youssifasaad-001-site1.ltempurl.com/api/Department/All-Departments'; // Replace with your endpoint

//   // Send the GET request with the Basic Authentication header
//   final response = await http.get(
//     Uri.parse(url),
//     headers: {
//       'Authorization': basicAuth,
//     },
//   );

//   if (response.statusCode == 200) {
//     print('Success!');
//     print(response.body); // Display the response body
//   } else {
//     print('Error: ${response.statusCode}');
//     print(response.body); // Check error details
//   }
// }

// void main() {
//   fetchData(); // Call the function to fetch data
// }
