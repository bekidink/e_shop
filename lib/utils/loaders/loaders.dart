import 'package:e_shop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoaders{
  static successSnackBar({required title,message='',duration=3}){
    Get.snackbar(title, message,
    isDismissible: true,
    shouldIconPulse: true,
    colorText: TColors.white,
    backgroundColor: TColors.primary,
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(seconds: duration),
    margin: const EdgeInsets.all(10),
    icon: const Icon(Iconsax.warning_2,color: TColors.white,)
    );
  }
  static warningSnackBar({required title,message=''}){
    Get.snackbar(title, message,
    isDismissible: true,
    shouldIconPulse: true,
    colorText: TColors.white,
    backgroundColor: Colors.orange,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 4),
     margin: const EdgeInsets.all(20),
    icon: const Icon(Iconsax.warning_2,color: TColors.white,)
    );
  }
  static errorSnackBar({required title,message=''}){
    Get.snackbar(title, message,
    isDismissible: true,
    shouldIconPulse: true,
    colorText: TColors.white,
    backgroundColor: Colors.red,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 4),
     margin: const EdgeInsets.all(20),
    icon: const Icon(Iconsax.warning_2,color: TColors.white,)
    );
  }
}