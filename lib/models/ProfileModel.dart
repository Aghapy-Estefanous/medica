import 'package:flutter/material.dart';

class ProfileModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? nid;
  int? age;
  ProfileModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.nid,
      required this.age});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    nid = json['nid'];
    age = json['age'];
  }
}

// class Gender {
//   String name;
//   IconData icon;
//   bool isSelected;

//   Gender(this.name, this.icon, this.isSelected);
// }
