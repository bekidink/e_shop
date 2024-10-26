import 'dart:async';

import 'package:e_shop/data/repositories/authentication/authentication_rep.dart';
import 'package:e_shop/features/authentication/screens/verify/success.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/loaders/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController{
 static VerifyEmailController get instance =>Get.find();
 @override
 void onInit(){
  sendEmailVerifucation();
  super.onInit();
 }
 sendEmailVerifucation()async{
  try{
    await AuthenticationRepository.instance.sendEmailVerification();
 TLoaders.successSnackBar(title: 'Email Sent',message: 'Please Check your inbox and verify your email.');
  }catch(e){
TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
  }
 }
 setTimerForAutoRedirect(){
  Timer.periodic(Duration(seconds: 1), (timer)async { 
await FirebaseAuth.instance.currentUser?.reload();
final user=FirebaseAuth.instance.currentUser;
if(user?.emailVerified??false){
  timer.cancel();
  Get.off(()=>SuccessScreen(image: TImages.successAnimation, title: 'Your Account Created Successfully', subTitle: '', onPressed: ()=>AuthenticationRepository.instance.screenRedirect()));
}
  });
 }
 checkEmailVerificationStatus() async{
  final currentUser=FirebaseAuth.instance.currentUser;
  print(currentUser);
  if(currentUser!=null && !currentUser.emailVerified){
     Get.off(()=>SuccessScreen(image: TImages.successAnimation, title: 'Your Account Created Successfully', subTitle: '', onPressed: ()=>AuthenticationRepository.instance.screenRedirect()));
  }
 }
}