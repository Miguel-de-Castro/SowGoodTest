import 'package:flutter/material.dart';
import 'package:sow_good/validators/text_validators.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';
import 'package:sow_good/views/widgets/button.dart';
import 'package:sow_good/views/widgets/sg_text_area.dart';
import 'package:sow_good/views/widgets/sg_text_field.dart';
import 'package:sow_good/views/modals/diary_event.dart';
import 'package:sow_good/views/widgets/sg_diary_component.dart';

class DiaryEvents extends StatefulWidget {
  const DiaryEvents({super.key});

  @override
  State<DiaryEvents> createState() => _DiaryEventsState();
}

class _DiaryEventsState extends State<DiaryEvents> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// Trocar por chamada do back
  static const List<Map<String, String>> conteudo = [
    {'title': 'Título', 'message': 'Largou a chupeta', 'type': 'text'},
    {
      'title': 'Data do ocorrido',
      'type': 'data',
    },
    {'title': 'Descrição', 'message': 'A criança nessa semana', 'type': 'text'},
    {'title': 'Descrição', 'message': 'A criança nessa semana', 'type': 'text'},
    {'title': 'Descrição', 'message': 'A criança nessa semana', 'type': 'text'},
    {'title': 'Descrição', 'message': 'A criança nessa semana', 'type': 'text'},
    {'title': 'Descrição', 'message': 'A criança nessa semana', 'type': 'text'},
    {'title': 'Descrição', 'message': 'A criança nessa semana', 'type': 'text'},
    {'title': 'Descrição', 'message': 'A criança nessa semana', 'type': 'text'},
    {'title': 'Descrição', 'message': 'A criança nessa semana', 'type': 'text'},
    {'title': 'Descrição', 'message': 'A criança nessa semana', 'type': 'text'},
    {'title': 'Descrição', 'message': 'A criança nessa semana', 'type': 'text'}
  ];

  double displayHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  void nextScreen() {
    if (_formKey.currentState!.validate()) {}
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
              color: CustomColors.background,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(3),
              child: Container(
                color: CustomColors.patientPrimary,
                height: 3,
                width: double.infinity,
              )),
          centerTitle: true,
          backgroundColor: CustomColors.patientPrimary,
          title: Text(
            'Diário',
            style: CustomTextStylesBuilder()
                .withColor(CustomColors.background)
                .withSize(26)
                .placeholder(),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.add,
                size: 30,
                color: CustomColors.background,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CreateDiaryEvent();
                  },
                );
              },
            )
          ],
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              Map<String, String> item = conteudo[index];
              return DiaryComponent(
                  title: item['title'] ?? '',
                  description: item['message'] ?? '',
                  link: item['type'] ?? '');
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  thickness: 0.5,
                  indent: 20,
                  endIndent: 20,
                  color: CustomColors.graySubtitle,
                ),
            itemCount: conteudo.length),
      ),
    );
  }
}
