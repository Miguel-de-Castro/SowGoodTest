import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sow_good/validators/text_validators.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';
import 'package:sow_good/views/widgets/button.dart';
import 'package:sow_good/views/widgets/sg_text_area.dart';
import 'package:sow_good/views/widgets/sg_text_field.dart';

class CreateDiaryEvent extends StatefulWidget {
  const CreateDiaryEvent({super.key});

  @override
  State<CreateDiaryEvent> createState() => _CreateDiaryEventState();
}

class _CreateDiaryEventState extends State<CreateDiaryEvent> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  final String today = DateFormat('dd/MM/yyyy').format(DateTime.now());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void save() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  void initState() {
    super.initState();
    _dateController.text = today;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: CustomColors.patientPrimary,
          width: 1,
        ),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Título',
                style: CustomTextStylesBuilder()
                    .withColor(CustomColors.patientPrimary)
                    .title(),
              ),
            ),
            SGTextField(
              controller: _titleController,
              validator: TextValidator.validateRequired,
              placeholder: 'Largou a chupeta',
              icon: Icons.book,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Data do Ocorrido',
                style: CustomTextStylesBuilder()
                    .withColor(CustomColors.patientPrimary)
                    .title(),
              ),
            ),
            SGTextField(
              controller: _dateController,
              validator: TextValidator.validateRequired,
              placeholder: today,
              icon: Icons.calendar_month,
              type: FieldType.date,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Descrição',
                style: CustomTextStylesBuilder()
                    .withColor(CustomColors.patientPrimary)
                    .title(),
              ),
            ),
            SGTextArea(
              controller: _descriptionController,
              placeholder: 'Parou de usar chupeta.',
              icon: Icons.book,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Link do vídeo/foto',
                style: CustomTextStylesBuilder()
                    .withColor(CustomColors.patientPrimary)
                    .title(),
              ),
            ),
            SGTextField(
              controller: _linkController,
              placeholder: 'Link',
              icon: Icons.link,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: VariableTextPinkButton(
                  onPressed: () {
                    save();
                  },
                  text: 'Salvar',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
