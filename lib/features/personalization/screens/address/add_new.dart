import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true,title: Text("Add new Address"),),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Iconsax.user
                ),
                labelText: 'Name'
              ),
            ),
            const SizedBox(height: TSizes.spaceBtnInputFields,),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone'
              ),
            ),
            const SizedBox(height: TSizes.spaceBtnInputFields,),
            Row(
              children: [
                Expanded(child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'
                  ),
                )),
                const SizedBox(width: TSizes.spaceBtnInputFields,),
                 Expanded(child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.code),labelText: 'Street'
                  ),
                ))
              ],
            ),
             const SizedBox(height: TSizes.spaceBtnInputFields,),
            Row(
              children: [
                Expanded(child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.building),labelText: 'Street'
                  ),
                )),
                const SizedBox(width: TSizes.spaceBtnInputFields,),
                 Expanded(child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.activity),labelText: 'Street'
                  ),
                ))
              ],
            ),
            const SizedBox(height:TSizes.spaceBtnInputFields),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Iconsax.global
                ),
                labelText: 'Country'
              ),
            ),
            const SizedBox(height: TSizes.defaultSpace,),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Save')),)
          ],
        )),
        ),
      ),
    );
  }
}