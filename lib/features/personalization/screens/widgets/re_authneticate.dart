import 'package:e_shop/features/personalization/controllers/user/user_controller.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:e_shop/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginFom extends StatelessWidget {
  const ReAuthLoginFom({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UserController());
    return Scaffold(
      appBar: AppBar(title:const Text('Re-Authenticate'),),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Padding(padding:const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
            children: [
              TextFormField(
                controller: controller.verifyEmail,
                validator:(value)=> TValidator.validateEmail(value!),
                decoration:const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),labelText: TTexts.email
                ),
              ),
            const  SizedBox(height: TSizes.spaceBtnInputFields,),
               TextFormField(
                controller: controller.verifyEmail,
                validator:(value)=> TValidator.validatePassword(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),labelText: TTexts.email,
                  suffixIcon: IconButton(onPressed: ()=>controller.hidePassword.value=!controller.hidePassword.value, icon:const Icon(Iconsax.eye_slash),
                 
                  )
                ),
              ),
              SizedBox(height: TSizes.spaceBtwSections,),
              SizedBox(
                child: ElevatedButton(onPressed: (){}, child:Text('') ),
              )
            ],
          )),
          ),
        ),
      ),
    );
  }
}