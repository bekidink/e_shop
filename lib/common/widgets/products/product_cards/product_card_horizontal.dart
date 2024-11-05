import 'package:e_shop/common/widgets/brands/brand_title.dart';
import 'package:e_shop/common/widgets/custom_shape/containers/rounded_containe.dart';
import 'package:e_shop/common/widgets/icons/circular_icon.dart';
import 'package:e_shop/common/widgets/image/rounded_image.dart';
import 'package:e_shop/common/widgets/products/product_cards/poduct_price_title.dart';
import 'package:e_shop/common/widgets/products/product_cards/product_title.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/shadow.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Container(
width: 310,
padding: const EdgeInsets.all(1),
decoration: BoxDecoration(
  boxShadow: [TShadowStyle.horizontalProductShadow],
  borderRadius: BorderRadius.circular(TSizes.productImageRadius),
  color: dark?TColors.darkerGrey:TColors.lightContainer
),
child: Row(
  children: [
    TRoundedContainer(
      height: 120,
      padding: const EdgeInsets.all(TSizes.sm),
      backgroundColor: dark?TColors.black:TColors.light,
      child: Stack(
        children: [
          const SizedBox(
            height: 120,
            width: 120,
            child: RoundedImage(imageUrl: TImages.fashion,applyImageRadius: true,)),

Positioned(child: TRoundedContainer(
  radius: TSizes.sm,
  backgroundColor: TColors.secondary.withOpacity(0.8),
  padding: const EdgeInsets.symmetric(
    horizontal: TSizes.sm,vertical: TSizes.xs
  ),
  child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
)),
const Positioned(
  top: 0,
  right: 0,
  child: TCircularIcon(icon: Iconsax.heart5,color: Colors.red,))
        ],
      ),
    )
  ,SizedBox(
    width: 172,
    child: Padding(
      padding:  const EdgeInsets.only(top: TSizes.sm,left: TSizes.sm),
      child: Column(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductTitle(title: 'Green Nike half Sleeves Shirt',smallSize: true,),
              SizedBox(height: TSizes.spaceBtwItems/2,),
              TBrandTitleWithVerifiedIcon(title: 'Nike')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(child: TProductPriceText(price: '200')),
              Container(
                decoration: const BoxDecoration(
                  color: TColors.dark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(TSizes.cardRadiusMd),
                    bottomRight: Radius.circular(TSizes.productImageRadius)
                  )
                ),
                child: const SizedBox(
                  height: TSizes.iconLg*1.2,
                  width: TSizes.iconLg*1.2,
                  child: Center(
                  child: Icon(Iconsax.add,color: TColors.white,),
                ),),
              )
            ],
          )
        ],
      ),
    ),
  )
  ],
),
    );
  }
}