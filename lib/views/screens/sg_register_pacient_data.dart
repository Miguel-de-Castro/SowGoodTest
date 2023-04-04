// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sow_good/models/sg_pacient.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';
import 'package:sow_good/views/screens/telateste.dart';
import 'package:sow_good/views/widgets/sg_button.dart';
import 'package:sow_good/views/widgets/sg_text_area.dart';

// ignore: must_be_immutable
class SGPacientSignIn extends StatefulWidget {
  SGPacientSignIn({super.key, required this.pacient});
  SGPacient pacient;

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
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(3),
            child: Container(
              color: CustomColors.pacientPrimary,
              height: 3,
              width: double.infinity,
            )),
        centerTitle: true,
        backgroundColor: CustomColors.white,
        title: Text(
          'Cadastro',
          style: CustomTextStylesBuilder()
              .withColor(CustomColors.black)
              .withSize(26)
              .placeholder(),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 350,
              child: Form(
                child: Column(
                  // ignore: always_specify_types
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 100),
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
                      icon: Icons.abc,
                    ),
                    const SizedBox(height: 20),
                    SGTextArea(
                      controller: _medicationsController,
                      placeholder: 'Medicamentos',
                      icon: Icons.abc,
                    ),
                    const SizedBox(height: 20),
                    SGTextArea(
                      controller: _observationsController,
                      placeholder: 'Observações',
                      icon: Icons.abc,
                    ),
                    const SizedBox(height: 20),
                    Center(
                        child: VariableTextPinkButton(
                            onPressed: () {
                              widget.pacient.alergies = _alergiesController.text;
                              widget.pacient.medications = _medicationsController.text;
                              widget.pacient.observations = _observationsController.text;
                              // ignore: always_specify_types
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TelaTeste(pacient: widget.pacient),));
                            },
                            text: 'Continuar')),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
