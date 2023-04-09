import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sow_good/views/widgets/pacient_profile_card.dart';
import 'package:sow_good/views/widgets/sg_app_bar.dart';
import 'package:sow_good/views/widgets/sg_text_button.dart';

class ProfilePatient extends StatefulWidget {
  const ProfilePatient({super.key});

  @override
  State<ProfilePatient> createState() => _ProfilePatientState();
}

class _ProfilePatientState extends State<ProfilePatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(400),
          child: PatientCard(
              name: 'Daniel Gus',
              age: 5,
              parents: 'Tania',
              birthDate: '20/01/2018',
              profilePictureUrl:
                  'https://cdn.pixabay.com/photo/2015/03/17/01/57/kid-677080_1280.jpg')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0.2),
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
                icon: Icons.menu_book_outlined,
              ),
              SGTextButton(
                onPressed: () {},
                title: 'Dados médicos',
                subTitle: 'Evolução do paciente',
                icon: Icons.list_alt_outlined,
              ),
              SGTextButton(
                onPressed: () {},
                title: 'Meu médico',
                subTitle: 'Fale com os nossos especialistas',
                icon: Icons.person_outlined,
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
    );
  }
}
