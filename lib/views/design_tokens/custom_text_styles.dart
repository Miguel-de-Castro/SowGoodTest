import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  static TextStyle placeholder = GoogleFonts.roboto(fontSize: 16);
}

class CustomTextStylesBuilder {
  Color? _color;
  double? _height;
  double? _fontSize = 16;
  TextDecoration? _decoration;

  TextStyle placeholder() {
    TextStyle style = GoogleFonts.roboto(
      fontSize: _fontSize,
      color: _color,
      height: _height,
      decoration: _decoration,
    );
    return style;
  }

  CustomTextStylesBuilder withColor(Color color) {
    _color = color;
    return this;
  }

  CustomTextStylesBuilder withSize(double size) {
    _fontSize = size;
    return this;
  }
}
