import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medica/shared/SharedWidget.dart';

class MamyCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            intro(context),
            CustomContainer(context,
              child: Column(children: [
                maintxt("maintxt".tr()),
                sectxt("sectxt".tr()),
                Text.rich(
                  TextSpan(
                    children: [
                      spointtxt("spointtxt.folic_acid".tr()),
                      ssectxt("ssectxt.folic_acid".tr()),
                      spointtxt('spointtxt.iron'.tr()),
                      ssectxt("ssectxt.iron".tr()),
                      spointtxt('spointtxt.calcium'.tr()),
                      ssectxt("ssectxt.calcium".tr()),
                      spointtxt('spointtxt.iodine'.tr()),
                      ssectxt("ssectxt.iodine".tr()),
                      spointtxt('spointtxt.choline'.tr()),
                      ssectxt("ssectxt.choline".tr()),
                      spointtxt('spointtxt.vitamin_a'.tr()),
                      ssectxt("ssectxt.vitamin_a".tr()),
                      spointtxt('spointtxt.vitamin_c'.tr()),
                      ssectxt("ssectxt.vitamin_c".tr()),
                      spointtxt('spointtxt.vitamin_d'.tr()),
                      ssectxt("ssectxt.vitamin_d".tr()),
                      spointtxt('spointtxt.vitamin_b6'.tr()),
                      ssectxt("ssectxt.vitamin_b6".tr()),
                      spointtxt('spointtxt.vitamin_b12'.tr()),
                      ssectxt("ssectxt.vitamin_b12".tr()),
                      spointtxt('spointtxt.dha'.tr()),
                      ssectxt("ssectxt.dha".tr()),
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  Container intro(context) {
    return CustomContainer(context,
        child: Column(
      children: [
        pointtxt("intro.pointtxt".tr()),
        sectxt("intro.sectxt".tr()),
      ],
    ));
  }
}

Text maintxt(txt) {
  return Text(
    txt,
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );
}

Text pointtxt(txt) {
  return Text(
    txt,
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );
}

Text sectxt(txt) {
  return Text(
    txt,
    style: TextStyle(fontSize: 18),
  );
}

TextSpan spointtxt(txt) {
  return TextSpan(
    text: txt,
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );
}

TextSpan ssectxt(txt) {
  return TextSpan(
    text: txt,
    style: TextStyle(fontSize: 18),
  );
}
