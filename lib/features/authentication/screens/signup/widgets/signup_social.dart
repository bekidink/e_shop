import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';

Widget signUpSocial(){
  return     Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: TColors.grey
                    ),borderRadius: BorderRadius.circular(100)
                  ),
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.facebook)),
                ),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: TColors.grey
                    ),borderRadius: BorderRadius.circular(100)
                  ),
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.facebook)),
                ),
              ],
            );
         
         
         
       
}