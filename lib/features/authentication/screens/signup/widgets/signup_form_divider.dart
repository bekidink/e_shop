import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

Widget signUpFormDivider(BuildContext context){
   final dark=THelperFunctions.isDarkMode(context);
  return  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: Divider(
                  color: dark?TColors.darkGrey:TColors.grey,thickness: 0.5,indent: 60,endIndent: 5,
                )),
                Text('Or sign in with',style: Theme.of(context).textTheme.labelMedium,),
                Flexible(child: Divider(
                  color: dark?TColors.darkGrey:TColors.grey,thickness: 0.5,indent: 60,endIndent: 5,
                ))
              ],
            );
             
             
}