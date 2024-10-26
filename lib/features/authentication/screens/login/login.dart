import 'package:e_shop/common/styles/spacing_styles.dart';
import 'package:e_shop/features/authentication/controllers/login/login_controller.dart';
import 'package:e_shop/features/authentication/screens/forget/foget_password.dart';
import 'package:e_shop/features/authentication/screens/signup/sign_up.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:e_shop/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(LoginController());
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
                  width: 150,
                  image: AssetImage(TImages.electronic)),

Text(TTexts.onBoardingTitle1,style: Theme.of(context).textTheme.headlineMedium,),
const SizedBox(height: 10,),
Text(TTexts.onBoardingSubTitle1,style: Theme.of(context).textTheme.bodyMedium,)
              ],
            ),
            Form(
              key: controller.loginFormKey,
              child: Padding(
              padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.email,
                    validator: (value) => TValidator.validateEmail(value!),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail),labelText: TTexts.email
                    ),
                  ),
                 const SizedBox(height: TSizes.spaceBtnInputFields,),
                  Obx(
                    ()=> TextFormField(
                      controller: controller.password,
                      obscureText: controller.hidePassword.value,
                      validator: (value) => TValidator.validatePassword(value),
                      decoration:  InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        labelText: 'Password',
                        suffixIcon:IconButton(onPressed: ()=>controller.hidePassword.value=!controller.hidePassword.value, icon: Icon(controller.hidePassword.value?Iconsax.eye:Iconsax.eye_slash))
                      ),
                    ),
                  ),
                   const SizedBox(height: TSizes.spaceBtnInputFields,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(()=> Checkbox(value: controller.rememberMe.value, onChanged: (value)=>controller.hidePassword.value=!controller.rememberMe.value)),
                          const Text('Remember Me')
                        ],
                      ),
                      TextButton(onPressed: ()=>Get.to(()=>const ForgetPasswordScreen()), child: const Text('Forget Password'))
                    ],
                   ),
                   const SizedBox(height: TSizes.spaceBtwSections,),
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>controller.emailAndPasswordSignIn(), child: const Text('Sign In')),),
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
                  child: IconButton(onPressed: ()=>controller.googleSignIn(), icon: const Icon(Icons.facebook)),
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