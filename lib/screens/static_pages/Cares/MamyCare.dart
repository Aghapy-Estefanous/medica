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
            intro(),
            CustomContainer(
              child: Column(children: [
                maintxt("Focus on eating well"),
                sectxt(
                    "Keep plenty of healthy snacks on hand, and plan your meals around whole grains and fresh fruits and vegetables. (Learn the 12 best foods to eat when pregnant.) Limit calories from saturated fats and added sugars. If you're on a special diet (for diabetes, a food allergy, or food intolerance, for example) or are a vegetarian or vegan, you may find it helpful to consult with a dietitian for help making sure you meet all of your nutritional requirements during pregnancy.\n\nMake sure you get plenty of protein, which is the building block of cells. You now need about 70 grams a day compared to 45 grams before you got pregnant. You also need:"),
                Text.rich(
                  TextSpan(
                    children: [
                      spointtxt('Folic acid'),
                      ssectxt(
                          " (600 mcg daily) to help prevent neural tube defects (NTDs).\n"),
                      spointtxt('Iron'),
                      ssectxt(
                          " (27 mg daily) to help red blood cells deliver oxygen to your baby. Iron also helps prevent anemia.\n"),
                      spointtxt('Calcium'),
                      ssectxt(
                          " (1000 mg for women over age 18, 1300 mg for women 18 and younger) to build strong bones and teeth and develop a healthy heart, nerves, and muscles.\n"),
                      spointtxt('Iodine'),
                      ssectxt(
                          " (220 mcg daily) to help with brain, skeleton, and nervous system development.\n"),
                      spointtxt('Choline'),
                      ssectxt(
                          " (450 mg daily) for brain and spinal cord development.\n"),
                      spointtxt('Vitamin A'),
                      ssectxt(
                          " (770 mcg RAE daily for women ages 19 and older, 750 mcg RAE for women ages 18 and younger) for your baby's eyesight, organs, and bone growth.\n"),
                      spointtxt('Vitamin C'),
                      ssectxt(
                          " (85 mg daily if 19 years or older, 80 mg daily if 18 or younger) to help build strong bones and muscles. Vitamin C will also help you absorb more iron.\n"),
                      spointtxt('Vitamin D'),
                      ssectxt(
                          " (600 IU daily) to build your baby's bones and teeth.\n"),
                      spointtxt('Vitamin B6'),
                      ssectxt(
                          " (1.9 mg daily) to help build your baby's brain and nervous system.\n"),
                      spointtxt('Vitamin B12'),
                      ssectxt(
                          " (2.6 mcg daily) to make healthy red blood cells and ensure proper brain and spinal cord development.\n"),
                      spointtxt('DHA'),
                      ssectxt(
                          ", an omega-3 fatty acid (at least 200 mg) for the development of your baby's brain and eyes.\n"),
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

  Container intro() {
    return CustomContainer(
        child: Column(
      children: [
        pointtxt(
            "Good prenatal care is essential for you and your baby. If you haven't yet chosen a doctor or a midwife to care for you during pregnancy, start asking for recommendations from friends, family, and any of your other healthcare providers. If you don't have health insurance or need low-cost prenatal care, there are options. It's important to find a pregnancy caregiver who makes you feel comfortable and safe."),
        sectxt(
            "Once you get a positive home pregnancy test, call your healthcare provider right away and schedule your first prenatal visit. During that visit you'll be screened for certain conditions that could lead to complications. Your provider will also review any medications you're taking and discuss the risks and benefits before making the decision to stop taking any medicines."),
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
