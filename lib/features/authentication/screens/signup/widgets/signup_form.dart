import 'package:e_shop/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_shop/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
  final dark=THelperFunctions.isDarkMode(context);
  final controller=Get.put(SignupController());
  return   Form(
    key: controller.signupFormKey,
    child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: TextFormField(
                    expands: false,
                    controller: controller.firstName,
                    validator: (value) => TValidator.validateEmptyText('First Name', value),
                    decoration: const InputDecoration(
                      labelText: 'First Name',prefixIcon: Icon(Iconsax.user)
                    ),
                  )),
                  const SizedBox(width: TSizes.spaceBtnInputFields,),
                  Expanded(child: TextFormField(
                    expands: false,
                    controller: controller.lastName,
                    validator: (value) => TValidator.validateEmptyText('Last Name', value),
                    decoration: const InputDecoration(
                      labelText: 'Last Name',prefixIcon: Icon(Iconsax.user)
                    ),
                  ))
                ],
              ),
              const SizedBox(height: TSizes.spaceBtnInputFields,),
              TextFormField(
                    expands: false,
                    controller: controller.username,
                    validator: (value) => TValidator.validateEmptyText('User Name', value),
                    decoration: const InputDecoration(
                      labelText: 'User Name',prefixIcon: Icon(Iconsax.user_edit)
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtnInputFields,),
                  TextFormField(
                    expands: false,
                    controller: controller.email,
                    validator: (value) => TValidator.validateEmail( value!),
                    decoration: const InputDecoration(
                      labelText: 'Email',prefixIcon: Icon(Iconsax.direct)
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtnInputFields,),
                  TextFormField(
                    expands: false,
                    controller: controller.phoneNumber,
                    validator: (value) => TValidator.validateEmptyText('Phone No', value),
                    decoration: const InputDecoration(
                      labelText: 'Phone No',prefixIcon: Icon(Iconsax.call)
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtnInputFields,),
                  Obx(
                    ()=> TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.pasword,
                      validator: (value) => TValidator.validatePassword( value),
                      decoration:  InputDecoration(
                        labelText: 'Password', suffixIcon: IconButton(icon: Icon (controller.hidePassword.value? Iconsax.eye_slash:Iconsax.eye),onPressed:()=>controller.hidePassword.value=!controller.hidePassword.value ,),prefixIcon: const Icon(Iconsax.password_check)
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtnInputFields,),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,height: 24,child: Obx(()=> Checkbox(value: controller.acceptPrivacy.value, onChanged: (value) =>controller.acceptPrivacy.value=!controller.acceptPrivacy.value)),),
                      const SizedBox(width: TSizes.spaceBtwItems,),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: 'I Agree To',style: Theme.of(context).textTheme.bodyMedium
                          ),
                           TextSpan(
                            text: 'privacy Policy',style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color:dark?TColors.white:TColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: dark?TColors.white:TColors.primary
                            )
                          ),
                          TextSpan(text: 'and',style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(text: 'Tertm Of Use',style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark?TColors.white:TColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor: dark?TColors.white:TColors.primary
                          ))
                        ])
                      )
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>controller.signup(), child: const Text('Sign Up')),)
            ],
           ));
           
           
           
}
}