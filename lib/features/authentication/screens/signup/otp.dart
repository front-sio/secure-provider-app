import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:secureprovider/features/authentication/controllers/otp_controller/otp_controller.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';

class OTPVerificationScreen extends StatelessWidget {
  
  final String phoneNumber;
  OTPVerificationScreen({super.key, required this.phoneNumber, });

  final TextEditingController smsCodeController = TextEditingController();
   final controller = Get.put(OTPController());

  @override
  Widget build(BuildContext context) {
    var otp;
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text('Enter the OTP sent to $phoneNumber'),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code){
                otp = code;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                 if (otp != null) {
                  controller.verifyOtp(otp!, phoneNumber);
                } else {
                  // Handle case where otp is null
                   ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter the OTP.'),
                    ),
                  );
                }
              },
              child: const Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}