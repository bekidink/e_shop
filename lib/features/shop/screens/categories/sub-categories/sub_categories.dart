import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/common/widgets/image/rounded_image.dart';
import 'package:e_shop/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:e_shop/common/widgets/texts/heading_title.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Sports ',),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            RoundedImage(imageUrl: TImages.electronic,width: double.infinity,applyImageRadius: true,),
            SizedBox(height: TSizes.spaceBtwSections,),
            Column(
              children: [
                HeadingTitle(title: 'Sports shirts',onPressed: (){},),
                const SizedBox(height: TSizes.spaceBtwItems/2,),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    shrinkWrap: true,
                    separatorBuilder: (_,__)=>SizedBox(width: TSizes.spaceBtwItems,),
                    itemBuilder: (_,index) {
                      return ProductCardHorizontal();
                    }
                  ),
                )
              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}