import 'package:flutter/material.dart';
import 'package:sow_good/views/widgets/sg_text_area.dart';

import '../design_tokens/custom_colors.dart';
import '../design_tokens/custom_text_styles.dart';
import '../widgets/button.dart';

class SGAccountInfo extends StatefulWidget {
  const SGAccountInfo({super.key});

  @override
  State<SGAccountInfo> createState() => _SGAccountInfoState();
}

class _SGAccountInfoState extends State<SGAccountInfo> {
  final _formKey = GlobalKey<FormState>();
  late String _errorMessage = '';
  late String _emailMessage = '';
  final TextEditingController _emailControl = TextEditingController();
  final TextEditingController _passwordControl = TextEditingController();
  final TextEditingController _passwordConfirmControl = TextEditingController();

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
              .withColor(const Color.fromRGBO(0, 0, 0, 1))
              .withSize(26)
              .placeholder(),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: 350,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 160),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Informações da conta',
                        style: CustomTextStylesBuilder()
                            .withColor(CustomColors.black)
                            .withSize(28)
                            .placeholder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SGTextArea(
                      controller: _emailControl,
                      placeholder: 'E-mail',
                      icon: Icons.lock_outline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            _emailMessage = 'Por favor, insira seu email';
                          });
                          return null;
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          setState(() {
                            _emailMessage = 'Por favor, insira um email válido';
                          });
                          return null;
                        }
                        setState(() {
                          _emailMessage = '';
                        });
                        return null;
                      },
                      type: Type.oneline),
                  const SizedBox(
                    height: 14,
                  ),
                  SGTextArea(
                    controller: _passwordControl,
                    placeholder: 'Senha',
                    icon: Icons.lock_outline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        setState(() {
                          _errorMessage = 'Por favor, insira sua senha';
                        });
                        return null;
                      }
                      if (value.length < 6) {
                        setState(() {
                          _errorMessage =
                              'A senha deve ter pelo menos 6 caracteres';
                        });
                        return null;
                      }
                      if (!value.contains(RegExp(r'\d'))) {
                        setState(() {
                          _errorMessage =
                              'A senha deve conter pelo menos um número';
                        });
                        return null;
                      }
                      setState(() {
                        _errorMessage = '';
                      });
                      return null;
                    },
                    isPassword: Type.isPassword,
                    type: Type.oneline,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  SGTextArea(
                      controller: _passwordConfirmControl,
                      placeholder: 'Confirmação de Senha',
                      icon: Icons.lock_outline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            _errorMessage = 'Por favor, insira sua senha';
                          });
                          return null;
                        }
                        if (value.length < 6) {
                          setState(() {
                            _errorMessage =
                                'A senha deve ter pelo menos 6 caracteres';
                          });
                          return null;
                        }
                        if (!value.contains(RegExp(r'\d'))) {
                          setState(() {
                            _errorMessage =
                                'A senha deve conter pelo menos um número';
                          });
                          return null;
                        }
                        setState(() {
                          _errorMessage = '';
                        });
                        return null;
                      },
                      isPassword: Type.isPassword,
                      type: Type.oneline),
                  const SizedBox(
                    height: 14,
                  ),
                  SizedBox(height: 10),
                  if (_errorMessage != null)
                    Column(
                      children: [
                        Text(
                          _errorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(
                          _emailMessage,
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  const SizedBox(
                    height: 268,
                  ),
                  Center(
                    child: VariableTextPinkButton(
                      text: 'Continuar',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_emailControl.text.isNotEmpty &&
                              _passwordControl.text.isNotEmpty &&
                              _passwordConfirmControl.text.isNotEmpty) {
                            if (_passwordControl.text !=
                                _passwordConfirmControl.text) {
                              setState(() {
                                _errorMessage = 'As senhas não correspondem';
                              });
                            }
                            if (_formKey.currentState!.validate()) ;
                          } else {
                            setState(() {
                              _errorMessage =
                                  'Por favor, preencha todos os campos';
                            });
                          }
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
