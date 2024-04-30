import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/features/authentication/controllers/signup/signup_controller.dart';
import 'package:secureprovider/features/authentication/screens/signup/verify_email.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';
import 'package:secureprovider/utils/validator/validate_utility.dart';

class SeSignUpForm extends StatelessWidget {
  const SeSignUpForm({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {
    final dark = SecuriteHelperFunction.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.firstName,
                validator: (value) => SecuriteValidator.validateEmptyText('First Name', value),
                expands: false,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
            const SizedBox(width: SecuriteSize.spaceBtwItem,),
             Expanded(
              child: TextFormField(
                controller: controller.lastName,
                validator: (value) => SecuriteValidator.validateEmptyText('Last Name', value),
                expands: false,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
           
    
          ],
        ),
        const SizedBox(height: SecuriteSize.spacingBtwInputFields,),
        TextFormField(
          controller: controller.email,
          // validator: (value) => SecuriteValidator.validateEmail(value),
          decoration: const InputDecoration(
            labelText: 'E-mail',
            prefixIcon: Icon(Iconsax.direct),
          ),
        ),
        const SizedBox(height: SecuriteSize.spacingBtwInputFields,),
        TextFormField(
          validator: (value) => SecuriteValidator.validatePhoneNumber(value),
          controller: controller.phoneNumber,
          decoration: const InputDecoration(
                  labelText: 'Phone',
                  prefixIcon: Icon(Iconsax.call),
                ),
        ),
        const SizedBox(height: SecuriteSize.spacingBtwInputFields,),
        Obx(
          () => TextFormField(
            controller: controller.password,
            validator: (value) => SecuriteValidator.validatePassword(value),
            obscureText: controller.hidePassword.value,
            decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)
                      )
                  ),
          ),
        ),
        const SizedBox(height: SecuriteSize.spaceBtwSection,),
    
        // terms and condition checkbox
        Row(
          children: [
            SizedBox(height: 24, width: 24, child: Obx(
              ()=> Checkbox(
                
                value: controller.privacyPolicy.value, onChanged: (value) => 
            controller.privacyPolicy.value = !controller.privacyPolicy.value
            ))),
            const SizedBox(width: SecuriteSize.spaceBtwItem,),
            Text.rich(TextSpan(children: [
              TextSpan(text: 'I agree to ', style: Theme.of(context).textTheme.bodySmall,),
              TextSpan(text: 'Privacy Policy ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? SecuriteColors.white : Colors.blue,
                decoration: TextDecoration.underline,
              ),),
              TextSpan(text: 'and ', style: Theme.of(context).textTheme.bodySmall,),
              TextSpan(text: 'Terms of use ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? SecuriteColors.white : Colors.blue,
                decoration: TextDecoration.underline,
              ),),
            ]))
    
          ],
        ),
    const SizedBox(height: SecuriteSize.spaceBtwSection,),
    
        // button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
                        // onPressed: () => controller.signup(), 
                        onPressed: () {
                          if(controller.signupFormKey.currentState!.validate()){
                            controller.signup();
                            // controller.phoneAuthentication(controller.phoneNumber.text.trim());
                          }
                          
                        }, 
                        child: const Text('Create account'),
                        ),
        ),
        
        
      ],
    ));
  }
}