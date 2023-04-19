import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';

class sgLoader extends StatelessWidget {
  final Color color;
  const sgLoader({super.key, this.color = CustomColors.patientPrimary});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 100,
      height: 100,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(CustomColors.patientPrimary),
        strokeWidth: 10,
      ),
    ));
  }
}
