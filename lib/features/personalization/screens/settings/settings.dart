import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/common/widgets/image/circular_image.dart';
import 'package:e_shop/common/widgets/texts/heading_title.dart';
import 'package:e_shop/features/personalization/screens/address/address.dart';
import 'package:e_shop/features/personalization/screens/profile/profile.dart';
import 'package:e_shop/features/personalization/screens/widgets/menu_tile.dart';
import 'package:e_shop/features/shop/screens/home/home.dart';
import 'package:e_shop/features/shop/screens/order/order.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/images.dart';
import 'package:e_shop/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(child: Column(
              children: [
                TAppBar(title: Text('Account',style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),),),
                TUserProductTile(onTap: ()=>Get.to(()=>const ProfileScreen()),)
              ],
            ),),
            Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const HeadingTitle(title: 'Account Settings',showActionButton: false,),
                const SizedBox(height: TSizes.spaceBtwItems,),
                 TSettingMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set shopping delivery',onTap: ()=>Get.to(()=>AddressScreen()),),
                const TSettingMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove product'),
                 TSettingMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-progress and complete',onTap: ()=>Get.to(()=>OrderScreen()),),
                const TSettingMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account'),
                const TSettingMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discount coupon'),
                const TSettingMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message'),
                const TSettingMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage'),

                const SizedBox(height: TSizes.spaceBtwSections,),
                const HeadingTitle(title: 'App Settings',showActionButton: false,),
                const SizedBox(height: TSizes.spaceBtwItems,),
                const TSettingMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your cloud firebase '),
                TSettingMenuTile(icon: Iconsax.location, title: 'Geolocation', subTitle: 'Set recommendation based on location',trailing: Switch(value: true, onChanged: (value){}),),
                const TSettingMenuTile(icon: Iconsax.security_user, title: 'Safe Mode', subTitle: 'Search result is safe for all ages'),
                const TSettingMenuTile(icon: Iconsax.image, title: 'HD Image Quality', subTitle: 'Set Image quality to be seen')
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}

class TUserProductTile extends StatelessWidget {
  const TUserProductTile({
    super.key, this.onTap,
  });
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(image: TImages.electronic, width: 50, height: 50,padding: 0,),
      title: Text('Coding with T',style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text('support@codingwithb.com',style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: (){}, icon: const Icon(Iconsax.edit,color: TColors.white,)),
      onTap:onTap ,
    );
  }
}