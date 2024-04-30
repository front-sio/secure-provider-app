import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:secureprovider/data/repositories/authentication/authentication_repository.dart';
import 'package:secureprovider/data/repositories/user/user_repository.dart';
import 'package:secureprovider/features/personalization/models/user_model.dart';
import 'package:secureprovider/navigation_bar.dart';

class OTPController extends GetxController {
  final AuthenticationRepository _authRepository = AuthenticationRepository.instance;
  final UserRepository _userRepository = UserRepository.instance;
   final uuid = const Uuid();

  static OTPController get instance => Get.find();

  void verifyOtp(String otp, String phoneNumber) async {
    var isVerified = await _authRepository.verifyOTP(otp);
    if (isVerified) {
      // OTP is verified
      // Check if the user is registered
      User? currentUser = _authRepository.currentUser;
      if (currentUser != null) {
        Get.offAll(() => const NavigationMenu());
      } else {
        // User is not registered, register the user
        String userId = uuid.v4();
        UserModel newUser = UserModel(
          id: userId,
          email: '',
          username: '',
          phoneNumber: phoneNumber,
          firstName: '',
          lastName: '',
          profilePicture: '',
        );
        try {
          // Save the user record
          await _userRepository.saveUserRecord(newUser);
          Get.offAll(() => const NavigationMenu());
        } catch (e) {
          // Handle registration error
          // You may want to show an error message to the user here
        }
      }
    } else {
      // OTP verification failed, navigate back
      Get.back();
    }
  }
}
