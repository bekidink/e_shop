import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/data/services/firebase_service.dart';
import 'package:e_shop/features/shop/models/category_model.dart';
import 'package:e_shop/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_shop/utils/exceptions/firebase_exception.dart';
import 'package:e_shop/utils/exceptions/platform_exception.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance =>Get.find();
  final _db=FirebaseFirestore.instance;
  Future<List<CategoryModel>> getAllCategories()async{
    try{
final snapshot=await _db.collection('Categories').get();
final list=snapshot.docs.map((document) =>CategoryModel.fromSnapshot(document)).toList();
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

 
 
 
  Future<void> uploadDummyData(List<CategoryModel> categories)async{
    try{
      final storage=Get.put(TFirebaseStorageServices());
      for(var category in categories){
        final file=await storage.getImageDataFromAssets(category.image);
        final url=await storage.uploadImageData('Categories', file, category.name);
        category.image=url;
        await _db.collection('Categories').doc(category.id).set(category.toJson());
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