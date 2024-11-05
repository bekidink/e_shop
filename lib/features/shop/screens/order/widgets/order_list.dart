import 'package:e_shop/common/widgets/custom_shape/containers/rounded_containe.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return ListView.separated(
      itemCount: 4,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      separatorBuilder: (_,__)=>const SizedBox(height: TSizes.spaceBtwItems,),
      itemBuilder: (_,index) {
        return TRoundedContainer(
          showBorder: true,
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark?TColors.dark:TColors.light,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(
                    Iconsax.ship
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems/2,),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Processing',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary,fontWeightDelta: 1),
                    
                        ),
                        Text('06 Nov 2020',style: Theme.of(context).textTheme.headlineSmall,)
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34,size: TSizes.iconSm,))
                ],
              ),
             const SizedBox(height: TSizes.spaceBtwItems,),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                    const Icon(Iconsax.tag),
                    const SizedBox(width: TSizes.spaceBtwItems/2,),
                    Expanded(child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order',style: Theme.of(context).textTheme.labelMedium,),
                        Text('[34533]',style: Theme.of(context).textTheme.bodyMedium,)
                      ],
                    ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                    const Icon(Iconsax.calendar),
                    const SizedBox(width: TSizes.spaceBtwItems/2,),
                    Expanded(child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shipping Date',style: Theme.of(context).textTheme.labelMedium,),
                        Text('04 Dec 2024',style: Theme.of(context).textTheme.bodyMedium,)
                      ],
                    ))
                      ],
                    ),
                  ),
                ],
              )
            
            
            ],
          ),
        );
      }
    );
  }
}