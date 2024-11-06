import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/common/widgets/brands/card.dart';
import 'package:e_shop/features/shop/screens/all_products/all_products.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Nike'),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TBrandCard(showBorder: true,),
            SizedBox(height: TSizes.spaceBtwSections,),
            // TSortableProducts()
          ],
        ),
        ),
      ),
    );
  }
}