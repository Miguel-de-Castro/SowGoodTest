import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/widgets/sg_logout_button.dart';

import '../design_tokens/custom_text_styles.dart';

class PatientCard extends StatefulWidget {
  String name;
  String birthDate;
  String guardians;
  int age;
  // String imageLink;
  File? imageLink;

  final Function() logoutFunc;
  PatientCard({
    Key? key,
    required this.logoutFunc,
    required this.name,
    required this.birthDate,
    required this.guardians,
    required this.age,
    required this.imageLink,
  }) : super(key: key);
  @override
  State<PatientCard> createState() => _PatientCardState();
}

class _PatientCardState extends State<PatientCard>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  final Color cardColor = CustomColors.patientPrimary;
  final Color textColor = CustomColors.white;
  bool wasLoaded = false;

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.of(context).textScaleFactor;
    Size screenSize = MediaQuery.of(context).size * 0.21;

    return body();
  }

  Widget body() {
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
                top: 40,
                right: 25,
                child: SGLogoutButton(
                  onPressed: widget.logoutFunc,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 55, right: 20, left: 20),
                    child: GestureDetector(
                      child: CircleAvatar(
                        radius: screenSize.height * 0.23,
                        backgroundColor: CustomColors.white,
                        child: CircleAvatar(
                          radius: screenSize.height * 0.22,
                          // backgroundImage: NetworkImage(widget.imageLink),
                          // backgroundImage: Image.file(widget.imageLink),
                          backgroundImage: FileImage(widget.imageLink!),

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
                          widget.name,
                          style: CustomTextStylesBuilder()
                              .withSize(24)
                              .withColor(CustomColors.background)
                              .title(),
                        ),
                        Text(
                          widget.birthDate.isEmpty
                              ? ''
                              : '${widget.birthDate} - ${widget.age} anos',
                          style: CustomTextStylesBuilder()
                              .withColor(CustomColors.background)
                              .subTitle(),
                        ),
                        Text(
                          widget.guardians.isEmpty
                              ? ''
                              : 'Resp. ${widget.guardians}',
                          style: CustomTextStylesBuilder()
                              .withColor(CustomColors.background)
                              .subTitle(),
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

  Widget loadingBody() {
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
                  onPressed: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: FadeTransition(
                        opacity: _animation,
                        child: GestureDetector(
                          child: CircleAvatar(
                            radius: screenSize.height * 0.23,
                            backgroundColor: CustomColors.white,
                          ),
                        ),
                      )),
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(2),
                            child: FadeTransition(
                                opacity: _animation,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Container(
                                      height: 20,
                                      width: 180,
                                      color: CustomColors.white,
                                    )))),
                        const Padding(padding: EdgeInsets.all(6)),
                        FadeTransition(
                            opacity: _animation,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  height: 20,
                                  width: 150,
                                  color: CustomColors.white,
                                ))),
                        const Padding(padding: EdgeInsets.all(6)),
                        FadeTransition(
                            opacity: _animation,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  height: 20,
                                  width: 150,
                                  color: CustomColors.white,
                                ))),
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
