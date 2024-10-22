import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';

class TTextFormField{
  TTextFormField._();
  static InputDecorationTheme lightTextFormFieldTheme=InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.darkGrey,
    suffixIconColor: TColors.darkGrey,
    labelStyle: const TextStyle().copyWith(fontSize: TSizes.fontSizeMd,color: TColors.black),
    hintStyle:const TextStyle().copyWith(fontSize: TSizes.fontSizeMd,color: TColors.black),
    errorStyle:const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:const TextStyle().copyWith(
      color: TColors.black.withOpacity(0.4)
    ),
    border:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:const BorderSide(width: 1,color: TColors.grey)
    ),
    enabledBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:const BorderSide(width: 1,color: TColors.grey),
      
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:const BorderSide(width: 1,color: TColors.black),
    ),
    errorBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:const BorderSide(width: 1,color: TColors.warning),
    ),
    focusedErrorBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide:const BorderSide(width: 1,color: TColors.warning)

    )
  );
  static InputDecorationTheme darkTextFormFieldTheme=InputDecorationTheme(
    errorMaxLines: 1,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.black),
    hintStyle:const TextStyle().copyWith(fontSize: 14,color: Colors.black),
    errorStyle:const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:const TextStyle().copyWith(
      color: Colors.black.withOpacity(0.4)
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide:const BorderSide(width: 1,color: Colors.grey)
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide:const BorderSide(width: 1,color: Colors.grey),
      
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide:const BorderSide(width: 1,color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.orange)

    )
  );
}