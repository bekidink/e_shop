import 'package:e_shop/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:e_shop/utils/device/device_utility.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: controller.updatePageIndicator,
            controller: controller.pageController,
            children: [
              OnBoardingPage(imageUrl: 'assets/images/auth_bg.png', title: TTexts.onBoardingTitle1, subTitle: TTexts.onBoardingSubTitle1),
               OnBoardingPage(imageUrl: 'assets/images/auth_bg.png', title: TTexts.onBoardingTitle2, subTitle: TTexts.onBoardingSubTitle2),
                OnBoardingPage(imageUrl: 'assets/images/auth_bg.png', title: TTexts.onBoardingTitle3, subTitle: TTexts.onBoardingSubTitle3)
            ],
          )
        
        ,
        Positioned(top: TDeviceUtility.getAppBarHeight(),right: TSizes.defaultSpace, child: TextButton(onPressed: (){
          controller.skipPage();
        }, child: Text("Skip"))),
        Positioned(
          left: TSizes.defaultSpace,
        
          bottom:TDeviceUtility.getBottomnavigationBarHeight() +25 ,
          child: SmoothPageIndicator(controller: controller.pageController,count:3 ,onDotClicked: controller.dotNavigationClick,effect:  ExpandingDotsEffect(activeDotColor: TColors.dark,dotHeight: 4),)),

          Positioned(
            right: TSizes.defaultSpace,
            bottom: TDeviceUtility.getBottomnavigationBarHeight(),
            child: ElevatedButton(onPressed: (){
              controller.nextPage();
            }, 
          style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: Colors.black),
          child: Icon(
            Icons.arrow_right,
            color: Colors.white,
          )))
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.imageUrl, required this.title, required this.subTitle});
final String imageUrl,title,subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Column(
                children: [
                  Image(
                    width: THelperFunctions.screenWidth(context)*.8,
                    height: THelperFunctions.screenHeight(context)*.6,
                    image: AssetImage(imageUrl),),
                    Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                    const SizedBox(height: 10,),
                    Text(subTitle,style: Theme.of(context).textTheme.headlineSmall,textAlign: TextAlign.center,),

                ],
              ),
    );
  }
}