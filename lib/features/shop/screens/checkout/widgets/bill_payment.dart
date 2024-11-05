import 'package:e_shop/common/widgets/custom_shape/containers/rounded_containe.dart';
import 'package:e_shop/common/widgets/texts/heading_title.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBillingPaymentSections extends StatelessWidget {
  const TBillingPaymentSections({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        HeadingTitle(title: 'Payment Method',buttonTitle: 'Change',onPressed: (){},),
const SizedBox(height: TSizes.spaceBtwItems/2,),
Row(
  children: [
    TRoundedContainer(
      width: 60,
      height: 35,
      backgroundColor: dark?TColors.black:TColors.white,
      padding: const EdgeInsets.all(TSizes.sm),
      child: 
          const Image(image: AssetImage(TImages.electronic),fit: BoxFit.contain,),
          
      
    ),
    const SizedBox(width: TSizes.spaceBtwItems/2,),
Text('Paypal',style: Theme.of(context).textTheme.bodyLarge,)
    
  ],
),

      ],
    );
  }
}