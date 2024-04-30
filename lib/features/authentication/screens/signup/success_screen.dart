import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/common/styles/spacing_styles.dart';
import 'package:secureprovider/common/widgets/appbar/appbar.dart';
import 'package:secureprovider/features/authentication/screens/login/login_screen.dart';
import 'package:secureprovider/utils/constants/size.dart';

class SignupSuccessScreen extends StatelessWidget {
  const SignupSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Padding(
          padding: SecuriteSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
            // image
            const Image(image: AssetImage('assets/animation/Animation - 1713795156048.gif')),
            const SizedBox(height: SecuriteSize.spaceBtwItem,),
            // title & subtile
            Text('your account successfully created!'.capitalize!, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: SecuriteSize.defaultSpace,),
            Text('Welcome! your account created successfully enjoy amazing services from your favarite on demand platform.'.capitalize!, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
            const SizedBox(height: SecuriteSize.defaultSpace,),
            // buttons
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(()=> const LoginScreen()), child: const Text('Continue'))),
            const SizedBox(height: SecuriteSize.defaultSpace,),
            
          ],),
        ),
      ),
    );
  }
}