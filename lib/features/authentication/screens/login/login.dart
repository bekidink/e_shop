import 'package:e_shop/common/styles/spacing_styles.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: TSpacingStyle.paddingEdgeInsets,
        child: Column(
          children: [
            Column(
              children: [
       const         Image(
                  height: 150,
                  image: AssetImage('assets/image/intro_bg.png')),

Text(TTexts.onBoardingTitle1,style: Theme.of(context).textTheme.headlineMedium,),
const SizedBox(height: 10,),
Text(TTexts.onBoardingSubTitle1,style: Theme.of(context).textTheme.bodyMedium,)
              ],
            ),
            Form(child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),labelText: TTexts.email
                  ),
                ),
                SizedBox()
              ],
            ))
          ],
        ),
        ),
        
      ),
    );
  }
}