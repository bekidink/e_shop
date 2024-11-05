
import 'package:e_shop/features/shop/screens/categories/sub-categories/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image/vertical_I_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_,index){
      return   TVerticalImageText( image: TImages.electronic, title: 'Shop categories', textColor: TColors.white,onTap: ()=>Get.to(()=>const SubCategoriesScreen()),);
      }),
    );
  }
}