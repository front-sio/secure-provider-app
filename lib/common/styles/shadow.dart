import 'package:flutter/material.dart';
import 'package:secureprovider/utils/constants/colors.dart';

class SeShadowStyle {


  static final verticalProviderShadow = BoxShadow(
    color: SecuriteColors.grey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );


  static final horizontalProviderShadow = BoxShadow(
    color: SecuriteColors.grey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
}