

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    super.key, required this.text, this.icon,  this.showBackground=true,  this.showBorder=true,  this.padding=const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });
final String text;
final IconData? icon;
final bool showBackground,showBorder;
final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Padding(padding: padding,
    child: Container(width: TDeviceUtility.getScreenWidth(context), padding: const EdgeInsets.all(TSizes.md), decoration: BoxDecoration(color:showBackground?dark?TColors.white:TColors.light:Colors.transparent,borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
    border:showBorder? Border.all(color: TColors.grey):null
    ),
    child: Row(
      children: [
      const  Icon(Iconsax.search_normal,color: TColors.darkerGrey,),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Text(text,style: Theme.of(context).textTheme.bodySmall,)
      ],
    ),
    ),
    );
  }
}