import 'package:flutter/material.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/widgets/sg_logout_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sow_good/views/screens/login_page.dart';
import 'package:sow_good/models/default_view_state.dart';



class PatientCard extends StatelessWidget {
  final String name;
  final String birthDate;
  final String parents;
  final String profilePictureUrl;
  final int age;
  final Color cardColor = CustomColors.patientPrimary;
  final Color textColor = CustomColors.white;
  bool changed = false;
  final void Function() logoutFunc;

  PatientCard({
    super.key,
    required this.name,
    required this.birthDate,
    required this.parents,
    required this.age,
    required this.profilePictureUrl,
    required this.logoutFunc,
  });


  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.of(context).textScaleFactor;
    Size screenSize = MediaQuery.of(context).size * 0.21;
    return Container(
      child: FractionallySizedBox(
        alignment: AlignmentDirectional.topStart,
        widthFactor: 1, // between 0 and 1
        heightFactor: 0.41,
        child: Container(
          width: 240,
          height: 80,
          color: cardColor,
          child: Stack(
            children: [
              Positioned(
                top: 20,
                right: 25,
                child: SGLogoutButton(
                  onPressed: logoutFunc
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: GestureDetector(
                      child: CircleAvatar(
                        radius: screenSize.height * 0.23,
                        backgroundColor: CustomColors.white,
                        child: CircleAvatar(
                          radius: screenSize.height * 0.22,
                          backgroundImage: NetworkImage(profilePictureUrl),
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 0.14 * screenSize.height,
                            color: textColor,
                          ),
                        ),
                        Text(
                          '$birthDate - $age anos',
                          style: TextStyle(
                            fontSize: 0.10 * screenSize.height,
                            color: textColor,
                          ),
                        ),
                        Text(
                          'Resp. $parents',
                          style: TextStyle(
                            fontSize: 0.10 * screenSize.height,
                            color: textColor,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
