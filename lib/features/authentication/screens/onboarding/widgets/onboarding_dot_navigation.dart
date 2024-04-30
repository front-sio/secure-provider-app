import 'package:flutter/material.dart';
import 'package:secureprovider/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/device/device_utility.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = SecuriteHelperFunction.isDarkMode(context);
    return Positioned(
      bottom: SecuriteDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: SecuriteSize.defaultSpace,
      // 
      child: SmoothPageIndicator(
        controller: controller.pageController, 
        count: 3,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(activeDotColor: dark ? SecuriteColors.light : SecuriteColors.dark, dotHeight: 6),
        ),
      );
  }
}