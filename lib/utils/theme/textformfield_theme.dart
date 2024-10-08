import 'package:flutter/material.dart';

class TTextFormField{
  TTextFormField._();
  static InputDecorationTheme lightTextFormFieldTheme=InputDecorationTheme(
    errorMaxLines: 1,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.black),
    hintStyle: TextStyle().copyWith(fontSize: 14,color: Colors.black),
    errorStyle: TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: TextStyle().copyWith(
      color: Colors.black.withOpacity(0.4)
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1,color: Colors.grey)
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1,color: Colors.grey),
      
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1,color: Colors.black12),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1,color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1,color: Colors.orange)

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
      borderSide: BorderSide(width: 1,color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1,color: Colors.orange)

    )
  );
}