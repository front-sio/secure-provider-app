import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/inlyfe/screens/home_screen/home_screen.dart';
import 'package:secureprovider/inlyfe/screens/service_requests/service_order.dart';
import 'package:secureprovider/features/personalization/screens/settings/settings_screen.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = SecuriteHelperFunction.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: darkMode ? SecuriteColors.black : SecuriteColors.white,
          indicatorColor: darkMode ? SecuriteColors.primary.withOpacity(0.1) : SecuriteColors.primary.withOpacity(0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home5), label: 'Home'),
            // NavigationDestination(icon: Icon(Iconsax.category5), label: 'Services'),
            NavigationDestination(icon: Icon(Iconsax.activity5), label: 'Activities'),
            NavigationDestination(icon: Icon(Iconsax.setting), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    RequestsScreen(),
    const SettingsScreen(),
  ];
}