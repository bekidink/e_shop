import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shape/containers/curved_edge_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/image/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/size.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return      TCurvedEdgeWidget(
              child: Container(
                color:dark?TColors.darkerGrey:TColors.light ,
                child: Stack(
                  children: [
                    const SizedBox(
                      height: 400,
                      child: Padding(
                        padding: EdgeInsets.all(TSizes.productImageRadius*2),
                        child: Center(child: Image(image: AssetImage(TImages.electronic))),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 30,
                      left: TSizes.defaultSpace,
                      child: SizedBox(
                        height: 80,
                        child: ListView.separated( shrinkWrap: true,scrollDirection: Axis.horizontal,physics: const AlwaysScrollableScrollPhysics(),itemBuilder: (_,index)=>RoundedImage( width: 80,backgroundColor: dark?TColors.dark:TColors.white,border: Border.all(color: TColors.primary),padding: const EdgeInsets.all(TSizes.sm),imageUrl: TImages.fashion), separatorBuilder: (_,__)=>const SizedBox(width: TSizes.spaceBtwItems,), itemCount: 4)),
                    ),
                    const TAppBar(
                      showBackArrow: true,
                      actions: [
                        TCircularIcon(icon: Iconsax.heart5,color: Colors.red,)
                      ],
                    )
                    
                  ],
                ),
              ),
            )
       
       ;
  }
}