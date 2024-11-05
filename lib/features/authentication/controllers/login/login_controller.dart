import 'package:e_shop/data/repositories/authentication/authentication_rep.dart';
import 'package:e_shop/features/personalization/controllers/user/user_controller.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/helpers/network_manager.dart';
import 'package:e_shop/utils/loaders/loaders.dart';
import 'package:e_shop/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
  final rememberMe=false.obs;
  final hidePassword=true.obs;
  final localStorage=GetStorage();
  final email=TextEditingController();
  final password=TextEditingController();
  final userController=Get.put(UserController());
  GlobalKey<FormState>loginFormKey=GlobalKey<FormState>();
Future<void> emailAndPasswordSignIn()async{
  try{
    TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.loadingAnimation);
    final isConnected=await NetworkManager.instance.isConnected();
    if(!isConnected){
      TFullScreenLoader.stopLoading();
      return;
    }
    if(!loginFormKey.currentState!.validate()){
      TFullScreenLoader.stopLoading();
      return;
    }
    if(rememberMe.value){
      localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
    }
    final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
    TFullScreenLoader.stopLoading();
    AuthenticationRepository.instance.screenRedirect();

  }catch(e){
    TFullScreenLoader.stopLoading();
    TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
  }
}
Future<void> googleSignIn()async{
  try{
    TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.loadingAnimation);
    final isConnected=await NetworkManager.instance.isConnected();
    if(!isConnected){
      TFullScreenLoader.stopLoading();
      return;
    }
final userCredential=await AuthenticationRepository.instance.signInWithGoogle();
await userController.saveUserRecord(userCredential);
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
  }catch(e){
          TFullScreenLoader.stopLoading();
    TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
  }
}
}