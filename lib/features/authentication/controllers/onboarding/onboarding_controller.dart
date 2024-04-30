import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/features/authentication/screens/login/login_screen.dart';
import 'package:secureprovider/features/authentication/screens/login/phone_login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

// variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  // Update Current Index When Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Jump to the specific dot selected page
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // Update Current Page and Skip To The Next Page
  void nextPage(){
    if (currentPageIndex == 2){
      Get.offAll(() => const PhoneLoginScreen());
    }else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update Current Index And Jump To The Last Page
  void skipPage(){
    currentPageIndex.value = 2;
    Get.offAll(const LoginScreen());
  }
}