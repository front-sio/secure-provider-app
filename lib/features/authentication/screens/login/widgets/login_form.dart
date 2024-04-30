import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/features/authentication/controllers/signin/signin_controller.dart';
import 'package:secureprovider/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:secureprovider/features/authentication/screens/signup/signup_screen.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';
import 'package:secureprovider/utils/validator/validate_utility.dart';

import '../../../../../navigation_bar.dart';

class SeLoginForm extends StatelessWidget {
  const SeLoginForm({
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dark = SecuriteHelperFunction.isDarkMode(context);
    return Form(
      key: controller.loginFormKey,
      child: Padding(
      padding: const EdgeInsets.symmetric(vertical: SecuriteSize.spaceBtwSection),
      child: Column(
        children: [
          // email
          TextFormField(
            controller: controller.email,
            validator: (value) => SecuriteValidator.validateEmptyText('Email', value),
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct), labelText: 'E-mail'),
          ),
          const SizedBox(height: 16,),
          TextFormField(
            controller: controller.password,
            validator: (value) =>  SecuriteValidator.validateEmptyText('Password', value),
            obscureText: controller.hidePassword.value,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check), 
              labelText: 'Password', 
              suffixIcon: Icon(Iconsax.eye_slash),
              ),
          ),
          const SizedBox(height: 16 / 2,),
          // check remember me and forget password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            // remember me
            Row(children: [
              Checkbox(value: controller.rememberMe.value, onChanged: (value){}),
              const Text('Remember Me')
            ],),
            // forget password
            TextButton(onPressed: () => Get.to(()=> const ForgetPassword()), child: const Text('Forget Password?'))
          ],),
          const SizedBox(height: SecuriteSize.spaceBtwSection),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(()=> const NavigationMenu()), 
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