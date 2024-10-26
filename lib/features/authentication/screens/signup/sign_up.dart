import 'package:e_shop/features/authentication/screens/signup/widgets/signup_form_divider.dart';
import 'package:e_shop/features/authentication/screens/signup/widgets/signup_social.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/signup_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),child: Column(
          children: [
            Text('Create an Account',style: Theme.of(context).textTheme.headlineMedium,),
           const SizedBox(height: TSizes.spaceBtwSections,),
         TSignupForm(),
            signUpFormDivider(context),
             const  SizedBox(height: TSizes.spaceBtwSections,),
        signUpSocial()
          ],
        ),),

      ),
    );
  }
}