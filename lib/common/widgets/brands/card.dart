import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shape/containers/rounded_containe.dart';
import '../image/circular_image.dart';
import 'brand_title.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({super.key,  this.showBorder=true});
final bool showBorder;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
                onTap: (){},
                 child: TRoundedContainer(
                  padding:const EdgeInsets.all(TSizes.sm),
                  showBorder: showBorder,
                  backgroundColor: Colors.transparent,
                  child: Row(
                    children: [
                     Flexible(child: TCircularImage(image: TImages.electronic,backgroundColor: Colors.transparent,overlayColor: THelperFunctions.isDarkMode(context)?TColors.white:TColors.black,isNetworkImage: false,)),
                     const SizedBox(width: TSizes.spaceBtwItems/2,),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                                            const    TBrandTitleWithVerifiedIcon(title: 'Nike',brandTextSize: TextSizes.large,textColor: TColors.black,),
                          Text('256 products with ',overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.labelMedium,)
                        ],
                                             ),
                      )
                    ],
                  ),
                 ),
               );

           
           
  }
}