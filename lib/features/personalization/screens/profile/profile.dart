import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/common/widgets/image/circular_image.dart';
import 'package:e_shop/common/widgets/texts/heading_title.dart';
import 'package:e_shop/features/personalization/screens/widgets/profile_menu.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const  TCircularImage(image: TImages.home,width:80,height: 80, ),
                    TextButton(onPressed: (){}, child:const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const HeadingTitle(title: 'Profile Information',showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              TProfileMenu( onPressed: (){}, title:'Name' , value: 'Coding with B'),
              TProfileMenu(onPressed: (){}, title: 'Username', value: 'beki'),
                   const SizedBox(height: TSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const HeadingTitle(title: 'Profile Information',showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              TProfileMenu(onPressed: (){}, title: 'User ID', value: '12345',icon: Iconsax.copy,),
              TProfileMenu(onPressed: (){}, title: 'E-mail', value: 'beki@gmail.com'),
              TProfileMenu(onPressed: (){}, title: 'Phone Number', value: '+251901108024'),
              TProfileMenu(onPressed: (){}, title: 'Gender', value: 'Male'),
              TProfileMenu(onPressed: (){}, title: 'Date', value: '27 Apr,2002'),
const Divider(),
const SizedBox(height: TSizes.spaceBtwItems,),
Center(
  child: TextButton(onPressed: (){}, child: const Text('Close Account',style: TextStyle(color: Colors.red),)),
)
            ],
          ),
        ),
      ),
    );
  }
}