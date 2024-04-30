import 'package:flutter/material.dart';
import 'package:secureprovider/utils/theme/securite_themes/bottom_sheet_theme.dart';
import 'package:secureprovider/utils/theme/securite_themes/checkbox_theme.dart';
import 'package:secureprovider/utils/theme/securite_themes/chip_theme.dart';
import 'package:secureprovider/utils/theme/securite_themes/eleveted_button_theme.dart';
import 'package:secureprovider/utils/theme/securite_themes/outlined_button_theme.dart';
import 'package:secureprovider/utils/theme/securite_themes/text_field_theme.dart';
import 'package:secureprovider/utils/theme/securite_themes/text_theme.dart';


class SecuriteAppTheme {
  SecuriteAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color(0xffff7226),
    textTheme: SecuriteTextTheme.lightTextTheme,
    chipTheme: SecuriteChipTheme.lightChipTheme,
    checkboxTheme: SecuriteCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: SecuriteBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: SecuriteEveletedButtonTheme.lightElevetedButton,
    outlinedButtonTheme: SecuriteOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: SecuriteTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: const Color(0xffff7226),
    textTheme: SecuriteTextTheme.darkTextTheme,
    chipTheme: SecuriteChipTheme.darkChipTheme,
    checkboxTheme: SecuriteCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: SecuriteBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: SecuriteEveletedButtonTheme.darkElevetedButton,
    outlinedButtonTheme: SecuriteOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: SecuriteTextFormFieldTheme.darkInputDecorationTheme,
  );
}