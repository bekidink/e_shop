import 'package:e_shop/common/widgets/custom_shape/containers/rounded_containe.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});
final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: EdgeInsets.all(TSizes.md),
      backgroundColor:selectedAddress?TColors.primary.withOpacity(0.5):Colors.transparent ,
      borderColor: selectedAddress?Colors.transparent:dark?TColors.darkerGrey:TColors.grey,
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child:Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress?Iconsax.tick_circle5:null,
              color: selectedAddress?dark?TColors.light:TColors.dark.withOpacity(0.2):null,
            ),
          ),
          Column(
            children: [
              Text(
                'beki',maxLines: 2,overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleLarge,
              ),
SizedBox(height: TSizes.sm/2,),
Text('(+251)972269598',maxLines: 1,overflow: TextOverflow.ellipsis,),
SizedBox(height: TSizes.sm/2,),
 Text(
                '12345 Timmy Coves,South Liane,Maine,87665,USA',maxLines: 2,overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          )
        ],
      ) ,
    );
  }
}