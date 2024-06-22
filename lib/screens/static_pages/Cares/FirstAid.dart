import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:medica/screens/static_pages/testing/cubit/tests_cubit.dart';
// import 'package:medica/shared/styles/AppColor.dart';

class FirstAid extends StatelessWidget {
  const FirstAid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TestsCubit cubit = TestsCubit.get(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: index == 0
                ? first()
                : index == 1
                    ? second()
                    : index == 2
                        ? third()
                        : index == 3
                            ? fourth()
                            : fifth(),
          );
        },
        childCount: 5,
      ),
    );
  }

  Container first() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectxt('first_aid.first'.tr()),
        ],
      ),
    );
  }

  Container second() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          maintxt('first_aid.second.title'.tr()),
          sectxt('first_aid.second.description'.tr()),
          pointtxt('first_aid.second.airway'.tr()),
          sectxt('first_aid.second.airway_desc'.tr()),
          pointtxt('first_aid.second.breathing'.tr()),
          sectxt('first_aid.second.breathing_desc'.tr()),
          pointtxt('first_aid.second.circulation'.tr()),
          sectxt('first_aid.second.circulation_desc'.tr()),
        ],
      ),
    );
  }

  Container third() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          maintxt('first_aid.third.title'.tr()),
          cusimg('first_aid.third.image'.tr()),
          sectxt('first_aid.third.description'.tr()),
          sectxt('first_aid.third.cpr_desc'.tr()),
          sectxt('first_aid.third.aed_desc'.tr()),
          sectxt('first_aid.third.aed_avail_desc'.tr()),
          pointtxt('first_aid.third.what_to_do'.tr()),
          sectxt('first_aid.third.what_to_do_1'.tr()),
          sectxt('first_aid.third.what_to_do_2'.tr()),
          sectxt('first_aid.third.what_to_do_3'.tr()),
          sectxt('first_aid.third.what_to_do_4'.tr()),
          sectxt('first_aid.third.what_to_do_5'.tr()),
        ],
      ),
    );
  }

  Container fourth() {
    return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          maintxt('first_aid.fourth.title'.tr()),
          cusimg('first_aid.fourth.image'.tr()),
          sectxt('first_aid.fourth.description'.tr()),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                spointtxt('first_aid.fourth.capillaries'.tr()),
                ssectxt('first_aid.fourth.capillaries_desc'.tr())
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                spointtxt('first_aid.fourth.veins'.tr()),
                ssectxt('first_aid.fourth.veins_desc'.tr())
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                spointtxt('first_aid.fourth.arteries'.tr()),
                ssectxt('first_aid.fourth.arteries_desc'.tr())
              ],
            ),
          ),
          maintxt('first_aid.fourth.what_to_do'.tr()),
          sectxt('first_aid.fourth.what_to_do_1'.tr()),
          sectxt("first_aid.fourth.what_to_do_2".tr()),
          sectxt("first_aid.fourth.what_to_do_3".tr()),
          sectxt("first_aid.fourth.what_to_do_4".tr()),
          sectxt("first_aid.fourth.what_to_do_5".tr()),
          sectxt("first_aid.fourth.what_to_do_6".tr()),
          sectxt("first_aid.fourth.what_to_do_7".tr()),
        ]));
  }

  Container fifth() {
    return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          maintxt('first_aid.fifth.title'.tr()),
          cusimg('first_aid.fifth.image'.tr()),
          sectxt('first_aid.fifth.description'.tr()),
          pointtxt('first_aid.fifth.severity'.tr()),
          Text.rich(
            TextSpan(children: <TextSpan>[
              spointtxt('first_aid.fifth.first_degree'.tr()),
              ssectxt("first_aid.fifth.first_degree_desc".tr()),
            ]),
          ),
          Text.rich(
            TextSpan(children: <TextSpan>[
              spointtxt('first_aid.fifth.second_degree'.tr()),
              ssectxt("first_aid.fifth.second_degree_desc".tr()),
            ]),
          ),
          Text.rich(
            TextSpan(children: <TextSpan>[
              spointtxt('first_aid.fifth.third_degree'.tr()),
              ssectxt("first_aid.fifth.third_degree_desc".tr()),
            ]),
          ),
        ]));
  }

  Widget cusimg(img) => Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Image.network(
        img,
        fit: BoxFit.fill,
      ));

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
}
