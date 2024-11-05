
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_shop/utils/loaders/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController{
  static NetworkManager get instance => Get.find();
  final Connectivity _connectivity=Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final RxList<ConnectivityResult> _connectionStatus = [ConnectivityResult.none].obs;
  @override
  void onInit() {
     _connectivitySubscription= _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.onInit();
   
  }
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result)async{
    _connectionStatus.value=result;
    if(_connectionStatus.value==ConnectivityResult.none){
      TLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }
  Future<bool> isConnected()async{
    try{
      final result=await _connectivity.checkConnectivity();
      if(result == ConnectivityResult.none){
        return false;
      }else{
        return true;
      }
    }on PlatformException {
      return false;
    }
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _connectivitySubscription.cancel();
  }
}