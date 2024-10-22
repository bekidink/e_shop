import 'package:flutter/material.dart';

import '../../../utils/constants/size.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({super.key, required this.itemCount, this.mainAxisExtent=288, required this.itemBuilder});
final int itemCount;
final double? mainAxisExtent;
final Widget? Function(BuildContext,int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder( padding: EdgeInsets.zero,physics:const NeverScrollableScrollPhysics(),itemCount: itemCount,shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: TSizes.gridViewSpace,crossAxisSpacing: TSizes.gridViewSpace,mainAxisExtent: mainAxisExtent), itemBuilder: itemBuilder);
  }
}