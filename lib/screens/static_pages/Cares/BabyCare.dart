import 'package:easy_localization/easy_localization.dart';
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
            FIntro(context),
            CustomContainer(context,
                child: maintxt("Age-by-age guide to feeding your baby".tr())),
            CustomContainer(context,
                child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      spointtxt("Age: Birth to 4 months\n".tr()),
                      ssectxt(
                          "Feeding behavior\nRooting reflex helps your baby turn toward a nipple to find nourishment.\n\nWhat to feed\nBreast milk or formula only\n\nHow much per day\nHow to tell if your baby's getting enough breast milk\nHow to tell how much formula your baby needs\nFeeding tip\nYour baby's digestive tract is still developing, so solid food is off-limits for now."
                              .tr()),
                      spointtxt("\n\nAge: 4 to 6 months\n".tr()),
                      ssectxt(
                          "Signs of readiness for solid food\n\nYour child is likely ready to try solids when they:\n\nCan hold their head up and sit upright in a highchair\nShows significant weight gain (doubled birth weight) and weighs at least 13 pounds\nCan close their mouth around a spoon\nCan move food from the front to the back of their mouth\n\nWhat to feed\n\nBreast milk or formula, plus\nPureed vegetables (peas, squash)\nPureed fruit (apples, bananas, peaches)\nPureed meat (chicken, pork, beef)\nSemi-liquid, iron-fortified cereal (avoid rice cereal; instead choose a cereal made with oats or barley)\nSmall amounts of unsweetened yogurt (no cow's milk until age 1)\n\nHow much per day\n\nBreastfeeding or formula: 4 to 6 feedings (breastfeeding, or 4- to 6-ounce bottles)\nWhen starting solids, begin with a very small amount of a single-ingredient pureed food (about 1 to 2 teaspoons).\nGradually increase to 1 to 2 tablespoons. If you're giving cereal, mix it with breast milk or formula so the consistency isn't too thick.\n\nFeeding tips\n\nIf your baby won't eat what you offer the first time, try again in a few days.\nSome doctors recommend that you introduce new foods one at a time. Wait three to five days, if possible, before offering another new food. (If your baby or family has a history of allergies, talk to your baby's doctor about specific timing.) It's also a good idea to write down the foods your baby samples. If they have an adverse reaction, a food log will make it easier to pinpoint the cause.\nUnsafe levels of toxic heavy metals – arsenic, lead, cadmium, and mercury – have been found in store-bought baby food (including in organic brands). Learn how to avoid heavy metals in baby food.\nGet more detailed tips on how to introduce solids.\nSee which foods aren't safe for your baby."
                              .tr()),
                      spointtxt("\n\nAge: 6 to 8 months\n".tr()),
                      ssectxt("6to8".tr()),
                      spointtxt("\n\nAge: 8 to 12 months\n".tr()),
                      ssectxt("8to12".tr()),
                    ],
                  ),
                )
              ],
            )),
            Title(context),
            Intro(context),
            Breadfest(context)
          ])),
    );
  }

  Container FIntro(context) {
    return CustomContainer(context,
      child: sectxt("babyFeedingGuideIntro".tr()),
    );
  }

  Container Breadfest(context) {
    return CustomContainer(context,
        child: Column(
      children: [
        maintxt("Does breastfeeding hurt?".tr()),
        sectxt("breastfeedingPain".tr()),
        Text.rich(
          TextSpan(
            children: [
              spointtxt('Painful letdown\n'.tr()),
              ssectxt("painfulLetdownExplanation".tr()
              ),
              spointtxt('\nNipple vasospasm\n'.tr()),
              ssectxt("vasospasmExplanation".tr()
              ),
              spointtxt('\nTeething\n'.tr()),
              ssectxt("teethingExplanation".tr()
              ),
              spointtxt('\nSensitive nipples\n'.tr()),
              ssectxt("sensitiveNipplesExplanation".tr()
              ),
              spointtxt('\nPostpartum cramping\n'.tr()),
              ssectxt("postpartumCrampingExplanation".tr()
              ),
            ],
          ),
        )
      ],
    ));
  }

  Container Intro(context) {
    return CustomContainer(context,
      child: Column(
        children: [
          maintxt("Why is breastfeeding so hard?".tr()),
          sectxt("breastfeedingNotAlwaysHard".tr()
              )
        ],
      ),
    );
  }

  Container Title(context) {
    return CustomContainer(context,
      child: maintxt("How to handle common breastfeeding problems".tr()),
    );
  }
}
