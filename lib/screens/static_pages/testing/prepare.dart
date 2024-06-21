import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medica/screens/static_pages/testing/cubit/tests_cubit.dart';
import 'package:medica/shared/styles/AppColor.dart';

class Prepare extends StatelessWidget {
  const Prepare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TestsCubit cubit = TestsCubit.get(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
              child: ListTile(
                title: Text(
                  labels[index],
                  // textDirection: TextDirection.ltr,
                ),
                subtitle: cubit.selectedDescriptionIndex == index
                    ? Text(
                        descriptions[index],
                        // textDirection: TextDirection.ltr,
                      )
                    : null,
                trailing: IconButton(
                  icon: Icon(
                    cubit.selectedDescriptionIndex == index
                        ? Icons.remove
                        : Icons.add,
                    color: cubit.selectedDescriptionIndex == index
                        ? AppColor.dividerColor // Change to your desired color
                        : AppColor.orangcolor,
                  ),
                  onPressed: () {
                    cubit.selectDescription(index);
                  },
                ),
              ),
            ),
          );
        },
        childCount: labels.length,
      ),
    );
  }
}

final List<String> labels = [
  'Blood Lipids'.tr(),
  'Fasting Blood Sugar'.tr(),
  'Postprandial Blood Sugar (2 hours)'.tr(),
  'Glucose Tolerance Test'.tr(),
  'Tuberculosis Urine Sample'.tr(),
  '24-Hour Urine Collection'.tr(),
  'Urine Pregnancy Test'.tr(),
  'Urine Culture'.tr(),
  'Throat Swab'.tr(),
  'Tuberculosis Sputum Sample'.tr(),
  'Semen Analysis'.tr(),
  'Sputum Sample'.tr(),
  'Prostate Culture'.tr(),
  'Stool Culture'.tr(),
  'Fecal Occult Blood Test'.tr(),
  'Asthma or Epilepsy Medications'.tr(),
  'Iron Test'.tr(),
];

final List<String> descriptions = [
  'When performing complete lipid tests with fasting blood sugar, a precise 10-hour fast is required, during which no food or smoking is allowed, only water and medication.'.tr(),
  'A fast of 6-8 hours is required, during which only water and medication are allowed, and no food or smoking. When performing complete lipid tests with fasting blood sugar, a precise 10-hour fast is required, during which no food or smoking is allowed, only water and medication.'.tr(),
  'The 2-hour countdown begins at the start of eating. The meal should be completed within 10 minutes. If the patient is taking medication for diabetes, they should take their medication unless otherwise directed by their doctor. Water can be consumed during the 2 hours.'.tr(),
  'The patient should come to the lab in the morning after fasting for 12 hours and abstaining from smoking during the test. A sample is taken while fasting, then a glucose dose is given, and samples are taken after 1 hour and 2 hours (3 hours for pregnant women).'.tr(),
  'Collect the morning urine for 3 consecutive days. Samples can be stored in the refrigerator until the required number is complete and sent to the lab, or sent one by one.'.tr(),
  'Empty the bladder completely in the toilet and record the time. Collect any urine thereafter in a suitable clean, dry container, continuing to collect urine until the recorded time the next day. Store the urine in the refrigerator until it is sent to the lab.'.tr(),
  'The first urine of the morning is preferred. Reduce fluid intake the evening before the test. Note that a blood pregnancy test is more sensitive than a urine test.'.tr(),
  'Wash hands and genital area with soap and water. Clean the urethral opening with soap and water, and during collection, avoid skin contact. Collect the first part of urine in the toilet, the midstream in the provided sterile container, and the last part in the toilet. Avoid antibiotics for 48 hours before the test unless directed by your doctor. If the sample is collected at home, it must reach the lab within 2 hours.'.tr(),
  'The patient should fast for 8 hours, and it is preferable to stop antibiotics for 48 hours. Avoid using mouthwash or antiseptic solutions 8 hours before the swab.'.tr(),
  'Three samples should be taken on three consecutive days, as with normal sputum collection. Samples can be stored in the refrigerator until all are collected and sent together or one by one.'.tr(),
  'Abstain from ejaculation for 3-5 consecutive days before the test. It is preferable to provide the sample in the lab, ensuring that all semen, especially the first drops, is collected in the prepared cup, without any water or soap contamination. If the sample is brought from home, it should not be older than 20 minutes. Samples are received only at the main branch and placed in an incubator for testing.'.tr(),
  'The sample is taken in the morning immediately after waking up and before breakfast. The patient rinses their mouth with water only, collects the sample in the cup, closes it quickly, and disinfects the outer surface with a cotton swab moistened with 70% alcohol. Facilitating the sample collection can be done by inhaling steam. Send the sample to the lab as soon as possible (within an hour of collection), or store it in the refrigerator (2-8°C) and send it as soon as possible.'.tr(),
  'Avoid antibiotics for 48 hours before the test. Abstain from ejaculation for 3-5 days before the test, and hold urine for 1 hour before the test.'.tr(),
  'Stop antibiotics for 48 hours before the test. Collect the sample in a clean, dry container and send it to the lab within an hour. Samples are not accepted in diapers or mixed with water, soap, urine, or tissue paper.'.tr(),
  'Avoid all types of red meat, liver, radish, rheumatism medications, and any medication containing aspirin, vitamin C, cortisone, or iron for 48 hours. Do not take laxatives.'.tr(),
  'Take the medication regularly for at least 5 days before the test. Ensure there is no vomiting or diarrhea for 48 hours before the test. A blood sample is taken within an hour before the dose to measure the lowest drug level in the blood. Another sample is taken several hours after the dose (varying by drug) to measure the highest drug level in the blood.'.tr(),
  'Fasting for 6-8 hours. The blood sample is taken in the morning after the menstrual period (for women) and preferably before starting iron treatment.'.tr(),
];
