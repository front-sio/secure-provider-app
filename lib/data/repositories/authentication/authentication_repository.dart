import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:secureprovider/features/authentication/screens/login/phone_login.dart';
import 'package:secureprovider/features/authentication/screens/signup/verify_email.dart';

import 'package:secureprovider/features/authentication/screens/onboarding/onboarding_screen.dart';
import '../../../navigation_bar.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final deviceStorage = GetStorage();

  var verificationId = ''.obs;

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    screenRedirect();
  }


  void screenRedirect() async{
    final user = _auth.currentUser;
    if (user != null){
      if(user.emailVerified){
        Get.offAll(() =>  const NavigationMenu());
      }
      else {
        Get.offAll(() => const VerifyEmailScreen());
      }
    }else {
     _handleFirstTimeUser();
    }
  }


  void _handleFirstTimeUser() {
    final isFirstTime = deviceStorage.read('isFirstTime') ?? true;
    Get.offAll(isFirstTime ? () => const OnBoardingScreen() : () => const PhoneLoginScreen());
  }

  

  Future<void> phoneAuthentication(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: _verificationCompleted,
        verificationFailed: _verificationFailed,
        codeSent: _codeSent,
        codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
      );
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  void signInWithSmsCode(String smsCode, String verificationId) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      UserCredential userCredential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode)
      );
      // Handle successful sign-in
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp)
    );
    return credentials.user != null ? true : false;
  }

  void _verificationCompleted(PhoneAuthCredential credential) async {
    try {
      await _auth.signInWithCredential(credential);
      // Handle successful sign-in

    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  void _verificationFailed(FirebaseAuthException e) {
    // Handle verification failure
    print('Verification failed: ${e.message}');
  }

  void _codeSent(String verificationId, int? resendToken) {
    // Handle code sent to the user's phone
    this.verificationId.value = verificationId;
    print('SMS code sent successfully. Verification ID: $verificationId');
  }

  void _codeAutoRetrievalTimeout(String verificationId) {
    // Handle code auto retrieval timeout
    this.verificationId.value = verificationId;
    print('SMS code auto retrieval timeout. Verification ID: $verificationId');
  }

  Future<UserCredential?> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Handle successful registration
    } on FirebaseAuthException catch (e) {
      // Handle error
      print('Error: $e');
    }

    return null;
  }


  Future<void> sendEmailVerification(String email, String password) async {
    try {
       await _auth.currentUser?.sendEmailVerification();
      // Handle successful sign-in
    }on FirebaseAuthException catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password,);
      // Handle successful sign-in
    } on FirebaseAuthException catch (e) {
      // Handle error
      print('Error: $e');
    }

    return null;
  }


  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the Authentication flow
      final GoogleSignInAccount? userAccount  = await GoogleSignIn().signIn();

      // obtain the auth detail from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // create new credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once sign in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
    return null;
  }




  Future<void> signOut() async {
    await _auth.signOut();
    Get.offAll(()=> const PhoneLoginScreen());
  }

   User? get currentUser => _auth.currentUser;
}
