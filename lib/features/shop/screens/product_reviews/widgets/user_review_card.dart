import 'package:e_shop/common/widgets/custom_shape/containers/rounded_containe.dart';
import 'package:e_shop/features/shop/screens/product_reviews/product_review.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.fashion),),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text('beki dink',style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('01 Nov,2020',style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        const ReadMoreText('The copy command works differently on Windows, so you need to use double backslashes re working in a cross-platform environment you can consider using a package like',trimLines: 1, trimMode: TrimMode.Line,trimExpandedText: 'show less', trimCollapsedText: 'show more',moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),)
     ,const SizedBox(height: TSizes.spaceBtwItems,),
     TRoundedContainer(
      backgroundColor: dark?TColors.darkerGrey:TColors.grey,
      child: Padding(padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("T's Store",style: Theme.of(context).textTheme.titleMedium,),
              Text("02 Nov,2023",style: Theme.of(context).textTheme.titleMedium,)
            ],
          ),
                  const SizedBox(height: TSizes.spaceBtwItems,),
        const ReadMoreText('The copy command works differently on Windows, so you need to use double backslashes re working in a cross-platform environment you can consider using a package like',trimLines: 1, trimMode: TrimMode.Line,trimExpandedText: 'show less', trimCollapsedText: 'show more',moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),)
        ],
      ),
      ),
     ),
     const SizedBox(height: TSizes.spaceBtwSections,)
      ],
    );
  }
}