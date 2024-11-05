import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/user_review_card.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Reviews & Ratings'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace), child: Column(
          
          children: [
          const Text('Ratings and reviews are verified and are from people who use the same type of device that you use'),
          const SizedBox(height: TSizes.spaceBtwItems,),
          const TOverallProductRating(),
          const TRatingBarIndicator(rating: 3.5,),
          Text('12.611',style: Theme.of(context).textTheme.bodyMedium,),
          const SizedBox(height: TSizes.spaceBtwSections,),
          const UserReviewCard()
        ],),),
      ),
    );
  }
}

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({
    super.key, required this.rating,
  });
final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator( rating: rating,itemSize: 20,unratedColor: TColors.grey,itemBuilder: (_,__)=>const Icon(Iconsax.star1,color: TColors.primary,),);
  }
}

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded( flex: 3,child: Text('4.8',style: Theme.of(context).textTheme.displayLarge,)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(text: '5',value: 1.0,),
              TRatingProgressIndicator(text: '4',value: 0.8,),
              TRatingProgressIndicator(text: '3',value: 0.6,),
              TRatingProgressIndicator(text: '2',value: 0.4,),
              TRatingProgressIndicator(text: '1',value: 0.2,)
    
              
            ],
          ),
        )
      ],
    );
  }
}

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key, required this.text, required this.value,
  });
final String text;
final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded( flex: 1,child: Text(text,style: Theme.of(context).textTheme.bodyMedium,)),
        Expanded( flex: 11,child: LinearProgressIndicator(value: value, minHeight: 11, backgroundColor: TColors.grey, valueColor: const AlwaysStoppedAnimation(TColors.primary), borderRadius: BorderRadius.circular(7),))
      ],
    );
  }
}