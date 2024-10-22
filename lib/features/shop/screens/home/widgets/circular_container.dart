import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

Widget circularContainer(double? width,double? height,double? radius,double? padding,Widget? child,Color? backgroundColor){
  return   Container(
                  width:width?? 400,
                  height:height?? 400,
                  padding:  EdgeInsets.all(padding?? 0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius?? 400),
                  color:backgroundColor?? TColors.white.withOpacity(0.1)
                  ),
                  child: child,
                );
}