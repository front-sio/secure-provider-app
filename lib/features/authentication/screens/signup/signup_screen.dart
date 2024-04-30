import 'package:flutter/material.dart';
import 'package:secureprovider/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:secureprovider/utils/constants/size.dart';

import '../../../../common/widgets/login_signup/divider_form.dart';
import '../../../../common/widgets/login_signup/login_social_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SecuriteSize.defaultSpace,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              Text('Sign Up Text Title', style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: SecuriteSize.spaceBtwSection,),
              // form
              const SeSignUpForm(),
              const SizedBox(height: SecuriteSize.spaceBtwSection,),
                 // divider
              const SeDivider(text: 'or sign up with'),
              const SizedBox(height: SecuriteSize.spaceBtwSection,),
              // social buttons
              const SeSocialButtons(),
          ],),
          ),
      ),
    );
  }
}

