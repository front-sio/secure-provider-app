import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/common/widgets/loader/animation_loader.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';

class SeFullScreenLoader {



  static void openLoadingDialog(String text, String animation){
    showDialog(
      context: Get.overlayContext!, 
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: SecuriteHelperFunction.isDarkMode(Get.context!) ? SecuriteColors.dark : SecuriteColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250,),
              SeAnimationLoaderWidget(animation: animation, text: text,),
            ],
          ),
        )
        )
      );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}