import 'package:flutter/material.dart';
import 'package:sow_good/viewmodels/profile_doctor_viewmodel.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/widgets/button.dart';
import 'package:sow_good/views/widgets/sg_app_bar.dart';
import 'package:sow_good/views/widgets/sg_componente_medico.dart';
import 'package:sow_good/views/widgets/sg_health_insurance.dart';
import 'package:sow_good/models/health_insurance.dart';

import '../../models/default_view_state.dart';
import '../widgets/sg_loader.dart';

class ProfileDoctor extends StatefulWidget {
  const ProfileDoctor({super.key});

  @override
  State<ProfileDoctor> createState() => _ProfileDoctorState();
}

class _ProfileDoctorState extends State<ProfileDoctor> {
  ProfileDoctorViewmodel viewmodel = ProfileDoctorViewmodel();

  double displayHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  void loadData() {
    setState(() {
      switch (viewmodel.state) {
        case DefaultViewState.loading:
          _dialogBuilder(context);
          break;
        case DefaultViewState.requestSucceed:
          Navigator.pop(context);
          break;
        case DefaultViewState.requestFailed:
          Navigator.pop(context);
          break;
        case DefaultViewState.started:
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    viewmodel.addListener(() {
      loadData();
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewmodel.getDoctorData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sgAppBar('Meu Médico', context),
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Column(
              children: <Widget>[
                SGcomponenteMedico(
                  crm: viewmodel.getCrm(),
                  endereco: viewmodel.getAdress(),
                  especialidade: viewmodel.getExpertise(),
                  nome: viewmodel.getname(),
                  rqe: 'RQE 12345',
                ),
                const Divider(
                  thickness: 2,
                  color: CustomColors.patientPrimary,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 13, top: 20),
                              child: Text(
                                'Sobre mim:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 16),
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque egestas urna nibh, ut fringilla mi hendrerit id. Donec posuere libero at feugiat tincidunt. Vestibulum a blandit sapien. Integer tempus quam dui, ut dignissim nisl eleifend sed. In vitae est eu purus gravida tincidunt eu quis augue. Mauris hendrerit scelerisque dignissim.',
                                style:
                                    TextStyle(color: CustomColors.graySubtitle),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 0.5,
                      color: CustomColors.graySubtitle,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(bottom: 13, top: 20),
                              child: Text(
                                'Convênios:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: SGHealthInsurance(
                                  healthInsurances: viewmodel.healthInsurances),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 0.5,
                      color: CustomColors.graySubtitle,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(bottom: 13, top: 20),
                              child: Text(
                                'Materiais:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: VariableTextPinkButton(
                                  onPressed: () =>
                                      viewmodel.nextScreen(context),
                                  text: 'Google Drive',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
          return const sgLoader();
        });
  }
}
