import 'package:flutter/material.dart';
import 'package:sow_good/models/patient.dart';
import 'package:sow_good/validators/text_validators.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';
import 'package:sow_good/views/screens/register_patient_data.dart';
import 'package:sow_good/views/widgets/button.dart';
import 'package:sow_good/views/widgets/sg_text_field.dart';

class RegisterPatientAccount extends StatefulWidget {
  const RegisterPatientAccount({super.key});

  @override
  State<RegisterPatientAccount> createState() => _RegisterPatientAccountState();
}

class _RegisterPatientAccountState extends State<RegisterPatientAccount> {
  final TextEditingController _emailControl = TextEditingController();
  final TextEditingController _passwordControl = TextEditingController();
  final TextEditingController _passwordConfirmControl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Patient patient;

  String? _emailValidator(String? email) {
    String? error = TextValidator.validateRequired(email);
    return error ?? TextValidator.validateEmail(email!);
  }

  String? _passwordValidator(String? password) {
    String? error = TextValidator.validateRequired(password);
    return error ?? TextValidator.validatePassword(password!);
  }

  String? _passwordConfirmValidator(String? passwordConfirmation) {
    String? error = TextValidator.validateRequired(passwordConfirmation);
    return error ??
        (passwordConfirmation == _passwordControl.text
            ? null
            : 'As senhas não coincidem');
  }

  double displayHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  void nextScreen() {
    if (_formKey.currentState!.validate()) {
      patient =
          Patient(password: _passwordControl.text, email: _emailControl.text);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                RegisterPatientData(patient: patient),
          ));
    }
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
            )),
        centerTitle: true,
        backgroundColor: CustomColors.white,
        title: Text(
          'Cadastro',
          style: CustomTextStylesBuilder()
              .withColor(CustomColors.black)
              .withSize(26)
              .title(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: displayHeight(context) * 0.1,
              horizontal: 20,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Informações da conta',
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
                              controller: _emailControl,
                              validator: _emailValidator,
                              placeholder: 'E-mail',
                              icon: Icons.email_outlined,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: SGTextField(
                              controller: _passwordControl,
                              validator: _passwordValidator,
                              placeholder: 'Senha',
                              icon: Icons.lock_outline,
                              isPassword: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: SGTextField(
                              controller: _passwordConfirmControl,
                              validator: _passwordConfirmValidator,
                              placeholder: 'Confirmar senha',
                              icon: Icons.lock_outline,
                              isPassword: true,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Text('*Deve conter 8 caracteres',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 12,
                                      color: CustomColors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Text('*Deve conter uma letra maiúscula',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 12,
                                      color: CustomColors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Text('*Deve conter um caractere especial',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 12,
                                      color: CustomColors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Text('*Deve conter um número',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 12,
                                      color: CustomColors.black,
                                      fontWeight: FontWeight.normal)),
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
