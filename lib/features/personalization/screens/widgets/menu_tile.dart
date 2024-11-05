import 'package:e_shop/features/personalization/controllers/user/user_controller.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TSettingMenuTile extends StatelessWidget {
  const TSettingMenuTile({super.key, required this.icon, required this.title, required this.subTitle, this.trailing, this.onTap});
  final IconData icon;
  final String title,subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UserController());
    return ListTile(
      leading: Icon(icon,size: 28,color: TColors.primary,),
      title: Text(controller.user.value.fullName,style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.labelMedium,),
      trailing: trailing,
      onTap: onTap,
    );
  }
}