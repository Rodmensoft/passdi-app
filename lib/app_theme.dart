import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:passdi_app/utils/colors.dart';
import 'package:passdi_app/utils/common.dart';

class AppTheme {
  //
  AppTheme._();

  static ThemeData lightTheme({Color? color}) => ThemeData(
        primarySwatch: createMaterialColor(color ?? primaryColor),
        primaryColor: color ?? primaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.montserrat().fontFamily,

        // useMaterial3: true,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            mouseCursor: MaterialStateMouseCursor.clickable),
        iconTheme: const IconThemeData(color: appTextSecondaryColor),
        textTheme: GoogleFonts.montserratTextTheme().copyWith(),
        dialogBackgroundColor: Colors.white,
        unselectedWidgetColor: primaryColor,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor,
          selectionColor: primaryColor.withOpacity(0.4),
          selectionHandleColor: primaryColor,
        ),
        dividerColor: borderColor,
        bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius:
                  radiusOnly(topLeft: defaultRadius, topRight: defaultRadius)),
          backgroundColor: Colors.white,
        ),
        cardColor: cardColor,
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light)),
        dialogTheme: DialogTheme(shape: dialogShape()),
        navigationBarTheme: NavigationBarThemeData(
            labelTextStyle:
                MaterialStateProperty.all(primaryTextStyle(size: 10))),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        inputDecorationTheme: InputDecorationTheme(
          // style
          hintStyle: defaultHintTextFieldStyle,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor.withOpacity(0.2)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor.withOpacity(0.3)),
          ),
        ),
      );

  static ThemeData darkTheme({Color? color}) => ThemeData(
        primarySwatch: createMaterialColor(primaryColor),
        primaryColor: primaryColor,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
        ),
        scaffoldBackgroundColor: scaffoldColorDark,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: scaffoldSecondaryDark),
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: GoogleFonts.montserratTextTheme()
            .copyWith(titleMedium: defaultTextFieldStyle),
        dialogBackgroundColor: scaffoldSecondaryDark,
        unselectedWidgetColor: Colors.white60,
        // useMaterial3: true,
        bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius:
                  radiusOnly(topLeft: defaultRadius, topRight: defaultRadius)),
          backgroundColor: scaffoldSecondaryDark,
        ),
        dividerColor: dividerDarkColor,
        cardColor: scaffoldSecondaryDark,
        dialogTheme: DialogTheme(shape: dialogShape()),
        navigationBarTheme: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
                primaryTextStyle(size: 10, color: Colors.white))),
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: defaultHintTextFieldStyle,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor.withOpacity(0.2)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor.withOpacity(0.3)),
          ),
        ),
      );
}
