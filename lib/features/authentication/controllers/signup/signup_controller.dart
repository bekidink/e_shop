import 'package:e_shop/data/repositories/authentication/authentication_rep.dart';
import 'package:e_shop/data/repositories/user/user_repo.dart';
import 'package:e_shop/features/authentication/models/user_model.dart';
import 'package:e_shop/features/authentication/screens/verify/verify_email.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/helpers/network_manager.dart';
import 'package:e_shop/utils/loaders/loaders.dart';
import 'package:e_shop/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/onboarding.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();
final hidePassword=true.obs;
final acceptPrivacy=false.obs;
final email=TextEditingController();
final lastName=TextEditingController();
final username=TextEditingController();
final pasword=TextEditingController();
final firstName=TextEditingController();
final phoneNumber=TextEditingController();
GlobalKey<FormState> signupFormKey=GlobalKey<FormState>();
  void signup() async{
    try{
TFullScreenLoader.openLoadingDialog('We are processing your information', TImages.loadingAnimation);
final isConnected=await NetworkManager.instance.isConnected();
if(!isConnected)return;

if(!signupFormKey.currentState!.validate()) return;
if(!acceptPrivacy.value){
  TLoaders.warningSnackBar(title: 'Accept Privacy Policy',message: 'In order to create account,you must have to read and accept the Privacy Policy & Terms of Use');
  return;
}
final user= await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), pasword.text.trim());
final newUser=UserModel(id: user.user!.uid, username: username.text.trim(), email: email.text.trim(), firstName: firstName.text.trim(), lastName: lastName.text.trim(), phoneNumber: phoneNumber.text.trim(), profilePicture: '');
final userRepository=Get.put(UserRepository());
await userRepository.saveUserRecord(newUser);
TFullScreenLoader.stopLoading();
Get.to(()=>const VerifyEmail());
TLoaders.successSnackBar(title: 'Congratulations',message: 'Your account has been created! Verify email to continue');

    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
  
}