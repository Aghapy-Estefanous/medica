import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:mdi/mdi.dart';

class Gender {
  final String name;
  final IconData icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}

class GenderSelector extends StatelessWidget {
  TextEditingController? gender;
  GenderSelector(this.gender);
  @override
  Widget build(BuildContext context) {
    List<Gender> genders = [
      Gender("Male".tr(), Iconsax.man, false),
      Gender("Female".tr(), Iconsax.woman, false),
      // Gender("Others", Iconsax.omega_circle, false),
    ];

    return Container(
      height: 120, // Provide a fixed height here
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genders.length,
          itemBuilder: (context, index) {
            return InkWell(
              // splashColor: Colors.pinkAccent,
              onTap: () {
                // Update the selected gender
                gender?.text = genders[index].name;
                for (int i = 0; i < genders.length; i++) {
                  genders[i].isSelected = (i == index);
                }
                // Trigger a rebuild to reflect the changes
                // in the UI
                // ignore: invalid_use_of_protected_member
                (context as Element).markNeedsBuild();
              },
              child: CustomRadio(gender: genders[index]),
            );
          },
        ),
      ),
    );
  }
}

class CustomRadio extends StatelessWidget {
  final Gender gender;

  const CustomRadio({required this.gender});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: gender.isSelected ? Colors.grey[600] : Colors.white,
      child: Container(
        height: 80,
        width: 80,
        alignment: Alignment.center,
        margin: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              gender.icon,
              color: gender.isSelected ? Colors.white : Colors.grey,
              size: 40,
            ),
            SizedBox(height: 10),
            Text(
              gender.name,
              style: TextStyle(
                color: gender.isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
