import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/common/widgets/appbar/tabbar.dart';
import 'package:e_shop/common/widgets/brands/card.dart';
import 'package:e_shop/common/widgets/custom_shape/containers/rounded_containe.dart';
import 'package:e_shop/common/widgets/layouts/grid_layout.dart';
import 'package:e_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_shop/common/widgets/texts/heading_title.dart';
import 'package:e_shop/features/shop/screens/brands/all_brands.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/cart/cart_count_icon.dart';
import '../../../../common/widgets/search/search_bar.dart';


class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title:const Text('Store'),
          actions: [
            TCartCounterIcon(onPressed: (){})
          ],
        ),
        body: NestedScrollView(headerSliverBuilder: (_,innerBoxIsScrolled){
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 440,
              backgroundColor: THelperFunctions.isDarkMode(context)?TColors.black:TColors.white,
            flexibleSpace: Padding(padding:const EdgeInsets.all(TSizes.defaultSpace),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
           const     SizedBox(height: TSizes.spaceBtwItems,),
          const      Searchbar(text: 'Search in Store',showBorder: true,showBackground: false,padding: EdgeInsets.zero,),
           const     SizedBox(height: TSizes.spaceBtwItems,),
               HeadingTitle(title: 'Featured Brands',showActionButton: true,buttonTitle: 'View All',onPressed: ()=>Get.to(()=>const AllBrandsScreen()),),
          const       SizedBox(height: TSizes.spaceBtwItems/2),
             TGridLayout(itemCount: 4, mainAxisExtent: 80,itemBuilder: (_,index){
              return    const TBrandCard(showBorder: false,);
             })
              ],
            ),
            ),
            bottom: const TTabBar(
              
              tabs: [
      Tab(child: Text('Sports'),),
      Tab(child: Text('Furniture'),),
      Tab(child: Text('Electronics'),),
      Tab(child: Text('Clothes'),),
      Tab(child: Text('Clothes'),)
            ]),
            )
          ];
        }, body:  TabBarView(children: [
          ListView(
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            children: [Padding(padding:const EdgeInsets.all(TSizes.defaultSpace), child: Column(
              children: [
            
                const TBrandShowcase(images: [
                  TImages.books,
                  TImages.electronic,
                  TImages.fashion
                ],),
                HeadingTitle(title: 'You might like',showActionButton: true,onPressed: (){}, ),
                const SizedBox(height: TSizes.spaceBtwItems,),
                TGridLayout(itemCount: 4, itemBuilder: (_,index)=>const ProductCardVertical()),
                const SizedBox(height: TSizes.spaceBtwSections,)
              ],
            ),)],
          ),

           const Padding(padding:EdgeInsets.all(TSizes.defaultSpace), child: Column(
            children: [
              TBrandShowcase(images: [
                TImages.books,
                TImages.electronic,
                TImages.fashion
              ],)
            ],
          ),),
           const Padding(padding:EdgeInsets.all(TSizes.defaultSpace), child: Column(
            children: [
              TBrandShowcase(images: [
                TImages.books,
                TImages.electronic,
                TImages.fashion
              ],)
            ],
          ),),
           const Padding(padding:EdgeInsets.all(TSizes.defaultSpace), child: Column(
            children: [
              TBrandShowcase(images: [
                TImages.books,
                TImages.electronic,
                TImages.fashion
              ],)
            ],
          ),),
           const Padding(padding:EdgeInsets.all(TSizes.defaultSpace), child: Column(
            children: [
              TBrandShowcase(images: [
                TImages.books,
                TImages.electronic,
                TImages.fashion
              ],)
            ],
          ),)
        ],)),
      ),
    );
  }
}

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key, required this.images,
  });
final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(
        bottom: TSizes.spaceBtwItems
      ),
      child: Column(
        children: [
        const  TBrandCard(showBorder: false,),
          Row(
            children: images.map((url) => brandTopProductImageWidget(url, context)).toList()
          )
        ],
      ),
    );
  }
  Widget brandTopProductImageWidget(String image,context){
    return Expanded(child: TRoundedContainer(
      height: 100,
      padding:const EdgeInsets.all(TSizes.md),
      margin:const EdgeInsets.only(right: TSizes.sm),
      backgroundColor: THelperFunctions.isDarkMode(context)?TColors.darkerGrey:TColors.light,
      child: Image(image: AssetImage(image),fit: BoxFit.contain,),
    ));
  }
}