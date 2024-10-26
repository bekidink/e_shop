import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/features/authentication/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance=>Get.find();
  final FirebaseFirestore _db=FirebaseFirestore.instance;
  Future<void> saveUserRecord(UserModel user)async{
try{
  await _db.collection('Users').doc(user.id).set(user.toJson());
}on FirebaseException catch(e){
  throw e.toString();
}on FormatException catch(e){
  throw e.toString();
}on PlatformException catch(e){
  throw e.toString();
}
catch(e){
  throw 'Something went wrong.Please try again';
}
  }
}