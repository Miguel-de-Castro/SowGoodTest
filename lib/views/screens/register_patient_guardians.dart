import 'package:flutter/material.dart';
import 'package:sow_good/models/patient.dart';
import 'package:sow_good/services/patient_service.dart';
import 'package:sow_good/viewmodels/patient_guardians_viewmodel.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';
import 'package:sow_good/views/screens/login_page.dart';
import 'package:sow_good/views/widgets/button.dart';
import 'package:sow_good/views/widgets/sg_text_field.dart';

import '../../models/default_view_state.dart';
import '../widgets/sg_loader.dart';

class RegisterPatientGuardians extends StatefulWidget {
  final Patient patient;
  const RegisterPatientGuardians({super.key, required this.patient});

  @override
  State<RegisterPatientGuardians> createState() =>
      _RegisterPatientGuardiansState();
}

class _RegisterPatientGuardiansState extends State<RegisterPatientGuardians> {
  final RegisterPatientGuardiansViewModel viewmodel =
      RegisterPatientGuardiansViewModel();

  void loadData() {
    setState(() {
      switch (viewmodel.state) {
        case DefaultViewState.loading:
          _dialogBuilder(context);
          break;
        case DefaultViewState.requestSucceed:
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const LoginPage(),
              ));
          break;
        case DefaultViewState.requestFailed:
          Navigator.pop(context);
          break;
        case DefaultViewState.started:
          break;
      }
    });
  }

  void removeGuardian(int index) {
    viewmodel.removeGuardian(index);
  }

  void addGuardian() {
    viewmodel.addGuardian();
  }

  double displayHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    viewmodel.patient = widget.patient;
    viewmodel.textControllers.add(TextEditingController());
    viewmodel.addListener(() {
      loadData();
    });
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
                vertical: displayHeight(context) * 0.1, horizontal: 20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Responsáveis',
                      style:
                          CustomTextStylesBuilder().withSize(30).placeholder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Column(children: inputList()),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              viewmodel.add();
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            color: CustomColors.black,
                          ),
                          label: Text(
                            'Adicionar responsável',
                            style: CustomTextStylesBuilder()
                                .withSize(14)
                                .withColor(CustomColors.black)
                                .placeholder(),
                          ),
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.05,
                ),
                VariableTextPinkButton(
                  onPressed: () => viewmodel.registerPatient(),
                  text: 'Finalizar',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> inputList() {
    return List<Widget>.generate(
      viewmodel.textControllers.length,
      (int index) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Stack(
                children: <Widget>[
                  SGTextField(
                    controller: viewmodel.textControllers[index],
                    placeholder: 'Nome completo do responsável',
                    icon: Icons.person_add_alt,
                    type: FieldType.deletableText,
                    onPressed: () {
                      setState(() {
                        viewmodel.textControllers.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const sgLoader();
        });
  }
}
