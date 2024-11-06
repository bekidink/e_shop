import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_shop/features/shop/controllers/image_controller.dart';
import 'package:e_shop/features/shop/models/product_model.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shape/containers/curved_edge_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/image/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/size.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key, required this.product});
 final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    final controller=Get.put(ImagesController());
    final images=controller.getAllProductImages(product);
    return      TCurvedEdgeWidget(
              child: Container(
                color:dark?TColors.darkerGrey:TColors.light ,
                child: Stack(
                  children: [
                     SizedBox(
                      height: 400,
                      child: Padding(
                        padding: EdgeInsets.all(TSizes.productImageRadius*2),
                        child: Center(child: Obx((){
                          final image=controller.selectedProductImage.value;
                          return GestureDetector(
                            onTap: ()=> controller.showEnlargedImage(image),
                            child: CachedNetworkImage(imageUrl: image,progressIndicatorBuilder: (_,__,downloadProgress)=>CircularProgressIndicator(value: downloadProgress.progress, color: TColors.primary,),));
                        } )),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 30,
                      left: TSizes.defaultSpace,
                      child: SizedBox(
                        height: 80,
                        child: ListView.separated( shrinkWrap: true,scrollDirection: Axis.horizontal,physics: const AlwaysScrollableScrollPhysics(),itemBuilder: (_,index)=>Obx((){
                        final selectedImages=controller.selectedProductImage.value==images[index];
                        return  RoundedImage( isNetworkImage: true,width: 80,backgroundColor: dark?TColors.dark:TColors.white,border: Border.all(color:selectedImages? TColors.primary:Colors.transparent),padding: const EdgeInsets.all(TSizes.sm),imageUrl: images[index],onPressed:()=> controller.selectedProductImage.value=images[index],);
                        }), separatorBuilder: (_,__)=>const SizedBox(width: TSizes.spaceBtwItems,), itemCount: images.length)),
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