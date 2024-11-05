
import 'package:e_shop/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_shop/features/personalization/controllers/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/cart/cart_count_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../cart/cart.dart';

class THomeAppbar extends StatelessWidget {
  const THomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),),
          
          Obx(() {
            if(controller.profileLoading.value){
              return const TShimmerEffect(width: 80, height: 15,);
            }
         return   Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),);})
        ],
      ),
      actions: [
        TCartCounterIcon( onPressed: ()=>Get.to(()=>const CartScreen()),)
      ],
    );
  }
}