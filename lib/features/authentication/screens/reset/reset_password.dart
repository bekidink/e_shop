import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()=>Get.back(), icon:const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
 Image(image:const AssetImage(TImages.deliveredAnimation),width:THelperFunctions.screenWidth(context)*.6 ,)
        ,
        Text('Reset Password',style: Theme.of(context).textTheme.headlineMedium,),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Text(TTexts.resetSubtitle,style: Theme.of(context).textTheme.labelMedium,),
          const SizedBox(height: TSizes.spaceBtwSections*2,),
          SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>Get.off(()=>const ResetPassword()), child: const Text('Done')),),
            const SizedBox(height: TSizes.spaceBtwSections,),
          SizedBox(width: double.infinity,child: TextButton(onPressed: ()=>Get.off(()=>const ResetPassword()), child: const Text('Resend Email')),)
          ],
        ),
        ),
      ),
    );
  }
}