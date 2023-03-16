import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Desing {
  //? cores do brand
  static const Color corBackGround = Color(0xFF86cecb);
  static const Color corPrimaria = Color(0xFF137A7F);
  static const Color corSecundaria = Color(0xFFe12885);
  static const Color corTeriaria = Color(0xFFbec8d1);
  static const Color corBack = Color(0xFF373b3e);

  //? material color
  static const int _corPrimariaSwatch = 0xFF137a7f;
  static const MaterialColor color = MaterialColor(
    _corPrimariaSwatch,
    <int, Color>{
      50: Color.fromRGBO(19, 122, 127, .1),
      100: Color.fromRGBO(19, 122, 127, .2),
      200: Color.fromRGBO(19, 122, 127, .3),
      300: Color.fromRGBO(19, 122, 127, .4),
      400: Color.fromRGBO(19, 122, 127, .5),
      500: Color.fromRGBO(19, 122, 127, .6),
      600: Color.fromRGBO(19, 122, 127, .7),
      700: Color.fromRGBO(19, 122, 127, .8),
      800: Color.fromRGBO(19, 122, 127, .9),
      900: Color.fromRGBO(19, 122, 127, 1),
    },
  );

  //? outilneButtom
  static ButtonStyle outlineButtomStyle({
    Color cor = corBack,
    double padding = 15,
  }) {
    return OutlinedButton.styleFrom(
      foregroundColor: cor,
      padding: EdgeInsets.symmetric(vertical: padding),
      side: BorderSide(color: cor),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(45),
        ),
      ),
    );
  }

  //? tema
  static ThemeData tema = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: corBackGround,
    primarySwatch: color,
    primaryColor: color,
    textTheme: GoogleFonts.lakkiReddyTextTheme(
      ThemeData.light().textTheme,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: outlineButtomStyle(),
    ),
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
          elevation: 0,
          color: Colors.transparent,
          centerTitle: true,
          titleTextStyle: GoogleFonts.lakkiReddy(fontSize: 25),
        ),
  );
}
