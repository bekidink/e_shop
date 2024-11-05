import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/user/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Change Name',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Use real name for easy verification.This name will appear on several pages.',style: Theme.of(context).textTheme.labelMedium,),
          SizedBox(height: TSizes.spaceBtwItems,),
          Form(
            key: controller.updateNameFormKey,
            child: Column(
            children: [
              TextFormField(
                controller:controller.firstName ,
                validator: (value) => TValidator.validateEmptyText('First name', value),
                expands: false,
                decoration: InputDecoration(
                  labelText: 'First Name',prefixIcon: Icon(Iconsax.user)
                ),
              ),
              SizedBox(height: TSizes.spaceBtnInputFields,),
               TextFormField(
                controller:controller.lastName ,
                validator: (value) => TValidator.validateEmptyText('First name', value),
                expands: false,
                decoration: InputDecoration(
                  labelText: 'Last Name',prefixIcon: Icon(Iconsax.user)
                ),
              )
            ],
          )),
          SizedBox(height: TSizes.spaceBtwSections,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: ()=>controller.updateUserName(), child: Text('Save')),
          )
        ],
      ),
      ),

    );
  }
}