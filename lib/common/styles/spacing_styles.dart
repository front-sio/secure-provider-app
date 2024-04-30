import 'package:flutter/material.dart';
import 'package:secureprovider/utils/constants/size.dart';

class SecuriteSpacingStyles {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
     top: SecuriteSize.appBarHeight,
    left: SecuriteSize.defaultSpace,
    bottom: SecuriteSize.defaultSpace,
    right: SecuriteSize.defaultSpace,
  );
}