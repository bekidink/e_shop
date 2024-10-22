import 'package:e_shop/common/styles/spacing_styles.dart';
import 'package:e_shop/features/authentication/screens/forget/foget_password.dart';
import 'package:e_shop/features/authentication/screens/signup/sign_up.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
       const         Image(
                  height: 150,
                  image: AssetImage('assets/images/intro_bg.png')),

Text(TTexts.onBoardingTitle1,style: Theme.of(context).textTheme.headlineMedium,),
const SizedBox(height: 10,),
Text(TTexts.onBoardingSubTitle1,style: Theme.of(context).textTheme.bodyMedium,)
              ],
            ),
            Form(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail),labelText: TTexts.email
                    ),
                  ),
                 const SizedBox(height: TSizes.spaceBtnInputFields,),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.visibility)
                    ),
                  ),
                   const SizedBox(height: TSizes.spaceBtnInputFields,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (value){}),
                          const Text('Remember Me')
                        ],
                      ),
                      TextButton(onPressed: ()=>Get.to(()=>const ForgetPasswordScreen()), child: const Text('Forget Password'))
                    ],
                   ),
                   const SizedBox(height: TSizes.spaceBtwSections,),
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: const Text('Sign In')),),
              const SizedBox(height: TSizes.spaceBtwItems,),
              SizedBox(width: double.infinity,child: OutlinedButton(onPressed: () => Get.to(()=>const SignUpScreen()), child: const Text('Create Account')),),
                ],
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: Divider(
                  color: dark?TColors.darkGrey:TColors.grey,thickness: 0.5,indent: 60,endIndent: 5,
                )),
                Text('Or sign in with'.capitalize!,style: Theme.of(context).textTheme.labelMedium,),
                Flexible(child: Divider(
                  color: dark?TColors.darkGrey:TColors.grey,thickness: 0.5,indent: 60,endIndent: 5,
                ))
              ],
            ),
       
          const  SizedBox(height: TSizes.spaceBtwSections,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: TColors.grey
                    ),borderRadius: BorderRadius.circular(100)
                  ),
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.facebook)),
                ),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: TColors.grey
                    ),borderRadius: BorderRadius.circular(100)
                  ),
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.facebook)),
                ),
              ],
            )
         
         
         
         
          ],
        ),
        ),
        
      ),
    );
  }
}