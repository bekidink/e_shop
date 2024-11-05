import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/common/widgets/brands/card.dart';
import 'package:e_shop/common/widgets/layouts/grid_layout.dart';
import 'package:e_shop/common/widgets/texts/heading_title.dart';
import 'package:e_shop/features/shop/screens/brands/brand_products.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar( title: Text('Brand'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            const HeadingTitle(title: 'Brands'),
            const SizedBox(height: TSizes.spaceBtwItems,),
            TGridLayout(itemCount: 20, mainAxisExtent: 80,itemBuilder: (_,index)=>TBrandCard(showBorder: true, onTap: ()=>Get.to(()=>const BrandProducts()),))
          ],
        ),
        ),
      ),

    );
  }
}