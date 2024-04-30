import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:secureprovider/utils/constants/size.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: const EdgeInsets.all(SecuriteSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading
            Text('Forget Password?', style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: SecuriteSize.spaceBtwItem,),
            Text("Don't worry sometimes people can forget too, enter your email and we will send you a password reset link", style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: SecuriteSize.spaceBtwSection * 2,),
            // text field
            TextFormField(
                decoration: const InputDecoration(
                        labelText: 'E-mail',
                        prefixIcon: Icon(Iconsax.direct),
                      ),
              ),
            const SizedBox(height: SecuriteSize.spaceBtwSection,),
            // submit button
             SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.off(()=> const ResetPassword()), 
                  child: const Text('Submit'),
              ),
            ),

          ],
        ),
        ),
    );
  }
}