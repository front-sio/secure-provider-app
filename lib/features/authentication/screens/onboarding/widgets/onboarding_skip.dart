import 'package:flutter/material.dart';
import 'package:secureprovider/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: SecuriteDeviceUtils.getAppBarHeight(),
      right: SecuriteSize.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(), 
        child: const Text('Skip'),
      ),
    );
  }
}