import 'package:e_shop/common/widgets/cart/bottom_to_cart.dart';
import 'package:e_shop/common/widgets/texts/heading_title.dart';
import 'package:e_shop/features/shop/models/product_model.dart';
import 'package:e_shop/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_shop/features/shop/screens/product_details/widgets/product_i_slider.dart';
import 'package:e_shop/features/shop/screens/product_details/widgets/product_meta.dart';
import 'package:e_shop/features/shop/screens/product_reviews/product_review.dart';
import 'package:e_shop/utils/constants/enums.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import 'widgets/rating_share.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    print(product);
    return  Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
        ProductImageSlider(product: product,),
       Padding(padding: const EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace,bottom: TSizes.defaultSpace),child: Column(children: [
        const TRatingAndShare(),
         TProductMetaData(product: product,),
        if(product.productType=="ProductType.variable")  TProductAttributes( product: product,),
        if(product.productType=="ProductType.variable") const SizedBox(height: TSizes.spaceBtwSections,),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child:const Text('Checkout') ),),
        const SizedBox(height: TSizes.spaceBtwItems,),
        const HeadingTitle(title: 'Description',showActionButton: false,),
        const SizedBox(height: TSizes.spaceBtwItems,),
         ReadMoreText(product.description??'',trimLines: 2, moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800), lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),trimMode: TrimMode.Line, trimCollapsedText: 'Show More', trimExpandedText: 'Less',),
        const Divider(),
        const SizedBox(height: TSizes.spaceBtwItems,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeadingTitle(title: 'Review(10)',showActionButton: true,),
            IconButton(onPressed: ()=>Get.to(()=>const ProductReview()), icon: const Icon(Iconsax.arrow_right_3,))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwSections,)
       ],),)
          ],
        ),
      ),
    );
  }
}
