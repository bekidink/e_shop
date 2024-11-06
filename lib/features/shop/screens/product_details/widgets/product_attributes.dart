import 'package:e_shop/common/widgets/chips/choice_chip.dart';
import 'package:e_shop/common/widgets/custom_shape/containers/rounded_containe.dart';
import 'package:e_shop/common/widgets/products/product_cards/poduct_price_title.dart';
import 'package:e_shop/common/widgets/products/product_cards/product_title.dart';
import 'package:e_shop/common/widgets/texts/heading_title.dart';
import 'package:e_shop/features/shop/controllers/variation_controller.dart';
import 'package:e_shop/features/shop/models/product_model.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});
 final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    final controller=Get.put(VariationController());
    return Column(
      children: [
        if(controller.selectedVariation.value.id.isNotEmpty)
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
                          Text('\$${controller.selectedVariation.value.price}',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                          const SizedBox(width: TSizes.spaceBtwItems,),
                           TProductPriceText(price: '${controller.getVariationPrice()}')
                        ],
                      ),
                      Row(
                        children: [
                          const ProductTitle(title: 'Stock'),
                          Text(controller.variationStockStatus.value,style: Theme.of(context).textTheme.titleMedium,)
                        ],
                      )
                    ],
                  )
               
               
               
                ],
              ),
               ProductTitle(title: controller.selectedVariation.value.description!,smallSize: true, maxLines: 4,)
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children:
         product.productAttributes!.map((attr) =>Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             HeadingTitle(title: attr.name??''),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Obx(
              ()=> Wrap(
                spacing: 8,
                children:attr.values!.map((attrValue) {
                  final isSelected=controller.selectedAttributes[attr.name];
                  final available=controller.getAttributesAvailabilityInVariation(product.productVariations!, attr.name!).contains(attrValue);
              
               return   TChoiceChip(text: attrValue, selected: isSelected??false,onSelected: available? (value){
                if(value && available){
                  controller.onAttributeSelected(product, attr.name??'', attrValue);
                }
               }:null,);
                }, ).toList()
                
                
              ),
            )
            
          ],
        ),
       
        ).toList(),),
        
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const HeadingTitle(title: 'Colors'),
//             const SizedBox(height: TSizes.spaceBtwItems,),
//             Wrap(
//               spacing: 8,
//               children: [
//  TChoiceChip(text: 'EU 34', selected: true,onSelected: (value){},),
//             TChoiceChip(text: 'EU 36', selected: true,onSelected: (value){}),
//             TChoiceChip(text: 'EU 38', selected: true,onSelected: (value){}),
//               ],
//             )
           
//           ],
//         )
    
    
    
      ],
    );
  }
}