import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Column(
                children: [
                  Image(
                    width: THelperFunctions.screenWidth(context)*.8,
                    height: THelperFunctions.screenHeight(context)*.6,
                    image:const AssetImage('assets/images/auth_bg.png'),),
                    Text(TTexts.onBoardingTitle1,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                   const SizedBox(height: 10,),
                    Text(TTexts.onBoardingSubTitle1,style: Theme.of(context).textTheme.headlineSmall,textAlign: TextAlign.center,),

                ],
              )
            ],
          )
        ],
      ),
    );
  }
}