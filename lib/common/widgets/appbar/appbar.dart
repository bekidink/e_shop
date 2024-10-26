import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/device/device_utility.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget{
 const TAppBar({super.key, this.title,  this.showBackArrow=false, this.leadingIcon, this.actions, this.leadingOnPressed});
 final Widget?title;
 final bool showBackArrow;
 final IconData? leadingIcon;
 final List<Widget>? actions;
 final VoidCallback? leadingOnPressed;
  @override
  Widget build(BuildContext context) {
    final dark =THelperFunctions.isDarkMode(context);
    return Padding(padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
    child: AppBar(
      automaticallyImplyLeading: false,
leading: showBackArrow?IconButton(onPressed: ()=>Get.back(), icon:  Icon(Iconsax.arrow_left,color:  dark?TColors.white:TColors.black)):leadingIcon!=null? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)):null,
title: title,
actions: actions,
    )
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtility.getAppBarHeight());
  
}