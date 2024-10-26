import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/common/widgets/brands/brand_title.dart';
import 'package:e_shop/common/widgets/icons/circular_icon.dart';
import 'package:e_shop/common/widgets/image/rounded_image.dart';
import 'package:e_shop/common/widgets/products/product_cards/poduct_price_title.dart';
import 'package:e_shop/common/widgets/products/product_cards/product_title.dart';
import 'package:e_shop/features/shop/screens/checkout/checkout.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall,),),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: CartItems(dark: dark),
        ),
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      child: ElevatedButton(onPressed: ()=>Get.to(()=>CheckoutScreen()), child: Text('Checkout \256.0')),
      ),
    );
  }
}

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    required this.dark,  this.showIcons=true,
  });

  final bool dark,showIcons;
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_,index)=>Column(
      children: [
        CartItem(),
        SizedBox(height: TSizes.spaceBtwItems,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 70,),
           if(showIcons) TCartQuantity(dark: dark),
          if(showIcons)  TProductPriceText(price: '300')
    
          ],
        )
      ],
    ), separatorBuilder:  (_,__)=>SizedBox(height: TSizes.spaceBtwSections,), itemCount: 4);
  }
}

class TCartQuantity extends StatelessWidget {
  const TCartQuantity({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          TCircularIcon(icon: Iconsax.minus,width: 32,height: 32,size: TSizes.md, color:dark?TColors.white:TColors.black , backgroundColor: dark?TColors.darkerGrey:TColors.light,),
          SizedBox(width: TSizes.spaceBtwItems,),
          Text('3',style: Theme.of(context).textTheme.titleSmall,),
          SizedBox(width: TSizes.spaceBtwItems,),
          TCircularIcon(icon: Iconsax.add,width: 32,height: 32,size: TSizes.md, color:dark?TColors.white:TColors.black , backgroundColor: dark?TColors.darkerGrey:TColors.light,),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedImage(
          padding: EdgeInsets.all(TSizes.sm),
          imageUrl: TImages.fashion,width: 60,height: 60,),
          SizedBox(width: TSizes.spaceBtwItems,),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TBrandTitleWithVerifiedIcon(title: 'Nike'),
                ProductTitle(title: 'Black Sports shoes'),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: 'Color',style: Theme.of(context).textTheme.bodySmall
                    ),
                     TextSpan(
                      text: 'Green',style: Theme.of(context).textTheme.bodyLarge
                    ),
                     TextSpan(
                      text: 'Size',style: Theme.of(context).textTheme.bodySmall
                    ),
                     TextSpan(
                      text: 'UK 08',style: Theme.of(context).textTheme.bodyLarge
                    )
                  ])
                )
              ],
            ),
          )
      ],
    );
  }
}