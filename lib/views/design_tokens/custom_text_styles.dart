import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStylesBuilder {
  Color? _color;
  double? _height;
  double? _fontSize;
  TextDecoration? _decoration;

  TextStyle title() {
    TextStyle style = GoogleFonts.roboto(
      fontSize: _fontSize ?? 28,
      color: _color,
      height: _height,
      decoration: _decoration,
    );
    return style;
  }

  TextStyle subTitle() {
    TextStyle style = GoogleFonts.roboto(
      fontSize: _fontSize ?? 14,
      color: _color,
      height: _height,
      decoration: _decoration,
    );
    return style;
  }

  TextStyle placeholder() {
    TextStyle style = GoogleFonts.roboto(
      fontSize: _fontSize ?? 16,
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
