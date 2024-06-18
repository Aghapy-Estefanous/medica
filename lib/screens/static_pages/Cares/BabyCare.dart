import 'package:flutter/material.dart';
import 'package:medica/shared/SharedWidget.dart';

import 'MamyCare.dart';

class BabyCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            FIntro(),
            CustomContainer(
                child: maintxt("Age-by-age guide to feeding your baby")),
            CustomContainer(
                child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      spointtxt("Age: Birth to 4 months\n"),
                      ssectxt(
                          "Feeding behavior\nRooting reflex helps your baby turn toward a nipple to find nourishment.\n\nWhat to feed\nBreast milk or formula only\n\nHow much per day\nHow to tell if your baby's getting enough breast milk\nHow to tell how much formula your baby needs\nFeeding tip\nYour baby's digestive tract is still developing, so solid food is off-limits for now."),
                      spointtxt("\n\nAge: 4 to 6 months\n"),
                      ssectxt(
                          "Signs of readiness for solid food\n\nYour child is likely ready to try solids when they:\n\nCan hold their head up and sit upright in a highchair\nShows significant weight gain (doubled birth weight) and weighs at least 13 pounds\nCan close their mouth around a spoon\nCan move food from the front to the back of their mouth\n\nWhat to feed\n\nBreast milk or formula, plus\nPureed vegetables (peas, squash)\nPureed fruit (apples, bananas, peaches)\nPureed meat (chicken, pork, beef)\nSemi-liquid, iron-fortified cereal (avoid rice cereal; instead choose a cereal made with oats or barley)\nSmall amounts of unsweetened yogurt (no cow's milk until age 1)\n\nHow much per day\n\nBreastfeeding or formula: 4 to 6 feedings (breastfeeding, or 4- to 6-ounce bottles)\nWhen starting solids, begin with a very small amount of a single-ingredient pureed food (about 1 to 2 teaspoons).\nGradually increase to 1 to 2 tablespoons. If you're giving cereal, mix it with breast milk or formula so the consistency isn't too thick.\n\nFeeding tips\n\nIf your baby won't eat what you offer the first time, try again in a few days.\nSome doctors recommend that you introduce new foods one at a time. Wait three to five days, if possible, before offering another new food. (If your baby or family has a history of allergies, talk to your baby's doctor about specific timing.) It's also a good idea to write down the foods your baby samples. If they have an adverse reaction, a food log will make it easier to pinpoint the cause.\nUnsafe levels of toxic heavy metals – arsenic, lead, cadmium, and mercury – have been found in store-bought baby food (including in organic brands). Learn how to avoid heavy metals in baby food.\nGet more detailed tips on how to introduce solids.\nSee which foods aren't safe for your baby."),
                      spointtxt("\n\nAge: 6 to 8 months\n"),
                      ssectxt(
                          "Signs of readiness for solid food\n\nSame as 4 to 6 months\n\nWhat to feed\n\nBreast milk or formula, plus\nPureed or strained fruits (banana, pears, applesauce, peaches, avocado)\nPureed or strained vegetables (well-cooked carrots, squash, sweet potato)\nPureed or mashed meat (chicken, pork, beef)\nPureed or mashed tofu\nSmall amounts of pureed or soft pasteurized cheese, cottage cheese, or unsweetened yogurt (no cow's milk until age 1)\nPureed or mashed legumes (black beans, chickpeas, edamame, fava beans, black-eyed peas, lentils, kidney beans)\nIron-fortified cereal (oats, barley); small pieces of bread and crackers\n\nHow much per day\n\nBreastfeeding or formula: 3 to 5 feedings (breastfeeding, or 6- to 8-ounce bottles)\n2 to 3 tablespoons fruit, gradually increasing to 4 to 8 tablespoons\n2 to 3 tablespoons vegetables, gradually increasing to 4 to 8 tablespoons\n1 to 2 tablespoons grain products, gradually increasing to 2 to 4 tablespoons\n1 to 2 tablespoons protein-rich foods, gradually increasing to 2 to 4 tablespoons\n\nFeeding tips\n\nAs your baby gets more comfortable with eating, you can start to add a variety of foods and increase the frequency of meals. By 8 months, it's typical for your baby to be eating one to two meals a day.\nWhenever you introduce a new food, start with a very small amount (a teaspoon or two) to allow your baby to get used to a new flavor and texture."),
                      spointtxt("\n\nAge: 8 to 12 months\n"),
                      ssectxt(
                          "Signs of readiness for solid and soft finger foods\n\nSame as 6 to 8 months, plus\nPicks up objects with thumb and forefinger (pincer grasp)\nCan transfer items from one hand to the other\nMoves jaw in a chewing motion\nSwallows food more easily\nNo longer pushes food out of mouth with tongue\nTries to use a spoon\n\nWhat to feed\n\nBreast milk or formula, plus\nSoft pasteurized cheese, cottage cheese, and unsweetened yogurt\nBite-size, soft-cooked vegetables (carrots, squash, potatoes, sweet potatoes)\nFruit mashed or cut into soft cubes or strips (bananas, peaches, pears, avocados)\nFinger foods (O-shaped cereal, small bits of scrambled eggs, well-cooked pieces of potato, well-cooked spiral pasta, teething crackers, small pieces of bagel)\nProtein-rich foods (small bits of meat, poultry, boneless fish, tofu, and well-cooked beans, like lentils, split peas, pintos, or black beans)\nIron-fortified cereal and other grains (barley, wheat, oats, mixed cereals)\n\nHow much per day\n\nBreastfeeding or formula: 3 to 4 feedings (breastfeeding, or 7- to 8-ounce bottles)\n1/2 to 3/4 cup fruit\n1/2 to 3/4 cup vegetables\n1/4 to 1/2 cup grain products\n1/4 to 1/2 cup protein-rich foods\n\nFeeding tips\n\nBy 8 months or so, babies often have three meals and start adding snacks.\nContinue to offer a wide variety of fruits, vegetables, grains, and protein-rich foods. As your baby's eating skills improve, gradually introduce more textures and soft finger foods.\nIt's fine to serve your baby what the rest of the family is eating – just watch out for added sugars, which aren't recommended for children under 2. Check the Nutrition Facts label on packaged foods, and try to steer clear of foods that list 1 gram or more of 'Added Sugars.'"),
                    ],
                  ),
                )
              ],
            )),
            Title(),
            Intro(),
            Breadfest()
          ])),
    );
  }

  Container FIntro() {
    return CustomContainer(
      child: sectxt(
          "Use this baby feeding guide to find out what and how much to feed your child in the first year. The amounts are general recommendations only, so don't worry if your little one eats a bit more or less than suggested. It's always a good idea to discuss your plan for starting solids with your child's doctor before getting started."),
    );
  }

  Container Breadfest() {
    return CustomContainer(
        child: Column(
      children: [
        maintxt("Does breastfeeding hurt?"),
        sectxt(
            "Breastfeeding shouldn't hurt. If it does, it's a sign that something's wrong. Most often it's because your baby isn't latching well (see below). A lactation consultant can help you determine if that's the case and show you how to correct your baby's latch.\n\nOther issues that cause discomfort can pop up, too, such as:"),
        Text.rich(
          TextSpan(
            children: [
              spointtxt('Painful letdown\n'),
              ssectxt(
                "A tingling sensation is typical when the milk ducts in your breasts constrict to pump milk into the nipples (this is called letdown). But some women have pain during letdown.\n\nThis can happen if you're producing too much milk, or if you have clogged ducts or mastitis (an inflammation of breast tissue). It can also happen if you have a thrush on your nipples/breasts. Use breathing or relaxation techniques to cope, and see your provider if you have any signs of infection, such as a fever or itchy, red, or burning nipples.\n\nLearn more about handling painful letdown.",
              ),
              spointtxt('\nNipple vasospasm\n'),
              ssectxt(
                "Restricted blood flow caused by tightening blood vessels in your breasts can cause a burning or stabbing pain. You may notice that your breasts become blanched and your nipples change color (become more purple or red). Having cracked nipples or an infection can make the pain worse. Keeping your breasts warm and avoiding caffeine may help. But see your healthcare provider or lactation consultant to get to the underlying reason for the vasospasms. They may recommend medication.",
              ),
              spointtxt('\nTeething\n'),
              ssectxt(
                "Your baby may get new teeth without it affecting breastfeeding in the least. But – in an effort to adjust because of the pain they feel on their gums when nursing – they may change position or latch, or even bite to relieve the discomfort.\n\nPay attention to your baby's latch, and experiment with different breastfeeding positions. Anticipate a bite, when you can (you may notice your baby moves their tongue out of the way first), and unlatch your baby by putting your finger in the corner of their mouth. Massaging your baby's gums or giving them a teether before nursing may help.",
              ),
              spointtxt('\nSensitive nipples\n'),
              ssectxt(
                "Tender nipples are often an early sign of pregnancy or an imminent menstrual period. And some breast surgeries may result in numbness or even pain in your nipple or breast, because of nerve damage. Having your baby latch on when your nipples are feeling sensitive can be very uncomfortable. To avoid nipple pain, make sure your baby has a good latch (they aren't sucking on the end of your nipple, for example).",
              ),
              spointtxt('\nPostpartum cramping\n'),
              ssectxt(
                "After you deliver your baby, your uterus needs to return to its pre-pregnancy size. You may feel some cramping when this happens, and the cramping may be especially intense while nursing. That's because breastfeeding can stimulate uterine contractions – which is good, though sometimes painful.\n\nBreathing exercises and massage may help you get through the cramping. If needed, you can also take over-the-counter pain relievers to help with the pain, which should disappear within a week or so.",
              ),
            ],
          ),
        )
      ],
    ));
  }

  Container Intro() {
    return CustomContainer(
      child: Column(
        children: [
          maintxt("Why is breastfeeding so hard?"),
          sectxt(
              "Breastfeeding isn't always hard. Sometimes the whole process goes smoothly and comfortably, and a mom and baby breastfeed for months or years without a hitch. But breastfeeding often comes with challenges, big and little. Your baby may take some time to learn to latch on, for example, or you may struggle with milk supply, pain, or infection. Complications like these often come at the beginning of your breastfeeding journey, which can be especially discouraging.")
        ],
      ),
    );
  }

  Container Title() {
    return CustomContainer(
      child: maintxt("How to handle common breastfeeding problems"),
    );
  }
}
