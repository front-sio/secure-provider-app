import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/common/widgets/loader/loader.dart';
import 'package:secureprovider/data/repositories/authentication/authentication_repository.dart';
import 'package:secureprovider/data/repositories/user/user_repository.dart';
import 'package:secureprovider/features/authentication/screens/signup/verify_email.dart';
import 'package:secureprovider/utils/network/network_manager.dart';
import 'package:secureprovider/utils/popups/full_screen_loader.dart';

import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {

    try {
      // start loading
      SeFullScreenLoader.openLoadingDialog('we are processing your information...', 'assets/animation/5.json');

      // network
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        SeFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if(!signupFormKey.currentState!.validate()){
        SeFullScreenLoader.stopLoading();
        return;
      }

      // check the privacy policy
      if(!privacyPolicy.value){
        SeLoader.warningSnackBar(
          title: 'accept privacy policy'.capitalize!,
          message: 'in order to create account, you must have to read and accept the Privacy Policy & terms of use.'.capitalize!
          );
          return;
      }

      // Register user in the Firebase Authentication & save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // save user data in the FireBase Firestore
      final newUser = UserModel(
        // id: userCredential.user!.uid,
        id: '', 
        username: '', 
        firstName: firstName.text.trim(), 
        lastName: lastName.text.trim(), 
        email: email.text.trim(), 
        phoneNumber: phoneNumber.text.trim(), 
        profilePicture: ''
        );

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      // show success message
      SeLoader.successSnackBar(
      title: 'Congratulations'.capitalize!, 
      message: 'your account has been created!, verify email to continue.'.capitalize!
      );


    }catch (e){
      SeLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally {
      SeFullScreenLoader.stopLoading();
      // move to verify email screen
      Get.to(()=> const VerifyEmailScreen());
    }
  }
}

