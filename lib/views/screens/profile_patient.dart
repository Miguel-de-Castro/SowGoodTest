import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sow_good/viewmodels/profile_patient_viewmodel.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/screens/profile_doctor.dart';
import 'package:sow_good/views/widgets/patient_profile_card.dart';
import 'package:sow_good/views/widgets/sg_snackbar.dart';
import 'package:sow_good/views/widgets/sg_text_button.dart';

import '../widgets/sg_loader.dart';
import 'diary_events_page.dart';

class ProfilePatient extends StatefulWidget {
  const ProfilePatient({super.key});

  @override
  State<ProfilePatient> createState() => _ProfilePatientState();
}

class _ProfilePatientState extends State<ProfilePatient> {
  ProfilePatientViewmodel viewmodel = ProfilePatientViewmodel();

  void loadData() {
    setState(() {
      switch (viewmodel.state) {
        case ProfilePatientViewState.loading:
          _dialogBuilder(context);
          break;
        case ProfilePatientViewState.navigateToDoctor:
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const ProfileDoctor(),
              ));
          break;
        case ProfilePatientViewState.navigateToDiary:
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const DiaryEventsPage(),
              ));
          break;
        case ProfilePatientViewState.requestFailed:
          Navigator.pop(context);
          SGSnackBar.show(
              context: context,
              color: CustomColors.error,
              text: viewmodel.error ?? 'Tente novamente');
          break;
        case ProfilePatientViewState.requestLogoutSucceed:
          Navigator.pop(context);
          Navigator.pop(context);
          break;
        case ProfilePatientViewState.started:
          break;
        case ProfilePatientViewState.requestPatientDataSucceed:
          Navigator.pop(context);
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewmodel.getPatientData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(400),
          child: PatientCard(
              logoutFunc: () => viewmodel.logout(),
              name: viewmodel.patient?.name ?? '',
              imageLink: viewmodel.file,
              // profile_image: viewmodel.patient?.
              birthDate: viewmodel.patient?.birthDate ?? '',
              guardians: viewmodel.patient?.guardians?.join(', ') ?? '',
              age:
                  viewmodel.getCurrentAge(viewmodel.patient?.birthDate ?? ''))),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0.2),
            child: Column(
              children: [
                SGTextButton(
                  onPressed: () {},
                  title: 'Chat',
                  subTitle: 'Fale com nossos especialistas',
                  icon: Icons.chat_outlined,
                ),
                SGTextButton(
                  onPressed: () => viewmodel.navigateToDiaryScreen(),
                  title: 'Diário',
                  subTitle: 'Evolução do paciente',
                  icon: Icons.book_outlined,
                ),
                SGTextButton(
                    onPressed: () {},
                    title: 'Dados médicos',
                    subTitle: 'Evolução do paciente',
                    icon: Icons.local_hospital_outlined),
                SGTextButton(
                  onPressed: () => viewmodel.navigateToDoctor(),
                  title: 'Meu médico',
                  subTitle: 'Informações sobre o médico',
                  icon: MdiIcons.stethoscope,
                ),
                SGTextButton(
                  onPressed: () {},
                  title: 'Configurações',
                  subTitle: 'Ajustes do aplicativo',
                  icon: Icons.settings_outlined,
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
