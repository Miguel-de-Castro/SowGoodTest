import 'package:flutter/material.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';

AppBar sgAppBar(String titulo, BuildContext context) {
  return AppBar(
    title: Text(titulo),
    backgroundColor: CustomColors.patientPrimary,
    centerTitle: true,
    leading: TextButton.icon(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios, color: CustomColors.white),
      label: const Text('Voltar', style: TextStyle(color: CustomColors.white)),
      style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.patientPrimary),
    ),
    leadingWidth: 100,
  );
}
