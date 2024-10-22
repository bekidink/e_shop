import 'package:e_shop/common/widgets/icons/circular_icon.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace,vertical: TSizes.defaultSpace/2),
      decoration: BoxDecoration(
        color: dark?TColors.darkerGrey:TColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TCircularIcon(icon: Iconsax.minus,backgroundColor: TColors.darkGrey, width: 40, height: 40, color: TColors.white,),
              Text('2',style: Theme.of(context).textTheme.titleSmall,),
              const SizedBox(width: TSizes.spaceBtwItems,),
              TCircularIcon(icon: Iconsax.add,backgroundColor: TColors.black,width: 40,height: 40, color: TColors.black,),
              
            ],
          ),
          ElevatedButton(onPressed: (){}, child: Text('Add to Cart'),style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(TSizes.md),
            backgroundColor: TColors.black,
            side: BorderSide(color: TColors.black)
          ),)
        ],
      ),
    );
  }
}