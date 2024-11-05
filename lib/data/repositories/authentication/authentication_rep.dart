import 'package:e_shop/data/repositories/user/user_repo.dart';
import 'package:e_shop/features/authentication/screens/login/login.dart';
import 'package:e_shop/features/authentication/screens/onboarding.dart';
import 'package:e_shop/features/authentication/screens/verify/verify_email.dart';
import 'package:e_shop/navigation_menu.dart';
import 'package:e_shop/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_shop/utils/exceptions/firebase_exception.dart';
import 'package:e_shop/utils/exceptions/format_exception.dart';
import 'package:e_shop/utils/exceptions/platform_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance=>Get.find();
  final deviceStorage=GetStorage();
  final _auth=FirebaseAuth.instance;
  User? get authUser=> _auth.currentUser;
  @override
  void onReady() {
   FlutterNativeSplash.remove();
    
    super.onReady();
    screenRedirect();
  }
  screenRedirect() async{
    final user=_auth.currentUser;
    if(user!=null){
      if(!user.emailVerified){
        Get.offAll(()=>const NavigationMenu());
      }else{
        Get.offAll(()=> VerifyEmail(email: _auth.currentUser?.email,));
      }
    }else{
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime')!=true?Get.offAll(()=>const LoginScreen()):Get.offAll(()=>const OnBoardingScreen());
    }

  }
Future<UserCredential> signInWithGoogle() async{
  try{
    final GoogleSignInAccount? userAccount=await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth=await userAccount?.authentication;
    final credential=GoogleAuthProvider.credential(accessToken:googleAuth?.accessToken,idToken:googleAuth?.idToken);
    return await _auth.signInWithCredential(credential);
  }on FirebaseAuthException catch(e){
    throw TFirebaseAuthException(e.code).message;
  }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
  } on FormatException {
    throw TFormatException('');
  } on PlatformException catch(e){
    throw TPlatformException(e.code).message;
  }
  catch(e){
    throw 'Something went wrong.Please try again';
  }
}

Future<UserCredential> loginWithEmailAndPassword(String email,String password) async{
  try{
return await _auth.signInWithEmailAndPassword(email: email, password: password);
  }on FirebaseAuthException catch(e){
    throw TFirebaseAuthException(e.code).message;
  }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
  } on FormatException {
    throw TFormatException('');
  } on PlatformException catch(e){
    throw TPlatformException(e.code).message;
  }
  catch(e){
    throw 'Something went wrong.Please try again';
  }
}

Future<UserCredential>registerWithEmailAndPassword(String email,String password)async{
  try{
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }on FirebaseAuthException {
throw Error();
  }on FormatException {
    throw Error();
  }on PlatformException {
    throw Error();
  }catch(e){
    throw 'Something went wong,Please try again';
  }
}
Future<void> sendEmailVerification() async{
  try{
    await _auth.currentUser?.sendEmailVerification();
  }on FirebaseAuthException catch (e){
    throw e.toString();
  }on FirebaseException catch(e){
    throw e.toString();
  }on FormatException catch(e){
    throw e.toString();
  }catch(e){
    throw 'Something went wrong.Please again';
  }
}

Future<void> sendPasswordResetEmail(String email) async{
  try{
return await _auth.sendPasswordResetEmail(email: email);
  }on FirebaseAuthException catch(e){
    throw TFirebaseAuthException(e.code).message;
  }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
  } on FormatException {
    throw TFormatException('');
  } on PlatformException catch(e){
    throw TPlatformException(e.code).message;
  }
  catch(e){
    throw 'Something went wrong.Please try again';
  }
}

Future<void> logout() async{
  try{
    await FirebaseAuth.instance.signOut();
    Get.offAll(()=>const LoginScreen());
  }on FirebaseAuthException catch (e){
    throw TFirebaseAuthException(e.code).message;
  }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
  }on FormatException catch(e){
    throw TFormatException(e.message);
  }on PlatformException catch(e){
    throw TPlatformException(e.code).message;
  }
  catch(e){
    throw 'Something went wrong.Please again';
  }
}



Future<void> deleteAccount() async{
  try{
    await UserRepository.instance.removeUserRecod(_auth.currentUser!.uid);
    await _auth.currentUser?.delete();
  }on FirebaseAuthException catch (e){
    throw TFirebaseAuthException(e.code).message;
  }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
  }on FormatException catch(e){
    throw TFormatException(e.message);
  }on PlatformException catch(e){
    throw TPlatformException(e.code).message;
  }
  catch(e){
    throw 'Something went wrong.Please again';
  }
}


Future<void>reAuthenticateEmailAndPasswordUser(String email,String password)async{
  try{
   AuthCredential credential=EmailAuthProvider.credential(email: email, password: password);
   await _auth.currentUser!.reauthenticateWithCredential(credential);

  }on FirebaseAuthException catch (e){
    throw TFirebaseAuthException(e.code).message;
  }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
  }on FormatException catch(e){
    throw TFormatException(e.message);
  }on PlatformException catch(e){
    throw TPlatformException(e.code).message;
  }
  catch(e){
    throw 'Something went wrong.Please again';
  }
}
}
