import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/common/widgets/custom_shape/containers/rounded_containe.dart';
import 'package:e_shop/features/authentication/screens/verify/success.dart';
import 'package:e_shop/features/shop/screens/cart/cart.dart';
import 'package:e_shop/features/shop/screens/checkout/widgets/bill_address.dart';
import 'package:e_shop/features/shop/screens/checkout/widgets/bill_amount.dart';
import 'package:e_shop/features/shop/screens/checkout/widgets/bill_payment.dart';
import 'package:e_shop/navigation_menu.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Order Review',style: Theme.of(context).textTheme.headlineSmall,),),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            CartItems(dark: dark,showIcons: false,),
            SizedBox(height: TSizes.spaceBtwSections,),
            TCouponCodeCard(dark: dark),
            SizedBox(height: TSizes.spaceBtwSections,),
            TRoundedContainer(
             
              showBorder: true,
              backgroundColor: dark?TColors.black:TColors.white,
              child: Column(
                children: [
                  
                  TBillAmountSection(),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  TBillingPaymentSections(),
                   SizedBox(height: TSizes.spaceBtwItems,),
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  BillAddressSection()
                ],
              ),
            )
          ],
        ),
        ),
      ),
    bottomNavigationBar:  Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      child: ElevatedButton(onPressed: ()=>Get.to(()=>SuccessScreen(image: TImages.successAnimation, title: 'payment Success!', subTitle: 'Your item will be shipped soon!', onPressed: ()=>Get.offAll(()=>NavigationMenu()))), child: Text('Checkout \256.0')),
      ),
    );
  }
}

class TCouponCodeCard extends StatelessWidget {
  const TCouponCodeCard({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark?TColors.dark:TColors.white,
      padding: EdgeInsets.only(top: TSizes.sm,bottom: TSizes.sm,right: TSizes.sm,left: TSizes.sm),
      child: Row(
        children: [
          Flexible(child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Have a promo code? Enter here',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none
    
            ),
          )),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: dark?TColors.white.withOpacity(0.5):TColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.1)
                )
              ),
              onPressed: (){}, child: Text('Apply')))
        ],
      ),
    );
  }
}