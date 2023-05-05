import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sow_good/views/widgets/button.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/widgets/sg_text_field.dart';
import 'package:sow_good/validators/text_validators.dart';
import 'package:intl/intl.dart';
import 'dart:core';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final DateFormat _dateFormat;
  late final String _formattedDate;
  

  @override
  void initState() {
    super.initState();
    _dateFormat = DateFormat('dd/MM/yyyy');
    final DateTime currentDate = DateTime.now();
    _formattedDate = _dateFormat.format(currentDate);
    _controllers = {};
    for (final Map<String, String> item in widget.content) {
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

   void sendEvent() {
    if (_formKey.currentState!.validate()) {
      print('Salvo');
      Navigator.pop(context);
    }
  }

   bool isUrl(String url) {
    return Uri.parse(url).isAbsolute;
  }
    

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          width: 0.5,
          color: CustomColors.patientPrimary, 
        ),
      ),

      content: Form(
        key: _formKey,
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
                        fontWeight: FontWeight.w200,
                        fontSize: 18,
                        color: CustomColors.patientPrimary,
                      ),
                    ),
                  ),
                  if(item['type'] == 'text')
                    SGTextField(
                      controller: _controllers[item['title']!]!,
                      validator: TextValidator.validateRequired,
                      icon: Icons.book,
                      placeholder: item['message']!,
                      type: FieldType.text,
                    ),
                  if(item['type'] == 'data')
                    SGTextField(
                      controller: _controllers[item['title']!]!,
                      icon: Icons.calendar_month,
                      validator: TextValidator.validateRequired,
                      placeholder: _formattedDate,
                      type: FieldType.date,
                    ),
                  if(item['type'] == 'link')
                    SGTextField(
                      controller: _controllers[item['title']!]!,
                      icon: Icons.link,
                      placeholder: item['message']!,
                      type: FieldType.text,
                    ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: VariableTextPinkButton(
                text: 'Salvar',
                 onPressed: () {
                  sendEvent();
                },
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}