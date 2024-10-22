
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shop/features/shop/controllers/home_controller.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shape/containers/circular_container.dart';
import '../../../../../common/widgets/image/rounded_image.dart';
import '../../../../../utils/constants/size.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,
  });
final List<String>banners;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(HomeController());
    final dark=THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        CarouselSlider( options: CarouselOptions(
          viewportFraction: 1,
          onPageChanged: (index,_)=>controller.updatePageIndicator(index)
        ),items: banners.map((url) => RoundedImage(imageUrl: url,backgroundColor: dark?TColors.black:TColors.white,)).toList(),),
      const SizedBox(height: TSizes.spaceBtwItems,),
      Obx(
        ()=> Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for(int i=0;i<banners.length;i++)      TCircularContainer(width: 20, height: 4, margin: const EdgeInsets.only(right: 10),backgroundColor:controller.carouselCurrentIndex.value==i?TColors.primary: TColors.grey,),
          ],
        ),
      )
      ],
    );
  }
}
