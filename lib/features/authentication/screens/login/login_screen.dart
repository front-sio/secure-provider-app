import 'package:flutter/material.dart';
import 'package:secureprovider/common/styles/spacing_styles.dart';
import 'package:secureprovider/features/authentication/screens/login/widgets/login_form.dart';
import 'package:secureprovider/features/authentication/screens/login/widgets/login_header.dart';
import 'package:secureprovider/common/widgets/login_signup/login_social_button.dart';
import 'package:secureprovider/common/widgets/login_signup/divider_form.dart';
import 'package:secureprovider/utils/constants/size.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  SecuriteSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              // logo, title & subtitle
              SeLoginHeader(),
              // form
              SeLoginForm(),

              // Divider
              SeDivider(text: 'or sign in with',),
              SizedBox(height: SecuriteSize.spaceBtwSection,),
              // Footer
              SeSocialButtons(),
            ],
          ),
          ),
      ),
    );
  }
}





