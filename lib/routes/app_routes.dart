import 'package:e_shop/features/authentication/screens/forget/foget_password.dart';
import 'package:e_shop/features/authentication/screens/login/login.dart';
import 'package:e_shop/features/authentication/screens/onboarding.dart';
import 'package:e_shop/features/authentication/screens/signup/sign_up.dart';
import 'package:e_shop/features/authentication/screens/verify/verify_email.dart';
import 'package:e_shop/features/personalization/screens/address/address.dart';
import 'package:e_shop/features/personalization/screens/profile/profile.dart';
import 'package:e_shop/features/personalization/screens/settings/settings.dart';
import 'package:e_shop/features/shop/screens/cart/cart.dart';
import 'package:e_shop/features/shop/screens/checkout/checkout.dart';
import 'package:e_shop/features/shop/screens/home/home.dart';
import 'package:e_shop/features/shop/screens/order/order.dart';
import 'package:e_shop/features/shop/screens/product_reviews/product_review.dart';
import 'package:e_shop/features/shop/screens/store/store.dart';
import 'package:e_shop/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_shop/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes{
  static final pages=[
    GetPage(name: TRoutes.home, page: ()=>HomeScreen()),
    GetPage(name: TRoutes.store, page: ()=>StoreScreen()),
    GetPage(name: TRoutes.favourites, page: ()=>FavoriteScreen()),
    GetPage(name: TRoutes.settings, page: ()=>SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: ()=>ProductReview()),
    GetPage(name: TRoutes.order, page: ()=>OrderScreen()),
    GetPage(name: TRoutes.checkout, page: ()=>CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: ()=>CartScreen()),
    GetPage(name: TRoutes.userProfile, page: ()=>ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: ()=>AddressScreen()),
    GetPage(name: TRoutes.signup, page: ()=>SignUpScreen()),
    GetPage(name: TRoutes.verifyEmail, page: ()=>VerifyEmail()),
    GetPage(name: TRoutes.signIn, page: ()=>LoginScreen()),
    GetPage(name: TRoutes.home, page: ()=>HomeScreen()),
    GetPage(name: TRoutes.forgetPassword, page: ()=>ForgetPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: ()=>OnBoardingScreen()),
  ];
}