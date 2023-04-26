import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/screens/profile_doctor.dart';
import 'package:sow_good/views/widgets/patient_profile_card.dart';
import 'package:sow_good/views/widgets/sg_text_button.dart';

class ProfilePatient extends StatefulWidget {
  const ProfilePatient({super.key});

  @override
  State<ProfilePatient> createState() => _ProfilePatientState();
}

class _ProfilePatientState extends State<ProfilePatient> {
  void nextScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const ProfileDoctor(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(400),
          child: PatientCard(
              name: 'Daniel Gus',
              age: 5,
              parents: 'Tania',
              birthDate: '20/01/2018',
              profilePictureUrl:
                  'https://cdn.pixabay.com/photo/2015/03/17/01/57/kid-677080_1280.jpg')),
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
                  onPressed: () {},
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
                  onPressed: () => nextScreen(),
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
}
