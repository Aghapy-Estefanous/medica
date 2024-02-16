import 'package:flutter/material.dart';
import 'package:medica/pages/Login.dart';
import 'package:medica/styles/AppColor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoardingModel {
  Widget? image;
  String? title;
  String? discribtion;
  BoardingModel({this.image, this.title, this.discribtion});
}

List<BoardingModel> onboardingListItems = [
  BoardingModel(
      image: const Image(
        image: AssetImage('assets/images/onboarding/Occupations-transformed.png'),
      ),
      title: 'Welcome to ShopEase',
      discribtion:
          'Discover a world of convenience at your fingertips. Shop for the latest trends, exclusive deals, and more. Join millions of shoppers and experience the future of shopping with ShopEase.'),
  BoardingModel(
      image: const Image(
        image: AssetImage('assets/images/onboarding/Occupations-transformed.png'),
        width: 200,
        height: 200,
      ),
      title: 'Explore Trendy Collections',
      discribtion:
          ' Dive into a vast collection of fashion, electronics, home decor, and more. Explore curated collections tailored to your preferences. Stay in style and up-to-date with the latest trends.'),
  BoardingModel(
      image: const Image(
        image: AssetImage(
          'assets/images/onboarding/Occupations-transformed.png',
        ),
        width: 300,
        height: 200,
      ),
      title: 'Easy Checkout & Fast Delivery',
      discribtion:
          'Shop with confidence! Our seamless checkout process makes buying a breeze. Enjoy lightning-fast deliveries right to your doorstep. Experience hassle-free shopping like never before.'),
];
var BoardingController = PageController();
bool isend = false;

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
      body: Container(
        color: AppColor.primaryColor,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/onboarding/logo.png',
                  height: 70,
                  width: 70,
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    if (!isend) {
                      BoardingController.nextPage(
                          duration: const Duration(
                            milliseconds: 800,
                          ),
                          curve: Curves.decelerate);
                    } else {
                      //go to login & save to pref ✅
                      //  subimtToshared(context);
                    }
                  },
                  child: const Text(
                    "skip",
                    style: TextStyle(color: AppColor.orangcolor, fontSize: 20),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                allowImplicitScrolling: true,
                physics: const BouncingScrollPhysics(),
                controller: BoardingController,
                itemBuilder: (context, index) =>
                    Padding(
                      padding: const EdgeInsets.only(left: 3,right: 3),
                      child: BoardingItems(onboardingListItems[index], index, context)),
                itemCount: 3,
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
          ],
        ),
      ),
    );
  }
}

Widget BoardingItems(BoardingModel Model, int index, context) {
  return Column(
    children: [
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.185,
      ),
      Padding(
        padding: const EdgeInsets.all(0.0),
        child: Model.image,
      ),
      Expanded(
        child: Container(
          decoration: const BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.020,
              ),
              Text(
                Model.title.toString(),
                //  onboardingListItems[index]('title'),
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColor.secondaryTextColor),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.014,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  Model.discribtion.toString(),
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 145, 144, 143),
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.014,
              ),
              SmoothPageIndicator(
                  controller: BoardingController,
                  effect: const ExpandingDotsEffect(
                    spacing: 10,
                    activeDotColor: AppColor.orangcolor,
                    expansionFactor: 4.0,
                    dotHeight: 10,
                    dotWidth: 12,
                  ),
                  count: onboardingListItems.length),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height*0.055
                ,
                width: MediaQuery.sizeOf(context).width * .9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.orangcolor),
                  onPressed: () {
                    if (!isend) {
                      BoardingController.nextPage(
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                          curve: Curves.easeInOutCubic);
                    } else {
                      //go to login & save to pref ✅
                      //  subimtToshared(context);
                     
                    }
                  },
                  child: const Text(
                    "next",
                    style: TextStyle(color: AppColor.whiteColor, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
