import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SeSearchContainer extends StatelessWidget {
  const SeSearchContainer({
    super.key, 
    required 
    this.text, 
    this.icon,  
    this.showBackground = true,  
    this.showBorder = true, 
    this.onTap, 
    this.padding = const EdgeInsets.symmetric(horizontal: SecuriteSize.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final darkMode = SecuriteHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: SecuriteDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(SecuriteSize.md),
          decoration: BoxDecoration(
            color: showBackground ? darkMode ? SecuriteColors.dark : SecuriteColors.light : Colors.transparent,
            borderRadius: BorderRadius.circular(SecuriteSize.borderRadiusLg),
            border:showBorder ? Border.all(color: SecuriteColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: SecuriteColors.grey,),
              const SizedBox(width: SecuriteSize.spaceBtwItem,),
              Text(text, style: Theme.of(context).textTheme.bodySmall,)
            ],
          ),
        ),
      ),
    );
  }
}




