import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/data/services/firebase_service.dart';
import 'package:e_shop/features/shop/models/category_model.dart';
import 'package:e_shop/features/shop/models/product_model.dart';
import 'package:e_shop/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_shop/utils/exceptions/firebase_exception.dart';
import 'package:e_shop/utils/exceptions/platform_exception.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController{
  static ProductRepository get instance =>Get.find();
  final _db=FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts()async{
    try{
final snapshot=await _db.collection('Products').where('IsFeatured',isEqualTo: true).limit(4).get();
return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    }on FirebaseException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }
    
    catch(e){
      throw 'Something went wrong.';
    }
  }

 
   Future<List<ProductModel>> getFeaturedAllProducts()async{
    try{
final snapshot=await _db.collection('Products').where('IsFeatured',isEqualTo: true).get();
return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    }on FirebaseException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }
    
    catch(e){
      throw 'Something went wrong.';
    }
  }

 
  Future<List<ProductModel>> getFeaturedProductsByQuery(Query query)async{
    try{
final snapshot=await query.get();
final List<ProductModel>productList=snapshot.docs.map((e) => ProductModel.fromQuerySnapshot(e)).toList();
return productList;
    }on FirebaseException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }
    
    catch(e){
      throw 'Something went wrong.';
    }
  }

 
 
 
  Future<void> uploadDummyData(List<ProductModel> products)async{
    try{
      final storage=Get.put(TFirebaseStorageServices());
      for(var product in products){
        final thumb=await storage.getImageDataFromAssets(product.thumbnail);
        final url=await storage.uploadImageData('Products/Images', thumb, product.thumbnail.toString());
        product.thumbnail=url;
        if(product.brand!=null && product.brand!.image.isNotEmpty){
final brandthumb=await storage.getImageDataFromAssets(product.brand!.image);
        final url=await storage.uploadImageData('Products/Images', brandthumb, product.brand!.name.toString());
        product.brand!.image=url;
        }
        if(product.images!=null && product.images!.isNotEmpty){
          List<String>imagesUrl=[];
          for(var image in product.images!){
            final assetImage=await storage.getImageDataFromAssets(image);
            final url=await storage.uploadImageData('Products/Images', assetImage, image);
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }
        for(var variation in product.productVariations!){
          final assetImage=await storage.getImageDataFromAssets(variation.image);
            final url=await storage.uploadImageData('Products/Images', assetImage, variation.image);
            variation.image=url;
        }
        await _db.collection('Products').doc(product.id).set(product.toJson());
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