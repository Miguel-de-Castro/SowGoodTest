import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sow_good/views/widgets/button.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/widgets/sg_text_field.dart';

class CustomModal extends StatefulWidget {
  const CustomModal(
    {super.key, 
    required this.content});

  final List<Map<String, String>> content;
  

  @override
  _CustomModalState createState() => _CustomModalState();

}

class _CustomModalState extends State<CustomModal> {
  late final Map<String, TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = {};
    for (var item in widget.content) {
      _controllers[item['title']!] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (TextEditingController controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (Map<String, String> item in widget.content)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                    child: Text(
                      item['title']!,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: CustomColors.patientPrimary,
                      ),
                    ),
                  ),
                  SGTextField(
                    controller: _controllers[item['title']!]!,
                    icon: Icons.book,
                    placeholder: item['message']!,
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: VariableTextPinkButton(
                text: 'Entrar',
                onPressed: () => print('ola'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}