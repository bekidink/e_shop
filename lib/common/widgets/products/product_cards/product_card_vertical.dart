import 'package:e_shop/common/widgets/brands/brand_title.dart';
import 'package:e_shop/common/widgets/custom_shape/containers/rounded_containe.dart';
import 'package:e_shop/common/widgets/icons/circular_icon.dart';
import 'package:e_shop/common/widgets/image/rounded_image.dart';
import 'package:e_shop/common/widgets/products/product_cards/poduct_price_title.dart';
import 'package:e_shop/common/widgets/products/product_cards/product_title.dart';
import 'package:e_shop/features/shop/controllers/product_controller.dart';
import 'package:e_shop/features/shop/models/product_model.dart';
import 'package:e_shop/features/shop/screens/product_details/product_detail.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/enums.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/shadow.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    final controller=Get.put(ProductController());
    final salePercentage=controller.calculateSalePercentage(product.price, product.salePrice);
    return GestureDetector(
      onTap: ()=>Get.to(()=> ProductDetail(product:product)),
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
               RoundedImage(imageUrl: product.thumbnail,applyImageRadius: true,isNetworkImage: true,),
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                  radius: TSizes.sm,
                  backgroundColor: TColors.secondary.withOpacity(.8),
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                  child: Text(salePercentage.toString(),style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
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
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 ProductTitle(title: product.title),
                  const SizedBox(height: TSizes.xs,),
                  
                  TBrandTitleWithVerifiedIcon(title: product.brand!.name),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            if(product.productType== ProductType.single.toString() && product.salePrice>0)
                             Padding(
                              padding: const EdgeInsets.only(left: TSizes.sm),
                              child: TProductPriceText(price:product.price.toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: TSizes.sm),
                              child: TProductPriceText(price:controller.getProductPrice(product)),
                            ),
                          ],
                        ),
                      ),
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
            ),
            )
          ],
        ),
      ),
    );
  }
}