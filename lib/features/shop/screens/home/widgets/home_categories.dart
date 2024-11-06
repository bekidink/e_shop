
import 'package:e_shop/common/widgets/shimmer/category_shimmer.dart';
import 'package:e_shop/features/shop/controllers/category_controller.dart';
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
    final categoryController=Get.put(CategoryController());
    return Obx(
      (){ 
        if(categoryController.isLoading.value) return const TCategoryShimmer();
        if(categoryController.featuredCategories.isEmpty){
          return Center(child: Text('No Data Found!',style: Theme.of(context).textTheme.bodyMedium!.apply(color:TColors.white),),);
        }
       return SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: categoryController.featuredCategories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_,index){
            final category=categoryController.featuredCategories[index];
        return   TVerticalImageText( image: category.image, isNetwork: true,title: category.name,  textColor: TColors.white,onTap: ()=>Get.to(()=>const SubCategoriesScreen()),);
        }),
      );}
    );
  }
}