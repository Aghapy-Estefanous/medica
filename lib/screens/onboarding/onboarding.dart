import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/screens/auth/loginS/loginS.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  Widget? image;
  String? title;
  String? discribtion;
  BoardingModel({this.image, this.title, this.discribtion});
}

List<BoardingModel> onboardingListItems = [
  BoardingModel(
      image: Lottie.asset('assets/images/onboarding/animation1.json'),
      title: "Discover Care Centers: Booking, Details, and Waitlists",
      discribtion:
          'Explore clinics, labs, and waitlists effortlessly. Easily book appointments, find information, and use a search service for clinics, labs, medicines, and their components.'),
  BoardingModel(
      image: Lottie.asset('assets/images/onboarding/animation2.json'),
      title: "Your Health Insights: Test Results and Reports",
      discribtion:
          'Get instant access to test results and your medical report. Understand test instructions quickly, empowering you with valuable health insights at your fingertips.'),
];
var BoardingController = PageController();
bool isend = false;

//
// subimtToshared(context) {
//   CachHelper.Savedata(key: 'onBoarding', value: true).then((value) {
//     if (value) navigateandFinish(context, Login());
//   }).catchError((e) {
//     print(e.toString());
//   });
// }

class BoardingScreen extends StatefulWidget {
  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //delete the background
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton(
              onPressed: () {
                //save clicked skip {from boarding} ✅
                // subimtToshared(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Login(),
                  ),
                );
              },
              child: const Text(
                'SKIP',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ))
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  allowImplicitScrolling: true,
                  physics: const BouncingScrollPhysics(),
                  controller: BoardingController,
                  itemBuilder: (context, index) =>
                      BoardingItems(onboardingListItems[index]),
                  itemCount: 2,
                  onPageChanged: (value) {
                    if (onboardingListItems.length - 1 == value) {
                      setState(() {
                        isend = true;
                      });
                    } else {
                      setState(() {
                        isend = false;
                      });
                    }
                  },
                ),
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                      controller: BoardingController,
                      effect: const ExpandingDotsEffect(
                        spacing: 12,
                        activeDotColor: AppColor.primaryColor,
                        expansionFactor: 4.0,
                        dotHeight: 12,
                        dotWidth: 12,
                      ),
                      count: onboardingListItems.length),
                  const Spacer(),
                  FloatingActionButton(
                    backgroundColor: AppColor.primaryColor,
                    shape: const CircleBorder(eccentricity: 1),
                    onPressed: () {
                      if (!isend) {
                        BoardingController.nextPage(
                            duration: const Duration(
                              milliseconds: 800,
                            ),
                            curve: Curves.decelerate);
                      } else {
                        //go to login & save to pref ✅
                        // subimtToshared(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const Login(),
                          ),
                        );
                      }
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget BoardingItems(BoardingModel Model) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(22.0),
        child: Model.image,
      ),

      Text(
        Model.title.toString(),
        //  onboardingListItems[index]('title'),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColor.primaryColor),
      ),
      const SizedBox(
        height: 20,
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            Model.discribtion.toString(),
            style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 112, 108, 108),
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      // const Spacer(
      //   flex: 2,
      // ),
    ],
  );
}
