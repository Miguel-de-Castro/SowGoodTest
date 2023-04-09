import 'package:flutter/material.dart';
import 'package:sow_good/views/widgets/button.dart';
import 'package:sow_good/views/widgets/sg_text_area.dart';

import '../design_tokens/custom_colors.dart';
import '../design_tokens/custom_text_styles.dart';

class SGAccountInfo extends StatefulWidget {
  const SGAccountInfo({super.key});

  @override
  State<SGAccountInfo> createState() => _SGAccountInfoState();
}

class _SGAccountInfoState extends State<SGAccountInfo> {
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
            child: SizedBox(
              width: 350,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 160),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Informações da Conta',
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
                      type: Type.oneline),
                  const SizedBox(
                    height: 14,
                  ),
                  SGTextArea(
                      controller: _passwordControl,
                      placeholder: 'Senha',
                      icon: Icons.lock_outline,
                      type: Type.oneline),
                  const SizedBox(
                    height: 14,
                  ),
                  SGTextArea(
                      controller: _passwordConfirmControl,
                      placeholder: 'Confirmação de Senha',
                      icon: Icons.lock_outline,
                      type: Type.oneline),
                  const SizedBox(
                    height: 14,
                  ),
                  const SizedBox(
                    height: 268,
                  ),
                  Center(
                    child: VariableTextPinkButton(
                        text: 'Continuar', onPressed: () {}),
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
