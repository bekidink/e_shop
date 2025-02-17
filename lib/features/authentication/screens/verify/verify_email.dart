import 'package:e_shop/data/repositories/authentication/authentication_rep.dart';
import 'package:e_shop/features/authentication/controllers/verify/email_verify.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key, this.email});
final String? email;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=>AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),child: Column(
          children: [
Image(image:const AssetImage(TImages.verifyAnimation),width: THelperFunctions.screenWidth(context)*0.6,),
const SizedBox(height: TSizes.spaceBtwSections,),
Text('Verify your email address',style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
const SizedBox(height: TSizes.spaceBtwItems,),
Text(TTexts.confirmEmailSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
const SizedBox(height: TSizes.spaceBtwSections,),
SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>controller.checkEmailVerificationStatus(), child: const Text('Continue')),),
  const SizedBox(height: TSizes.spaceBtwSections,),
  SizedBox(width: double.infinity,child: TextButton(onPressed: ()=>controller.sendEmailVerifucation(), child: const Text('Resend Email')),),
          ],
        ),),
      ),
    );
  }
}