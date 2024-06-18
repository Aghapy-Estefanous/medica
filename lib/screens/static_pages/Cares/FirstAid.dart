import 'package:flutter/material.dart';
import 'package:medica/screens/static_pages/testing/cubit/tests_cubit.dart';
import 'package:medica/shared/styles/AppColor.dart';

class FirstAid extends StatelessWidget {
  const FirstAid({
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
            child: index == 0
                ? first()
                : index == 1
                    ? second()
                    : index == 2
                        ? third()
                        : fourth(),
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
          sectxt(
              'First aid is the immediate care a sick or injured person gets. In some cases, it may be the only care a person needs. In others, first aid is a way to prevent a person\'s condition from worsening and keep them alive until paramedics arrive or they are taken to the hospital.The best way to prepare for these events is to get official first-aid training. In the meantime, there are some basic life-saving steps you can learn.This article goes over the first aid steps to follow in 10 different situations and how to tell if more care is needed.'),
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
          maintxt('ABCs of First Aid'),
          sectxt(
              'If someone is unconscious or unresponsive, the basic principle of first aid that you need to know is ABC: airway, breathing, and circulation.'),
          pointtxt('Airway'),
          sectxt(
              ' If someone\'s not breathing, the first thing you need to do is open their airway.'),
          pointtxt('Breathing'),
          sectxt(
              'If you have cleared a person\'s airway but they\'re still not breathing, provide rescue breathing.'),
          pointtxt('Circulation'),
          sectxt(
              'As you are doing rescue breathing, perform chest compressions to keep the person\'s blood circulating. If the person is not responsive, check their pulse. If their heart has stopped, provide chest compressions.'),
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
          maintxt('First Aid for a Stopped Heart'),
          cusimg(
              'https://www.verywellhealth.com/thmb/EiHS9rCIq-hQJehIKP2Se8ioEDE=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-505252032-56d1ec685f9b5879cc81553d.jpg'),
          sectxt(
              'Cardiopulmonary resuscitation (CPR) is one of the most important emergency medical procedures that a person can know.'),
          sectxt(
              'When a person is in cardiac arrest (heart is not beating), doing CPR and/or using an AED could restart their heart and/or recirculate blood until their heart can be restarted with a defibrillator. Saving lives: why CPR AED training matter.This can restore their life.'),
          sectxt(
              'AEDs are available in many public areas and businesses. These first aid devices are made to be easy to use even if you have no training.'),
          pointtxt('What to Do'),
          sectxt(
              '1.Find a person nearby. Make eye contact, point to them, and say: “Call 911.”'),
          sectxt(
              '2.Start doing chest compressions on the person who needs help. Using both your hands, push down hard and fast in the center of the person\'s chest. Let their chest come back up naturally between compressions. You may hear pops or snaps; this is normal.'),
          sectxt('3.Keep going until someone with more training arrives.'),
          sectxt(
              '4.If you\'re trained in CPR, you can use chest compressions and rescue breathing.'),
          sectxt(
              '5.If it\'s available, use an AED. However, do not put off doing chest compressions to go look for an AED. If possible, instruct someone else to go find the device and bring it to you.'),
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
          maintxt('First Aid for Bleeding'),
          cusimg(
              'https://www.verywellhealth.com/thmb/S7Pp-oYhwU-A86gseGC41RDFM24=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-525386797-5a6a1eccfa6bcc003690b97f.jpg'),
          sectxt(
              'The color of the blood and how it\'s leaving the body can give you a sense of the extent of the injury:'),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                spointtxt('Capillaries: '),
                ssectxt(
                    'Bleeding from the smallest blood vessels (capillaries) looks like a trickle. This kind of bleeding usually stops on its own.')
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                spointtxt('Veins: '),
                ssectxt(
                    'A consistent blood flow and blood that\'s a dark red color is most likely coming from the veins. This type of bleeding can range from mild to severe.')
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                spointtxt('Arteries: '),
                ssectxt(
                    'Arteries are the largest blood vessels and carry a lot of oxygen. If they are injured, bright red blood will spurt out. Blood can be lost very fast with this kind of bleeding.')
              ],
            ),
          ),
          maintxt('What to Do'),
          sectxt(
              '1. Put on disposable gloves if you have them. This will protect you from infectious diseases like viral hepatitis and HIV/AIDS that can be spread in a person\'s blood.'),
          sectxt("2. Rinse the wound with water."),
          sectxt(
              "3. Cover the wound with a gauze or cloth (e.g., towel, blanket, clothing)."),
          sectxt(
              "4. Apply direct pressure to stop the flow of blood and encourage clotting (when blood naturally thickens to stop blood loss)."),
          sectxt(
              "5. Elevate the bleeding body part above the person’s heart if you can."),
          sectxt(
              "6. Do not remove the cloth if it becomes soaked. Removing the first layer will interfere with the clotting process and result in more blood loss. Instead, add more layers if needed."),
          sectxt(
              "7. Once bleeding has stopped, put a clean bandage on the wound."),
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
          maintxt('First Aid for Burns'),
          cusimg(
              'https://www.verywellhealth.com/thmb/kkbt6ABHO51uhwxndw_i06VDV7U=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/woman-washing-hands-in-washstand-882017214-5b57492cc9e77c003756d31c.jpg'),
          sectxt(
              'The first step to treating a burn is to stop the burning process.\n Initial first aid treatment for minor burns.\nThis might mean:\nCleaning up chemicals\nTurning off electricity\nCooling heat with running water\nCovering up or taking a person inside out of the sun'),
          pointtxt(
              'The severity of a burn is based on how deep in the skin it is and how big it is:'),
          Text.rich(
            TextSpan(children: <TextSpan>[
              spointtxt('First-degree burn: '),
              ssectxt(
                  "This kind of burn only affects only the outer layer of skin and causes redness and swelling. It is considered a minor burn."),
            ]),
          ),
          Text.rich(
            TextSpan(children: <TextSpan>[
              spointtxt('Second-degree burn: '),
              ssectxt(
                  "This kind of burn affects two layers of skin and causes blistering, redness, and swelling. It is considered a major burn if it's more than 3 inches wide or is on the face, hands, feet, genitals, buttocks, or over a major joint."),
            ]),
          ),
          Text.rich(
            TextSpan(children: <TextSpan>[
              spointtxt('Third-degree burn: '),
              ssectxt(
                  "This kind of burn affects deeper layers of skin and causes white or blackened skin that can be numb. It is always considered a major burn."),
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
