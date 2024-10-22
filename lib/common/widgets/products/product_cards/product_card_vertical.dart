import 'package:e_shop/common/widgets/brands/brand_title.dart';
import 'package:e_shop/common/widgets/custom_shape/containers/rounded_containe.dart';
import 'package:e_shop/common/widgets/icons/circular_icon.dart';
import 'package:e_shop/common/widgets/image/rounded_image.dart';
import 'package:e_shop/common/widgets/products/product_cards/poduct_price_title.dart';
import 'package:e_shop/common/widgets/products/product_cards/product_title.dart';
import 'package:e_shop/features/shop/screens/product_details/product_detail.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/shadow.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=>Get.to(()=>const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            TShadowStyle.veticalProductShadow
          ],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
      color: dark?TColors.darkerGrey:TColors.white
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 167,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark?TColors.black:TColors.light,
            child: Stack(
              children: [
             const  RoundedImage(imageUrl: TImages.fashion),
                Positioned(child: TRoundedContainer(
                  radius: TSizes.sm,
                  backgroundColor: TColors.secondary.withOpacity(.8),
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                  child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                )),
           const    Positioned(
                top: 0,
                right: 0,
                child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red,))
              ],
            ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems/2),
            Padding(padding:const EdgeInsets.only(left: TSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             const   ProductTitle(title: 'Green Nike Air Shoes'),
                const SizedBox(height: TSizes.xs,),
                
              const  TBrandTitleWithVerifiedIcon(title: 'Nike'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   const TProductPriceText(price: '45'),
                    Container(decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.productImageRadius)
                      )
                    ),child: const SizedBox(
                      width: TSizes.iconLg*1.2,
                      height: TSizes.iconLg*1.2,
                      child: Icon(Iconsax.add,color: TColors.white,),
                    ),)
                  ],
                )
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}