import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/common/widgets/layouts/grid_layout.dart';
import 'package:e_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_shop/features/shop/screens/all_products/all_products.dart';
import 'package:e_shop/features/shop/screens/cart/cart.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:e_shop/utils/device/device_utility.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shape/containers/circular_container.dart';
import '../../../../common/widgets/custom_shape/containers/curved_edge_widget.dart';
import '../../../../common/widgets/texts/heading_title.dart';
import '../../../../utils/constants/colors.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
             TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppbar(),
                  SizedBox(height: TSizes.spaceBtwSections,),
                  Searchbar(text: 'Search in Store',),
                  SizedBox(height: TSizes.spaceBtwSections,),
                  Padding(padding: EdgeInsets.only(left: TSizes.defaultSpace),child: Column(
                    children: [
                  HeadingTitle(title:  'Popular Categories',onPressed: ()=>Get.to(()=>AllProducts()),),
                    SizedBox(height: TSizes.spaceBtwItems,),
                      THomeCategories(
                        
                      )
                    ],
                  ),)
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
            child: TPromoSlider(
              banners: [
                TImages.books,
                TImages.fashion,
                TImages.home
              ],
            )
            ),
            HeadingTitle(title: 'Popular Product',showActionButton: true,buttonTitle: 'View All',onPressed: ()=>Get.to(()=>AllProducts()),),
            TGridLayout(itemCount: 4, itemBuilder: (_,index)=>const ProductCardVertical()),

            
          ],
        ),
      )
    );
  }
}


class Searchbar extends StatelessWidget {
  const Searchbar({
    super.key, required this.text, this.icon,  this.showBackground=true,  this.showBorder=true,  this.padding=const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });
final String text;
final IconData? icon;
final bool showBackground,showBorder;
final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Padding(padding: padding,
    child: Container(width: TDeviceUtility.getScreenWidth(context), padding: const EdgeInsets.all(TSizes.md), decoration: BoxDecoration(color:showBackground?dark?TColors.white:TColors.light:Colors.transparent,borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
    border:showBorder? Border.all(color: TColors.grey):null
    ),
    child: Row(
      children: [
      const  Icon(Iconsax.search_normal,color: TColors.darkerGrey,),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Text(text,style: Theme.of(context).textTheme.bodySmall,)
      ],
    ),
    ),
    );
  }
}

class THomeAppbar extends StatelessWidget {
  const THomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),),
          Text(TTexts.homeAppbarSubTitle,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),)
        ],
      ),
      actions: [
        TCartCounterIcon( onPressed: ()=>Get.to(()=>CartScreen()),)
      ],
    );
  }
}

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key, required this.onPressed, this.iconColor=TColors.white,
  });
final VoidCallback onPressed;
final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon:  Icon(Iconsax.shopping_bag,color: iconColor,)),
        Positioned(
          right: 0,
          child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(color: TColors.black, borderRadius: BorderRadius.circular(100)),
       child: Center(
        child: Text('4',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white,fontSizeFactor: .8),),
       ) ))
      ],
    );
  }
}

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, this.child,
  });
 final Widget? child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(child: Container(
            color: TColors.primary,
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              height: 400,
              child: Stack(children: [
               Positioned(
    top: -150,
    right: -250,
    child: TCircularContainer(
      backgroundColor: TColors.white.withOpacity(.1),
    )),
    Positioned(
      top: 100,
      right: -300,
      child: TCircularContainer(
        backgroundColor: TColors.white.withOpacity(.1),
      ),
    ),
    child!
              ],),
            ),

          ),);
  }
}
