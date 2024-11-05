import 'package:e_shop/data/repositories/authentication/authentication_rep.dart';
import 'package:e_shop/data/repositories/user/user_repo.dart';
import 'package:e_shop/features/authentication/screens/login/login.dart';
import 'package:e_shop/features/personalization/screens/widgets/re_authneticate.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:e_shop/utils/helpers/network_manager.dart';
import 'package:e_shop/utils/loaders/loaders.dart';
import 'package:e_shop/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../authentication/models/user_model.dart';

class UserController extends GetxController{
  static UserCredential get instance => Get.find();
  final userRepository=Get.put(UserRepository());
  Rx<UserModel> user=UserModel.empty().obs;
  final profileLoading=false.obs;
  GlobalKey<FormState> reAuthFormKey=GlobalKey<FormState>();
  final verifyEmail=TextEditingController();
  final verifyPassword=TextEditingController();
  final hidePassword=true.obs;
  final imageUploading=false.obs;
  @override
  void onInit(){
    super.onInit();
fetchUserData();
  }
 Future<void> fetchUserData()async{
  try{
    profileLoading.value=true;
    final user=await userRepository.fetchUserDetails();
    this.user(user);
    profileLoading.value=false;
  }catch(e){
profileLoading.value=false;
user(UserModel.empty());

  }
 }
  Future<void> saveUserRecord(UserCredential? userCredential) async{
    try{
      if(userCredential !=null){
        final nameParts=UserModel.namepParts(userCredential.user?.displayName??'');
        final username=UserModel.generateUsername(userCredential.user?.displayName??'');
        final user =UserModel(id: userCredential.user!.uid, username: username, email: userCredential.user!.email??'', firstName: nameParts[0], lastName: nameParts.length>1?nameParts.sublist(1).join(' '):'', phoneNumber: userCredential.user!.phoneNumber??'', profilePicture: userCredential.user!.photoURL??'');
      await userRepository.saveUserRecord(user);
      }
    }catch(e){
TLoaders.warningSnackBar(title: 'Data not saved',message: 'Something went wrong while saving your information');
    }
  }
void deleteAccountWarningPopup(){
  Get.defaultDialog(
    contentPadding: EdgeInsets.all(TSizes.md),
    title: 'Delete Account',
    middleText: 'Are you you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently',
    confirm: ElevatedButton(onPressed: () async => deleteUserAccount, style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: const BorderSide(color: Colors.red)),child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Delete'),
    )),
    cancel: OutlinedButton(onPressed: ()=>Navigator.of(Get.overlayContext!).pop(), child:const Text('Cancel'))
  );
}
 void deleteUserAccount()async{
  try{
    TFullScreenLoader.openLoadingDialog("Processing", TImages.loadingAnimation);
    final auth=AuthenticationRepository.instance;
    final provider=auth.authUser!.providerData.map((e) => e.providerId).first;
    if(provider.isNotEmpty){
      if(provider=='google.com'){
        await auth.signInWithGoogle();
        TFullScreenLoader.stopLoading();
        Get.offAll(()=>LoginScreen());
      }else if(provider=="password"){
        TFullScreenLoader.stopLoading();
        Get.to(()=>const ReAuthLoginFom());
      }
    }
  }catch(e){
TFullScreenLoader.stopLoading();
TLoaders.warningSnackBar(title: 'Oh Snap',message: e.toString());
  }
 }
 Future<void> reAuthenticateEmailAndPasswordUser()async{
  try{
    TFullScreenLoader.openLoadingDialog('Processing', TImages.loadingAnimation);
    final isConnected=await NetworkManager.instance.isConnected();
    if(!isConnected){
      TFullScreenLoader.stopLoading();
      return;
    }
    if(!reAuthFormKey.currentState!.validate()){
      TFullScreenLoader.stopLoading();
      return;

    }
    await AuthenticationRepository.instance.reAuthenticateEmailAndPasswordUser(verifyEmail.text.trim(), verifyPassword.text.trim());
    await AuthenticationRepository.instance.deleteAccount();
    TFullScreenLoader.stopLoading();
    Get.offAll(()=>LoginScreen());
  }catch(e){
    TFullScreenLoader.stopLoading();
    TLoaders.warningSnackBar(title: 'Oh Snap',message: e.toString());
  }
 }
 uploadUserProfilePicture()async{
 try{
   final image=await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512,maxWidth: 512);
  if(image!=null){
imageUploading.value=true;
final imageUrl=await userRepository.uploadImage('Users/Images/Profile', image);
Map<String,dynamic>json={'ProfilePicture':imageUrl};
await userRepository.updateSingleField(json);
user.value.profilePicture=imageUrl;
TLoaders.successSnackBar(title: 'Congratulations',message: 'Your Profile Image has been updated');
  }
 }catch(e){
  imageUploading.value=false;
  TLoaders.errorSnackBar(title: 'Oh Snap',message: 'Something went wrong:$e');
 }
 }
}