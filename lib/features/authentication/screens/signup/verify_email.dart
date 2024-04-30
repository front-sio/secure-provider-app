import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/common/widgets/appbar/appbar.dart';
import 'package:secureprovider/features/authentication/screens/login/login_screen.dart';
import 'package:secureprovider/features/authentication/screens/login/phone_login.dart';
import 'package:secureprovider/features/authentication/screens/password_configuration/success_screen.dart';
import 'package:secureprovider/utils/constants/size.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SeAppBar(actions: [IconButton(onPressed: ()=> Get.offAll(() =>  const PhoneLoginScreen()), icon: const Icon(CupertinoIcons.clear))],),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SecuriteSize.defaultSpace),
          child: Column(
            children: [
            // image
            const Image(image: AssetImage('assets/images/salon.jpg')),
            const SizedBox(height: SecuriteSize.spaceBtwItem,),
            // title & subtile
            Text('Verify your email address!'.capitalize!, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: SecuriteSize.defaultSpace,),
            Text('masanja@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
            const SizedBox(height: SecuriteSize.defaultSpace,),
            Text('Congratulations! your account awaits: verify your email to start finding service provider.'.capitalize!, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
            const SizedBox(height: SecuriteSize.defaultSpace,),
            // buttons
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.offAll(()=>  SuccessScreen(
              image: 'assets/images/salon.jpg', 
              title: 'your account successfully created!',
              subtitle: 'Welcome! your account created successfully enjoy amazing services from your favarite on demand platform.', 
              onPressed: () => Get.to(()=> const LoginScreen()), 
              )), child: const Text('Continue'))),
            const SizedBox(height: SecuriteSize.defaultSpace,),
            SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text('Resend Email'))),
            
          ],),
        ),
      ),
    );
  }
}