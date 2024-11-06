import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/features/shop/models/banner_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';
import '../../services/firebase_service.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance =>Get.find();
  final _db=FirebaseFirestore.instance;
    Future<List<BannerModel>> getAllBanners()async{
    try{
final snapshot=await _db.collection('banners').where('Active',isEqualTo: true).get();
final list=snapshot.docs.map((document) =>BannerModel.fromSnapshot(document)).toList();
return list;
    }on FirebaseException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }
    
    catch(e){
      throw 'Something went wrong.';
    }
  }

  Future<void> uploadDummyData(List<BannerModel> banners)async{
    try{
      final storage=Get.put(TFirebaseStorageServices());
      for(var banner in banners){
        final file=await storage.getImageDataFromAssets(banner.imageUrl);
        final url=await storage.uploadImageData('banners', file, banner.imageUrl);
        banner.imageUrl=url;
        await _db.collection('banners').doc(banner.targetScreen).set(banner.toJson());
      }
    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }
    
    catch(e){
      throw 'Something went wrong';
    }
  }
 
 
 
}