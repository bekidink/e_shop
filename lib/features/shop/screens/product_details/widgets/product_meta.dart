import 'package:e_shop/common/widgets/brands/brand_title.dart';
import 'package:e_shop/common/widgets/custom_shape/containers/rounded_containe.dart';
import 'package:e_shop/common/widgets/image/circular_image.dart';
import 'package:e_shop/common/widgets/products/product_cards/poduct_price_title.dart';
import 'package:e_shop/common/widgets/products/product_cards/product_title.dart';
import 'package:e_shop/features/shop/controllers/product_controller.dart';
import 'package:e_shop/features/shop/models/product_model.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/enums.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});
 final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    final controller=ProductController.instance;
    final salePercentage=controller.calculateSalePercentage(product.price,product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
Row(
  children: [
    TRoundedContainer(
      radius: TSizes.sm,
      backgroundColor:TColors.secondary.withOpacity(.8) ,
      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
      child: Text(salePercentage.toString(),style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
    ),
    const SizedBox(width: TSizes.spaceBtwItems,),
    if(product.productType==ProductType.single.toString() && product.salePrice>0)
    Text('\$${product.price}',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
    if(product.productType==ProductType.single.toString() && product.salePrice>0) const SizedBox(width: TSizes.spaceBtwItems,),
      TProductPriceText(price: controller.getProductPrice(product),isLarge: true,)
  ],
),
const SizedBox(height: TSizes.spaceBtwItems/1.5,),
 ProductTitle(title: product.title),
const SizedBox(height: TSizes.spaceBtwItems/1.5,),
Row(
  children: [
    const ProductTitle(title: 'Status'),
    const SizedBox(width: TSizes.spaceBtwItems,),
    Text(controller.getProductStockStatus(product.stock),style: Theme.of(context).textTheme.titleMedium,)
  ],
),
const SizedBox(height: TSizes.spaceBtwItems/1.5,),
Row(
  children: [
    TCircularImage(image: product.brand!=null? product.brand!.image:'',width: 32,height: 32,isNetworkImage: true,overlayColor: dark?TColors.white:TColors.black,),
     TBrandTitleWithVerifiedIcon(title: product.brand!=null? product.brand!.name:'',brandTextSize: TextSizes.medium,),
  ],
),

      ],
    );
  }
}