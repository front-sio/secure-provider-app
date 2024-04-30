import 'package:flutter/material.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/device/device_utility.dart';

import '../../../utils/helpers/helper_functions.dart';

class SeTabBar extends StatelessWidget implements PreferredSizeWidget {
  const SeTabBar({super.key, required this.tabs,});


  final List<Widget> tabs;
  

  @override
  Widget build(BuildContext context) {
    final dark = SecuriteHelperFunction.isDarkMode(context);  
    return Material(
      color: dark ? SecuriteColors.black : SecuriteColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: SecuriteColors.primary,
        labelColor: dark ? SecuriteColors.white: SecuriteColors.dark,
        unselectedLabelColor: SecuriteColors.grey,
        ),
    );
  } 
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(SecuriteDeviceUtils.getAppBarHeight());
}