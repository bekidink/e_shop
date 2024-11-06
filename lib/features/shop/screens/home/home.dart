import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/common/widgets/layouts/grid_layout.dart';
import 'package:e_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_shop/common/widgets/shimmer/vertical_shimmer.dart';
import 'package:e_shop/features/shop/controllers/product_controller.dart';
import 'package:e_shop/features/shop/screens/all_products/all_products.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../common/widgets/custom_shape/containers/circular_container.dart';
import '../../../../common/widgets/custom_shape/containers/curved_edge_widget.dart';
import '../../../../common/widgets/search/search_bar.dart';
import '../../../../common/widgets/texts/heading_title.dart';
import '../../../../utils/constants/colors.dart';
import 'widgets/home_app.dart';
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
    final controller=Get.put(ProductController());
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
             TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const THomeAppbar(),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  const Searchbar(text: 'Search in Store',),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  Padding(padding: const EdgeInsets.only(left: TSizes.defaultSpace),child: Column(
                    children: [
                  HeadingTitle(title:  'Popular Categories',onPressed: ()=>Get.to(()=> AllProducts(title: 'Popular Products',query: FirebaseFirestore.instance.collection('Products').where('IFeatured',isEqualTo: true).limit(6),
                  futureMethod: controller.fetchFeaturedAllProducts(),
                  )),),
                    const SizedBox(height: TSizes.spaceBtwItems,),
                      const THomeCategories( )
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
            HeadingTitle(title: 'Popular Product',showActionButton: true,buttonTitle: 'View All',onPressed: ()=>Get.to(()=> AllProducts(title: 'Popular Products',query: FirebaseFirestore.instance.collection('Products').where('IFeatured',isEqualTo: true).limit(6),
                  futureMethod: controller.fetchFeaturedAllProducts(),
                  )),),
            Obx((){
if(controller.isLoading.value) return const TVerticalShimmer(itemCount: 6);
if(controller.featureProducts.isEmpty){
  return Center(child: Text('No Data Found!',style: Theme.of(context).textTheme.bodyMedium,),);
}

             return TGridLayout(itemCount: controller.featureProducts.length, itemBuilder: (_,index)=> ProductCardVertical(product: controller.featureProducts[index],));
            } ),

            
          ],
        ),
      )
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
