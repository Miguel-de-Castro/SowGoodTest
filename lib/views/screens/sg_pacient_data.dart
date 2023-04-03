// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';
import 'package:sow_good/views/widgets/sg_button.dart';
import 'package:sow_good/views/widgets/sg_text_area.dart';

class SGPacientSignIn extends StatefulWidget {
  const SGPacientSignIn({super.key});

  @override
  _SGPacientSignInState createState() => _SGPacientSignInState();
}

class _SGPacientSignInState extends State<SGPacientSignIn> {
  final TextEditingController _alergiesController = TextEditingController();
  final TextEditingController _observationsController = TextEditingController();
  final TextEditingController _medicationsController = TextEditingController();

  void _showDialog(BuildContext context, TextEditingController controller, IconData labelIcon,
      String labelText) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SGTextArea(
              controller: controller, placeholder: labelText, icon: labelIcon),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.white,
        title: Text(
          'Cadastro',
          style: CustomTextStylesBuilder()
              .withColor(CustomColors.black)
              .placeholder(),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 3,
            width: double.infinity,
            color: CustomColors.pacientPrimary,
          ),
          const SizedBox(
            height: 160,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              heightFactor: 1.0,
              child: SizedBox(
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Dados médicos',
                        style: CustomTextStylesBuilder()
                            .withColor(CustomColors.black)
                            .placeholder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () => _showDialog(
                            context, _alergiesController, Icons.abc,'Alergias'),
                        child: SGTextArea(
                          controller: _alergiesController,
                          placeholder: 'Alergias',
                          icon: Icons.abc,
                          condition: false,
                        )),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () => _showDialog(
                            context, _medicationsController, Icons.abc,'Medicamentos'),
                        child: SGTextArea(
                          controller: _medicationsController,
                          placeholder: 'Medicamentos',
                          icon: Icons.abc,
                          condition: false,
                        )),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () => _showDialog(
                            context, _observationsController, Icons.abc,'Observações'),
                        child: SGTextArea(
                          controller: _observationsController,
                          placeholder: 'Observações',
                          icon: Icons.abc,
                          condition: false,
                        )),
                    const SizedBox(height: 20),
                    Center(
                        child: SGButton(
                            onPressed: () {
                              print(_alergiesController.text);
                              print(_medicationsController.text);
                              print(_observationsController.text);
                            },
                            text: 'Continuar')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
