import 'package:e_shop/utils/theme/appbar_theme.dart';
import 'package:e_shop/utils/theme/bottomsheet_theme.dart';
import 'package:e_shop/utils/theme/checkbox_theme.dart';
import 'package:e_shop/utils/theme/chip_theme.dart';
import 'package:e_shop/utils/theme/elevation_theme.dart';
import 'package:e_shop/utils/theme/text_theme.dart';
import 'package:e_shop/utils/theme/textformfield_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme{
  TAppTheme._();
  static ThemeData lightTheme=ThemeData(
    useMaterial3: true,
    fontFamily: 'Satoshi',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipThemeData,
    appBarTheme: TAppBar.lightAppBarTheme,
    checkboxTheme: TCheckbox.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheet.lightBottomSheetTheme,
    elevatedButtonTheme: TElevation.lightElevationTheme,
    inputDecorationTheme: TTextFormField.lightTextFormFieldTheme
  );
  static ThemeData darkTheme=ThemeData(
    useMaterial3: true,
    fontFamily: 'Satoshi',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipThemeData,
    appBarTheme: TAppBar.darkAppBarTheme,
    checkboxTheme: TCheckbox.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheet.darkBottomSheetTheme,
    elevatedButtonTheme: TElevation.darkElevationTheme,
    inputDecorationTheme: TTextFormField.darkTextFormFieldTheme
  );
}