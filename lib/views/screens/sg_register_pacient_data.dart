// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';
import 'package:sow_good/views/widgets/sg_button.dart';
import 'package:sow_good/views/widgets/sg_text_area.dart';

// ignore: must_be_immutable
class SGResgisterPatientMedicalData extends StatefulWidget {
  const SGResgisterPatientMedicalData({super.key});

  @override
  _SGResgisterPatientMedicalDataState createState() => _SGResgisterPatientMedicalDataState();
}

class _SGResgisterPatientMedicalDataState extends State<SGResgisterPatientMedicalData> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
                key: _formkey,
                child: Column(
                  children: <Widget>[
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
                      icon: Icons.sick_outlined,
                    ),
                    const SizedBox(height: 20),
                    SGTextArea(
                      controller: _medicationsController,
                      placeholder: 'Medicamentos',
                      icon: Icons.medication_outlined,
                    ),
                    const SizedBox(height: 20),
                    SGTextArea(
                      controller: _observationsController,
                      placeholder: 'Observações',
                      icon: Icons.medical_information_outlined,
                    ),
                    const SizedBox(height: 20),
                    Center(
                        child: VariableTextPinkButton(
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
        ),
      ),
    );
  }
}
