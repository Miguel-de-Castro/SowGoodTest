import 'package:flutter/material.dart';
import 'package:sow_good/models/patient.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';
import 'package:sow_good/views/screens/register_patient_guardians.dart';
import 'package:sow_good/views/widgets/button.dart';
import 'package:sow_good/views/widgets/sg_text_area.dart';

class RegisterPatientMedicalData extends StatefulWidget {
  final Patient patient;
  const RegisterPatientMedicalData({super.key, required this.patient});

  @override
  _RegisterPatientMedicalDataState createState() =>
      _RegisterPatientMedicalDataState();
}

class _RegisterPatientMedicalDataState
    extends State<RegisterPatientMedicalData> {
  final TextEditingController _alergiesController = TextEditingController();
  final TextEditingController _observationsController = TextEditingController();
  final TextEditingController _medicationsController = TextEditingController();

  double displayHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  void nextScreen() {
    // TODO: check not null validators BACKEND
    MedicalData medicalData = MedicalData(
        alergies:
            _alergiesController.text.isEmpty ? '-' : _alergiesController.text,
        observations: _observationsController.text.isEmpty
            ? '-'
            : _observationsController.text,
        medications: _medicationsController.text.isEmpty
            ? '-'
            : _medicationsController.text);
    widget.patient.medicalData = medicalData;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>
              RegisterPatientGuardians(patient: widget.patient),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 14,
            color: CustomColors.black,
          ),
          label: Text(
            'Voltar',
            style: CustomTextStylesBuilder()
                .withSize(14)
                .withColor(CustomColors.black)
                .placeholder(),
          ),
        ),
        leadingWidth: 80,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Container(
            color: CustomColors.patientPrimary,
            height: 3,
            width: double.infinity,
          ),
        ),
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: displayHeight(context) * 0.1, horizontal: 20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Dados médicos',
                      style:
                          CustomTextStylesBuilder().withSize(30).placeholder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.55,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: SGTextArea(
                            controller: _alergiesController,
                            placeholder: 'Alergias',
                            icon: Icons.sick_outlined,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: SGTextArea(
                            controller: _medicationsController,
                            placeholder: 'Medicamentos',
                            icon: Icons.medication_outlined,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: SGTextArea(
                            controller: _observationsController,
                            placeholder: 'Observações',
                            icon: Icons.medical_information_outlined,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VariableTextPinkButton(
                  onPressed: () => nextScreen(),
                  text: 'Continuar',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
