import 'package:e_shop/features/personalization/screens/settings/settings.dart';
import 'package:e_shop/features/shop/screens/home/home.dart';
import 'package:e_shop/features/shop/screens/store/store.dart';
import 'package:e_shop/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(NavigationMenuController());
    final dark=THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        backgroundColor: dark?TColors.black:Colors.white
        ,
        indicatorColor: dark?TColors.black:TColors.white,
        onDestinationSelected: (value) =>controller.selectedIndex.value=value ,
        destinations: const [
        NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
        NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
        NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList'),
        NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile')
      ],)),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}
class NavigationMenuController extends GetxController{
  final Rx<int> selectedIndex=0.obs;
  final screens=[
  const  HomeScreen(),
  const  StoreScreen(),
  const FavoriteScreen(),
  const SettingsScreen()
  ];
}