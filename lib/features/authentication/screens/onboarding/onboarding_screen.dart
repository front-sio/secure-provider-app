import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:secureprovider/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:secureprovider/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:secureprovider/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/device/device_utility.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(image: 'assets/images/service_vector2.jpg', title: 'Welcome Service Requesting Platform', subtitle: 'Find your desired provider for your problem',),
              OnBoardingPage(image: 'assets/images/service_vector1.jpg', title: 'Welcome Service Requesting Platform', subtitle: 'Find your desired provider for your problem',),
              OnBoardingPage(image: 'assets/images/salon.jpg', title: 'Welcome Service Requesting Platform', subtitle: 'Find your desired provider for your problem',),
            ],
          ),
          // Skip Button
          const OnBoardingSkip(),
          // Dot Navigation SmoothPageIndicator
          
          const OnBoardingDotNavigation(),

          Positioned(
            right: SecuriteSize.defaultSpace,
            bottom: SecuriteDeviceUtils.getBottomNavigationBarHeight(),

            child: ElevatedButton(
              onPressed: () => OnBoardingController.instance.nextPage(), 
              child: const Icon(Iconsax.arrow_right_3)
              )
            ),
        ],

      ),
    );
  }
}





