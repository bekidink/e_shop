import 'package:flutter/material.dart';

class TChipTheme{
  static ChipThemeData lightChipThemeData=ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    checkmarkColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12)
  );

   static ChipThemeData darkChipThemeData=ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    checkmarkColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12)
  );
}