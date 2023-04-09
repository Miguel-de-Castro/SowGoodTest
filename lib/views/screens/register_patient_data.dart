import 'package:flutter/material.dart';
import 'package:sow_good/validators/text_validators.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';
import 'package:sow_good/views/screens/register_pacient_medical_data.dart';
import 'package:sow_good/views/widgets/button.dart';
import 'package:sow_good/views/widgets/sg_text_field.dart';

class RegisterPatientData extends StatefulWidget {
  const RegisterPatientData({super.key});

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
    return TextValidator.validateNumberWithSize(cpf, 11, 'CPF inválido');
  }

  double displayHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  void nextScreen() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const RegisterPatientMedicalData(),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: CustomColors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20, vertical: displayHeight(context) * 0.2),
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Dados do paciente',
                style: CustomTextStylesBuilder().withSize(30).placeholder(),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SGTextField(
                  controller: _nameControl,
                  validator: TextValidator.validateRequired,
                  placeholder: 'Nome completo do paciente',
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
                  controller: _sexControl,
                  validator: TextValidator.validateRequired,
                  placeholder: 'Sexo',
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
            ]),
          )
        ]),
      )),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: displayHeight(context) * 0.065),
        child: VariableTextPinkButton(
          onPressed: nextScreen,
          text: 'Continuar',
        ),
      ),
    ));
  }
}
