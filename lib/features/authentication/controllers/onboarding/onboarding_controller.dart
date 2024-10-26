import 'package:e_shop/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance=>Get.find();
  final pageController=PageController();
  Rx<int> currentPageIndex=0.obs;
  void updatePageIndicator(index)=>currentPageIndex.value = index;
  void dotNavigationClick(index){
    currentPageIndex.value=index;
    pageController.jumpTo(index);
  }
  void nextPage(){
    if(currentPageIndex.value==2){
      final deviceStorage=GetStorage();
          deviceStorage.writeIfNull('IsFirstTime', false);
Get.offAll(const LoginScreen());
    }else{
      int index=currentPageIndex.value+1;
      pageController.jumpToPage(index);
    }
  }
  void skipPage(){
     currentPageIndex.value+2;
    pageController.jumpTo(2);
  }
}