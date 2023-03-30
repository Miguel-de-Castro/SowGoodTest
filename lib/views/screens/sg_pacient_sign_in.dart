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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.white,
        title: Text(
          'Cadastro',
          style: CustomTextStylesBuilder()
              .withSize(26)
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
                            .withSize(28)
                            .placeholder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SGTextArea(
                        controller: _alergiesController,
                        placeholder: 'Alergias',
                        icon: Icons.medical_services_outlined),
                    const SizedBox(height: 20),
                    SGTextArea(
                        controller: _medicationsController,
                        placeholder: 'Medicamentos',
                        icon: Icons.medical_services_outlined),
                    const SizedBox(height: 20),
                    SGTextArea(
                        controller: _observationsController,
                        placeholder: 'Observações',
                        icon: Icons.medical_services_outlined),
                    const SizedBox(height: 90),
                    Center(
                      child: ElevatedButton(onPressed: () {
                          print(_alergiesController.text);
                          print(_medicationsController.text);
                          print(_observationsController.text);
                        }, child: Text('Continuar'),)
                    ),
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
