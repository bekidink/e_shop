import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/features/personalization/screens/address/add_new.dart';
import 'package:e_shop/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=>Get.to(()=>AddNewAddressScreen()),child: Icon(Iconsax.add,color: TColors.white,),),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Address',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(

          children: [
TSingleAddress(selectedAddress: true),
TSingleAddress(selectedAddress: false)
          ],
        ),
        ),
      ),
    );
  }
}