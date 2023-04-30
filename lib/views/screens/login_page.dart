import 'package:flutter/material.dart';
import 'package:sow_good/services/auth_service.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';
import 'package:sow_good/views/widgets/sg_loader.dart';
import 'package:sow_good/views/widgets/sg_text_field.dart';
import 'package:sow_good/views/widgets/button.dart';
import 'package:sow_good/views/screens/register_patient_account.dart';
import 'package:sow_good/validators/text_validators.dart';
import 'package:sow_good/services/patient_service.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sow_good/views/screens/profile_patient.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _userError = '';
  Map<String, dynamic> _patient = {};

  double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  void createAccount() {
    Navigator.push(
      context,
      MaterialPageRoute<RegisterPatientAccount>(
          builder: (BuildContext context) => const RegisterPatientAccount()),
    );
  }

  bool isLoading = false;

  void loadData() {
    isLoading ? Navigator.pop(context) : _dialogBuilder(context);
    isLoading = !isLoading;
  }

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _userError = '';
      });
      try {
        loadData();
        await AuthService().login(
          email: _emailController.text, 
          password: _passwordController.text,
        );
        setState(() {
          _emailController.text = '';
          _passwordController.text = '';
        });
        _patient =
            await PatientService().getPatient() ?? {};
        if (_patient.isNotEmpty) {
          loadData();
          Navigator.push(
            context,
            MaterialPageRoute<ProfilePatient>(
                builder: (BuildContext context) => const ProfilePatient()),
          );
        } else {
          setState(() {
            loadData();
            _userError = 'Apenas para pacientes';
          });
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
          loadData();
          setState(() {
            _userError = 'Email invalido';
          });
        }
        if (e.code == 'user-not-found') {
          loadData();
          setState(() {
            _userError = 'Usuário não encontrado';
          });
        }
        if (e.code == 'wrong-password') {
          loadData();
          setState(() {
            _userError = 'Sua senha esta incorreta';
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  color: CustomColors.patientPrimary,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text('Sow Good',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Colors.white)),
                      SizedBox(
                        height: 28,
                      ),
                      Text('Cuidado e segurança para sua família',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: CustomColors.white,
                              fontWeight: FontWeight.normal)),
                      SizedBox(
                        height: 41,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 39, left: 61, bottom: 45),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text('Login',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 28,
                                  color: CustomColors.patientPrimary,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: SGTextField(
                              controller: _emailController,
                              validator: TextValidator.validateRequired,
                              placeholder: 'E-mail',
                              icon: Icons.mail_outlined,
                              type: FieldType.text,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 44),
                            child: SGTextField(
                                controller: _passwordController,
                                validator: TextValidator.validateRequired,
                                placeholder: '***********',
                                icon: Icons.lock_outline,
                                isPassword: true,
                                type: FieldType.text),
                          ),
                          if (_userError != '')
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                _userError,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                        ]),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 34),
                          child: VariableTextPinkButton(
                              text: 'Entrar', onPressed: () => signIn())),
                      RichText(
                        text: TextSpan(
                          text: 'Não possui uma conta? ',
                          style: CustomTextStylesBuilder()
                              .withColor(CustomColors.black)
                              .withSize(14)
                              .placeholder(),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Cadastre-se',
                              style: CustomTextStylesBuilder()
                                  .withSize(14)
                                  .withColor(CustomColors.patientPrimary)
                                  .placeholder(),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  createAccount();
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return sgLoader();
        });
  }
}
