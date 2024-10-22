import 'package:e_shop/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TShadowStyle{
  static final veticalProductShadow=BoxShadow(
    color: TColors.darkGrey.withOpacity(.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow=BoxShadow(
    color: TColors.darkGrey.withOpacity(.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
}