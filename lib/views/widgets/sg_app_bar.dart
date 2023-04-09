import 'package:flutter/material.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';

AppBar sgAppBar(String titulo) {
  return AppBar(
    title: Text(titulo),
    backgroundColor: CustomColors.pacientPrimary,
    centerTitle: true,
    leading: ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.arrow_back_ios),
      label: Text("Voltar"),
      style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.pacientPrimary),
    ),
    leadingWidth: 100,
  );
}
