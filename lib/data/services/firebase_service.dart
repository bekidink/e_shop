import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TFirebaseStorageServices extends GetxController{
  static TFirebaseStorageServices get instance => Get.find();
  final firebaseStorage=FirebaseStorage.instance;
  Future<Uint8List>getImageDataFromAssets(String path) async{
    try{
      final byteData=await rootBundle.load(path);
      final imageData=byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes);
      return imageData;
    }catch (e){
      throw 'Error loading data:$e';
    }
  }
  Future<String> uploadImageData(String path,Uint8List image,String name)async{
  try{
    final ref=firebaseStorage.ref(path).child(name);
    await ref.putData(image);
    final url=await ref.getDownloadURL();
    return url;
  }catch (e){
throw 'Something went wrong';
  }
}
}