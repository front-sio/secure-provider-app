import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/features/authentication/controllers/signin/signin_controller.dart';
import 'package:secureprovider/features/authentication/screens/signup/signup_screen.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';

import '../../../../../utils/validator/validate_utility.dart';



class SePhoneLoginForm extends StatelessWidget {
  const SePhoneLoginForm({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {
    final dark = SecuriteHelperFunction.isDarkMode(context);
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
      padding: const EdgeInsets.symmetric(vertical: SecuriteSize.spaceBtwSection),
      child: Column(
        children: [
          // phone
          TextFormField(
            controller: controller.phoneNumber,
            validator:(value) => SecuriteValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.call), labelText: 'Mobile Phone'),
          ),
          
          
          const SizedBox(height: 16 / 2,),
         
          
          const SizedBox(height: SecuriteSize.spaceBtwSection),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if(controller.loginFormKey.currentState!.validate()){
                  controller.phoneAuthentication(controller.phoneNumber.text.trim());
                }
                // Get.to(()=> OTPVerificationScreen());
              }, 
              child: const Text('Sign In'),
              ),
          ),
          const SizedBox(height: SecuriteSize.spaceBtwItem),
           SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.to(() => const SignUpScreen()), 
              child: Text('Create Account', style: TextStyle(color: dark ? Colors.white: Colors.black),),
              ),
          ),    
        ],
      ),
    ),
    );
  }
}


