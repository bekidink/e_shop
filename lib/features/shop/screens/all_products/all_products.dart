import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/common/widgets/layouts/grid_layout.dart';
import 'package:e_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_shop/common/widgets/shimmer/vertical_shimmer.dart';
import 'package:e_shop/features/shop/controllers/all_product.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});
  final String title;
  final Query?query;
  final Future<List<ProductModel>>?futureMethod;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(AllProductsController());
    return  Scaffold(
      appBar: TAppBar(title: Text('Popular Products',),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: FutureBuilder(
          future: futureMethod??controller.fetchProductsByQuery(query),
          builder: (context,snapshot) {
            const loader=TVerticalShimmer(itemCount: 4,);
            if(snapshot.connectionState==ConnectionState.waiting){
              return loader;
            }
            if(!snapshot.hasData || snapshot.data==null || snapshot.data!.isEmpty){
              return const Center(child: Text('No Data Found!'),);
            }
            if(snapshot.hasError){
              return Center(child: Text('Something went wrong'),);
            }
            final products=snapshot.data;
            return TSortableProducts(products: products!,);
          }
        ),
        ),
      ),
    );
  }
}

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key, required this.products,
  });
final List<ProductModel>products;
  @override
  Widget build(BuildContext context) {

    final controller=Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: [
        'Name',
        'Higher Price',
        'Lower Price',
        'Sale',
        'Popularity'
        ].map((e) =>DropdownMenuItem( value: e,child: Text(e)) ).toList(), onChanged: (value){
          controller.sortProducts(value!);
        }),
        const SizedBox(height: TSizes.spaceBtwSections,),
        TGridLayout(itemCount: 4, itemBuilder: (_,index)=> ProductCardVertical(product: controller.products[index],))
      ],
    );
  }
}