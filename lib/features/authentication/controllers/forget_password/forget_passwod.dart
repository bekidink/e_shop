import 'package:e_shop/data/repositories/authentication/authentication_rep.dart';
import 'package:e_shop/features/authentication/screens/reset/reset_password.dart';
import 'package:e_shop/utils/loaders/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  final email=TextEditingController();
  GlobalKey<FormState> forgetPasswordKey=GlobalKey<FormState>();

  sendPasswordResetEmail()async{
    try{
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.loadingAnimation);
    final isConnected=await NetworkManager.instance.isConnected();
    if(!isConnected){
      TFullScreenLoader.stopLoading();
      return;
    }
    if(!forgetPasswordKey.currentState!.validate()){
       TFullScreenLoader.stopLoading();
      return;
    }
    await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
    TFullScreenLoader.stopLoading();
    TLoaders.successSnackBar(title: 'Email Sent',message: 'Email Link Sent to Reset your Password'.tr);
    Get.to(()=>ResetPassword(email: email.text.trim(),));
    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
  resendPasswordResetEmail(String email)async{
    try{
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.loadingAnimation);
    final isConnected=await NetworkManager.instance.isConnected();
    if(!isConnected){
      TFullScreenLoader.stopLoading();
      return;
    }
    
    await AuthenticationRepository.instance.sendPasswordResetEmail(email);
    TFullScreenLoader.stopLoading();
    TLoaders.successSnackBar(title: 'Email Sent',message: 'Email Link Sent to Reset your Password'.tr);
    Get.to(()=>ResetPassword(email: email,));
    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
}