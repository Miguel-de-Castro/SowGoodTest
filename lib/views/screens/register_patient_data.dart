import 'package:flutter/material.dart';
import 'package:sow_good/models/patient.dart';
import 'package:sow_good/validators/text_validators.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';
import 'package:sow_good/views/screens/register_patient_medical_data.dart';
import 'package:sow_good/views/widgets/button.dart';
import 'package:sow_good/views/widgets/sg_text_field.dart';

class RegisterPatientData extends StatefulWidget {
  final Patient patient;
  const RegisterPatientData({super.key, required this.patient});

  @override
  State<RegisterPatientData> createState() => _RegisterPatientDataState();
}

class _RegisterPatientDataState extends State<RegisterPatientData> {
  final TextEditingController _nameControl = TextEditingController();
  final TextEditingController _cpfControl = TextEditingController();
  final TextEditingController _sexControl = TextEditingController();
  final TextEditingController _birthdayControl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _cpfValidator(String? cpf) {
    if (cpf == '' || cpf == null) {
      return null;
    }
    return TextValidator.validateCPF(cpf);
  }

  void _handleRadioValueChange(String? value) {
    setState(() {
      _sexControl.text = value!;
    });
  }

  double displayHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  void nextScreen() {
    // TODO: check not null validators BACKEND
    if (_formKey.currentState!.validate()) {
      widget.patient.name = _nameControl.text;
      widget.patient.cpf = _cpfControl.text.isEmpty ? '' : _cpfControl.text;
      widget.patient.sex = _sexControl.text;
      widget.patient.birthDate = _birthdayControl.text;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                RegisterPatientMedicalData(patient: widget.patient),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
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
                      'Dados do patiente',
                      style:
                          CustomTextStylesBuilder().withSize(30).placeholder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.55,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: SGTextField(
                              controller: _nameControl,
                              validator: TextValidator.validateRequired,
                              placeholder: 'Nome completo do patiente',
                              icon: Icons.person_outline,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: SGTextField(
                              controller: _cpfControl,
                              validator: _cpfValidator,
                              placeholder: 'CPF',
                              icon: Icons.person_outline,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: SGTextField(
                              controller: _birthdayControl,
                              validator: TextValidator.validateRequired,
                              placeholder: 'Data de nascimento',
                              icon: Icons.calendar_month,
                              type: FieldType.date,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Text(
                                      'Sexo: ',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Transform.scale(
                                        scale: 1.5,
                                        child: Radio(
                                          value: 'Masculino',
                                          groupValue: _sexControl.text,
                                          onChanged: (String? selectedSexo) =>
                                              _handleRadioValueChange(
                                                  'Masculino'),
                                          activeColor:
                                              CustomColors.patientPrimary,
                                        )),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Masculino',
                                          style: TextStyle(fontSize: 16),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child: Transform.scale(
                                          scale: 1.5,
                                          child: Radio(
                                            splashRadius: 30,
                                            value: 'Feminino',
                                            groupValue: _sexControl.text,
                                            onChanged: (String? selectedSexo) =>
                                                _handleRadioValueChange(
                                                    'Feminino'),
                                            activeColor:
                                                CustomColors.patientPrimary,
                                          )),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Feminino',
                                          style: TextStyle(fontSize: 16),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
