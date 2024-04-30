import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/features/authentication/controllers/signin/signin_controller.dart';
import 'package:secureprovider/features/authentication/screens/login/login_screen.dart';
import 'package:secureprovider/features/authentication/screens/login/phone_login.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/constants/size.dart';

class SeSocialButtons extends StatelessWidget {
  const SeSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: SecuriteColors.grey,), borderRadius: BorderRadius.circular(100)),
          child: IconButton(onPressed: () => Get.offAll(()=> const LoginScreen()), 
          icon: const Image(width: 25, image: AssetImage('assets/icons/icons8-password-50.png'))
          ),
        ),
        const SizedBox(width: SecuriteSize.spaceBtwItem,),
        Container(
          decoration: BoxDecoration(border: Border.all(color: SecuriteColors.grey,), borderRadius: BorderRadius.circular(100)),
          child: IconButton(onPressed: () => controller.googleSignIn(), 
          icon: const Image(image: AssetImage('assets/icons/icons8-google-48.png'))
          ),
        ),
        const SizedBox(width: SecuriteSize.spaceBtwItem,),
        Container(
          decoration: BoxDecoration(border: Border.all(color: SecuriteColors.grey,), borderRadius: BorderRadius.circular(100)),
          child: IconButton(onPressed: () => Get.offAll(()=> const PhoneLoginScreen()), 
          icon: const Icon(Iconsax.call),
          ),
        ),
      ],
    );
  }
}
