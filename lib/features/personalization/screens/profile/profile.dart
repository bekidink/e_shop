import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/common/widgets/image/circular_image.dart';
import 'package:e_shop/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_shop/common/widgets/texts/heading_title.dart';
import 'package:e_shop/features/personalization/controllers/user/user_controller.dart';
import 'package:e_shop/features/personalization/screens/widgets/change_name.dart';
import 'package:e_shop/features/personalization/screens/widgets/profile_menu.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UserController());
    return Scaffold(
      appBar:const TAppBar(showBackArrow: true,title: Text('Profile'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx((){
                      final networkImage=controller.user.value.profilePicture;
                      final image=networkImage.isNotEmpty?networkImage:TImages.home;
return controller.imageUploading.value? const TShimmerEffect(width: 80, height: 80,radius: 80,) :TCircularImage(image: image,width:80,height: 80,isNetworkImage: networkImage.isNotEmpty, );
                    } ),
                    TextButton(onPressed: ()=>controller.uploadUserProfilePicture(), child:const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const HeadingTitle(title: 'Profile Information',showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              TProfileMenu( onPressed: ()=>Get.to(()=>ChangeName()), title:'Name' , value: controller.user.value.fullName),
              TProfileMenu(onPressed: (){}, title: 'Username', value: controller.user.value.username),
                   const SizedBox(height: TSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const HeadingTitle(title: 'Profile Information',showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              TProfileMenu(onPressed: (){}, title: 'User ID', value: controller.user.value.id,icon: Iconsax.copy,),
              TProfileMenu(onPressed: (){}, title: 'E-mail', value: controller.user.value.email),
              TProfileMenu(onPressed: (){}, title: 'Phone Number', value: controller.user.value.phoneNumber),
              TProfileMenu(onPressed: (){}, title: 'Gender', value: 'Male'),
              TProfileMenu(onPressed: (){}, title: 'Date', value: '27 Apr,2002'),
const Divider(),
const SizedBox(height: TSizes.spaceBtwItems,),
Center(
  child: TextButton(onPressed: ()=>controller.deleteAccountWarningPopup(), child: const Text('Close Account',style: TextStyle(color: Colors.red),)),
)
            ],
          ),
        ),
      ),
    );
  }
}