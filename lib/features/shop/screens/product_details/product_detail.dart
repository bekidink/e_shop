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
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
       ProductImageSlider(),
       Padding(padding: EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace,bottom: TSizes.defaultSpace),child: Column(children: [
        TRatingAndShare(),
        TProductMetaData(),
        TProductAttributes(),
        SizedBox(height: TSizes.spaceBtwSections,),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child:Text('Checkout') ),),
        SizedBox(height: TSizes.spaceBtwItems,),
        HeadingTitle(title: 'Description',showActionButton: false,),
        SizedBox(height: TSizes.spaceBtwItems,),
        ReadMoreText('A Flutter plugin that allows for expanding and collapsing text with the added capability to style and interact with specific patterns in the text like hashtags, URLs, and mentions using the new Annotation feature.',trimLines: 2, moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800), lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),trimMode: TrimMode.Line, trimCollapsedText: 'Show More', trimExpandedText: 'Less',),
        Divider(),
        SizedBox(height: TSizes.spaceBtwItems,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadingTitle(title: 'Review(10)',showActionButton: true,),
            IconButton(onPressed: ()=>Get.to(()=>ProductReview()), icon: Icon(Iconsax.arrow_right_3,))
          ],
        ),
        SizedBox(height: TSizes.spaceBtwSections,)
       ],),)
          ],
        ),
      ),
    );
  }
}
