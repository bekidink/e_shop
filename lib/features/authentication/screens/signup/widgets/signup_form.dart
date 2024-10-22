import 'package:e_shop/features/authentication/screens/verify/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helper_functions.dart';

Widget signUpForm(BuildContext context){
  final dark=THelperFunctions.isDarkMode(context);
  return   Form(child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: 'First Name',prefixIcon: Icon(Iconsax.user)
                    ),
                  )),
                  const SizedBox(width: TSizes.spaceBtnInputFields,),
                  Expanded(child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',prefixIcon: Icon(Iconsax.user)
                    ),
                  ))
                ],
              ),
              const SizedBox(height: TSizes.spaceBtnInputFields,),
              TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: 'User Name',prefixIcon: Icon(Iconsax.user_edit)
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtnInputFields,),
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: 'Email',prefixIcon: Icon(Iconsax.direct)
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtnInputFields,),
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: 'Phone No',prefixIcon: Icon(Iconsax.call)
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtnInputFields,),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password', suffixIcon: Icon(Iconsax.eye_slash),prefixIcon: Icon(Iconsax.password_check)
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtnInputFields,),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,height: 24,child: Checkbox(value: true, onChanged: (value) {}),),
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
                  SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>Get.to(()=>const VerifyEmail()), child: const Text('Sign Up')),)
            ],
           ));
           
           
           
}