import 'package:e_shop/data/repositories/user/user_repo.dart';
import 'package:e_shop/features/personalization/controllers/user/user_controller.dart';
import 'package:e_shop/features/personalization/screens/profile/profile.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/helpers/network_manager.dart';
import 'package:e_shop/utils/loaders/loaders.dart';
import 'package:e_shop/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController{
  final firstName=TextEditingController();
  final lastName=TextEditingController();
  GlobalKey<FormState> updateNameFormKey=GlobalKey<FormState>();
  final controller=Get.put(UserController());
  final userRepository=Get.put(UserRepository());
  @override
  void onInit() {
   initializeNames();
    super.onInit();
  }
  Future<void> initializeNames()async{
    firstName.text=controller.user.value.firstName;
    lastName.text=controller.user.value.lastName;
  }

  Future<void> updateUserName()async{
    try{
      TFullScreenLoader.openLoadingDialog('We are Updating your information', TImages.loadingAnimation);
      final isConnected=await NetworkManager.instance.isConnected();
      if(isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }
      if(!updateNameFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      Map<String,dynamic> name={'FirstName':firstName.text.trim(),'LastName':lastName.text.trim()};
      await userRepository.updateSingleField(name);
      controller.user.value.firstName=firstName.text.trim();
      controller.user.value.lastName=lastName.text.trim();
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Congratulations',message: 'Your name has been updated');
      Get.off(()=>const ProfileScreen());
    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snaps',message: e.toString());
    }
  }
}