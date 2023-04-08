import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';

class PatientCard extends StatelessWidget {
  final String name;
  final String birthDate;
  final String parents;
  final String profilePictureUrl;
  final int age;
  final Color cardColor = CustomColors.pacientPrimary;
  final Color textColor = CustomColors.white;
  var changed = false;

  PatientCard({
    required this.name,
    required this.birthDate,
    required this.parents,
    required this.age,
    required this.profilePictureUrl,
  });

  @override
  Widget build(BuildContext context) {
    var textScale = MediaQuery.of(context).textScaleFactor;
    var screenSize = MediaQuery.of(context).size * 0.21;
    return Material(
        type: MaterialType.transparency,
        child: FractionallySizedBox(
            alignment: AlignmentDirectional.topStart,
            widthFactor: 1, // between 0 and 1
            heightFactor: 0.21,
            child: Container(
              width: 240,
              height: 80,
              color: cardColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                          child: CircleAvatar(
                        radius: screenSize.height * 0.335,
                        backgroundColor: CustomColors.white,
                        child: CircleAvatar(
                            radius: screenSize.height * 0.32,
                            backgroundImage: NetworkImage(profilePictureUrl)),
                      ))),
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 0.17 * screenSize.height,
                              color: textColor),
                        ),
                        Text(
                          '$birthDate - $age anos',
                          style: TextStyle(
                              fontSize: 0.135 * screenSize.height,
                              color: textColor),
                        ),
                        Text(
                          'Resp. $parents',
                          style: TextStyle(
                              fontSize: 0.135 * screenSize.height,
                              color: textColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
