import 'package:e_shop/common/widgets/cart/bottom_to_cart.dart';
import 'package:e_shop/common/widgets/texts/heading_title.dart';
import 'package:e_shop/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_shop/features/shop/screens/product_details/widgets/product_i_slider.dart';
import 'package:e_shop/features/shop/screens/product_details/widgets/product_meta.dart';
import 'package:e_shop/features/shop/screens/product_reviews/product_review.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import 'widgets/rating_share.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return  Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
       const ProductImageSlider(),
       Padding(padding: const EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace,bottom: TSizes.defaultSpace),child: Column(children: [
        const TRatingAndShare(),
        const TProductMetaData(),
        const TProductAttributes(),
        const SizedBox(height: TSizes.spaceBtwSections,),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child:const Text('Checkout') ),),
        const SizedBox(height: TSizes.spaceBtwItems,),
        const HeadingTitle(title: 'Description',showActionButton: false,),
        const SizedBox(height: TSizes.spaceBtwItems,),
        const ReadMoreText('A Flutter plugin that allows for expanding and collapsing text with the added capability to style and interact with specific patterns in the text like hashtags, URLs, and mentions using the new Annotation feature.',trimLines: 2, moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800), lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),trimMode: TrimMode.Line, trimCollapsedText: 'Show More', trimExpandedText: 'Less',),
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
