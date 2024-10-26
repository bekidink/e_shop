import 'package:e_shop/data/repositories/user/user_repo.dart';
import 'package:e_shop/utils/loaders/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../authentication/models/user_model.dart';

class UserController extends GetxController{
  static UserCredential get instance => Get.find();
  final userRepository=Get.put(UserRepository());
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
}