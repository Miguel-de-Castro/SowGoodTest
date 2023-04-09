import 'package:flutter/material.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class VariableTextPinkButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const VariableTextPinkButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: CustomColors.pacientPrimary,
        minimumSize: const Size(200, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
      ),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
              color: CustomColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal),
        ),
      ),
    );
  }
}
