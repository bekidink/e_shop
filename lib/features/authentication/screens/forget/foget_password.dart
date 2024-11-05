import 'package:e_shop/features/authentication/controllers/forget_password/forget_passwod.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Forget Passwod',style: Theme.of(context).textTheme.headlineMedium,),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Text(TTexts.forgetSubtitle,style: Theme.of(context).textTheme.labelMedium,),
          const SizedBox(height: TSizes.spaceBtwSections*2,),
          Form(
            key: controller.forgetPasswordKey,
            child: TextFormField(
              controller: controller.email,
              decoration:const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections,),
          SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>controller.sendPasswordResetEmail(), child: const Text('Submit')),)
        ],
      ),
      ),
    );
  }
}