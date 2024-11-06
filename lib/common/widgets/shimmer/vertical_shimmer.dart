import 'package:e_shop/common/widgets/layouts/grid_layout.dart';
import 'package:e_shop/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';

class TVerticalShimmer extends StatelessWidget {
  const TVerticalShimmer({super.key, required this.itemCount});
final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount:itemCount ,
      itemBuilder: (_,__)=>SizedBox(
        width: 100,
        child: Column(
          children: [
            TShimmerEffect(width: 180, height: 180),
            SizedBox(height: TSizes.spaceBtwItems,),
            TShimmerEffect(width: 160, height: 15),
            SizedBox(height: TSizes.spaceBtwItems/2,),
            TShimmerEffect(width: 110, height: 15)
          ],
        ),
      ),
    );
  }
}