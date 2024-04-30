import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/utils/constants/size.dart';

import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
        ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SecuriteSize.defaultSpace),
          child: Column(
            children: [
               // image
           Image(image: const AssetImage('assets/images/salon.jpg'), width: SecuriteHelperFunction.screenWidth() * 0.6,),
           const SizedBox(height: SecuriteSize.spaceBtwSection,),

            // title and subtitle
            Text('Password Reset Email Sent'.capitalize!, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: SecuriteSize.spaceBtwItem,),
            Text("Your account security is our priority! we've sent you a secureprovider link to safety change your password and keep your account protected.".capitalize!, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
            const SizedBox(height: SecuriteSize.spaceBtwSection,),

            // buttons
             SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){}, child: const Text('Done')),
            ),
            const SizedBox(height: SecuriteSize.spaceBtwItem,),
            SizedBox(
              width: double.infinity,
              child: TextButton(onPressed: (){}, child: const Text('Resend Email')),
            ),
            ],

          ),
          ),
      ),
    );
  }
}