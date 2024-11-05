import 'package:e_shop/common/widgets/texts/heading_title.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BillAddressSection extends StatelessWidget {
  const BillAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingTitle(title: 'Shipping Address',buttonTitle: 'Change',onPressed: (){},),
Text('Coding with bek',style: Theme.of(context).textTheme.bodyLarge,),
Row(
  children: [
    const Icon(Icons.phone,color: Colors.grey, size: 16,),
    const SizedBox(width: TSizes.spaceBtwItems,),
    Text('+251972269598',style: Theme.of(context).textTheme.bodyMedium,),

  ],
),
const SizedBox(height: TSizes.spaceBtwItems,),
Row(
  children: [
    const Icon(
      Icons.location_history,color: Colors.grey,size: 16,
    ),
    const SizedBox(height: TSizes.spaceBtwItems/2,),
    Expanded(child: Text('Bole,Addis Ababa',style: Theme.of(context).textTheme.bodyMedium,))
  ],
)


      ],
    );
  }
}