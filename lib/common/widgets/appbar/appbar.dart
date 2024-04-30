import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/device/device_utility.dart';

class SeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SeAppBar({super.key, this.title, this.showBackArrow = false, this.leadingIcon, this.actions, this.leadingOnPressed});


  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SecuriteSize.sm),
      child: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: showBackArrow 
        ? IconButton(onPressed: ()=> Get.back(), icon: const Icon(Iconsax.arrow_left,)) 
        : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
        title: title,
        actions: actions,
        ),
    );
  } 
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(SecuriteDeviceUtils.getAppBarHeight());
}