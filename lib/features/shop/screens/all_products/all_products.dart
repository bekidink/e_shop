import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/common/widgets/layouts/grid_layout.dart';
import 'package:e_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Popular Products',),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TSortableProducts(),
        ),
      ),
    );
  }
}

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        ].map((e) =>DropdownMenuItem( value: e,child: Text(e)) ).toList(), onChanged: (value){}),
        const SizedBox(height: TSizes.spaceBtwSections,),
        TGridLayout(itemCount: 4, itemBuilder: (_,index)=>const ProductCardVertical())
      ],
    );
  }
}