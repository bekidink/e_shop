import 'package:e_shop/common/widgets/chips/choice_chip.dart';
import 'package:e_shop/common/widgets/custom_shape/containers/rounded_containe.dart';
import 'package:e_shop/common/widgets/products/product_cards/poduct_price_title.dart';
import 'package:e_shop/common/widgets/products/product_cards/product_title.dart';
import 'package:e_shop/common/widgets/texts/heading_title.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          backgroundColor: dark?TColors.darkerGrey:TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const HeadingTitle(title: 'Variation',showActionButton: false,),
                  const SizedBox(width: TSizes.spaceBtwItems,),
                 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                           const ProductTitle(title: 'Price',smallSize: true,),
                           const SizedBox(width: TSizes.spaceBtwItems,),
                          Text('\$25',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                          const SizedBox(width: TSizes.spaceBtwItems,),
                          const TProductPriceText(price: '20')
                        ],
                      ),
                      Row(
                        children: [
                          const ProductTitle(title: 'Stock'),
                          Text('In Stock',style: Theme.of(context).textTheme.titleMedium,)
                        ],
                      )
                    ],
                  )
                ],
              ),
              const ProductTitle(title: 'This is the Description of the Product and it can go upto max 4 lines',smallSize: true, maxLines: 4,)
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingTitle(title: 'Colors'),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Wrap(
              spacing: 8,
              children: [
TChoiceChip(text: 'Green', selected: true,onSelected: (value){},),
            TChoiceChip(text: 'Blue', selected: true,onSelected: (value){}),
            TChoiceChip(text: 'Yellow', selected: true,onSelected: (value){}),
              ],
            )
            
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingTitle(title: 'Colors'),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Wrap(
              spacing: 8,
              children: [
 TChoiceChip(text: 'EU 34', selected: true,onSelected: (value){},),
            TChoiceChip(text: 'EU 36', selected: true,onSelected: (value){}),
            TChoiceChip(text: 'EU 38', selected: true,onSelected: (value){}),
              ],
            )
           
          ],
        )
      ],
    );
  }
}