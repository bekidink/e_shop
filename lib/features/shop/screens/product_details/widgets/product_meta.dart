import 'package:e_shop/common/widgets/brands/brand_title.dart';
import 'package:e_shop/common/widgets/custom_shape/containers/rounded_containe.dart';
import 'package:e_shop/common/widgets/image/circular_image.dart';
import 'package:e_shop/common/widgets/products/product_cards/poduct_price_title.dart';
import 'package:e_shop/common/widgets/products/product_cards/product_title.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/enums.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
Row(
  children: [
    TRoundedContainer(
      radius: TSizes.sm,
      backgroundColor:TColors.secondary.withOpacity(.8) ,
      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
      child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
    ),
    const SizedBox(width: TSizes.spaceBtwItems,),
    Text('\$300',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
    const SizedBox(width: TSizes.spaceBtwItems,),
    const TProductPriceText(price: '200',isLarge: true,)
  ],
),
const SizedBox(height: TSizes.spaceBtwItems/1.5,),
const ProductTitle(title: 'Green Nike Sports Shirt'),
const SizedBox(height: TSizes.spaceBtwItems/1.5,),
Row(
  children: [
    const ProductTitle(title: 'Status'),
    const SizedBox(width: TSizes.spaceBtwItems,),
    Text('In Stock',style: Theme.of(context).textTheme.titleMedium,)
  ],
),
const SizedBox(height: TSizes.spaceBtwItems/1.5,),
Row(
  children: [
    TCircularImage(image: TImages.books,width: 32,height: 32,overlayColor: dark?TColors.white:TColors.black,),
    const TBrandTitleWithVerifiedIcon(title: 'Books',brandTextSize: TextSizes.medium,),
  ],
),

      ],
    );
  }
}