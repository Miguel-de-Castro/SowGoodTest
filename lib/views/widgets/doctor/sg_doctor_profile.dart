import 'package:flutter/material.dart';
import 'package:sow_good/models/health_insurance.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';

class SGDoctorProfile extends StatefulWidget {
  const SGDoctorProfile({
    super.key,
    this.image,
    required this.name,
    required this.address,
    required this.specialty,
    required this.description,
    required this.healthInsurance,
  });

  final String? image;
  final String name;
  final String address;
  final String specialty;
  final String description;
  final List<HealthInsurance> healthInsurance;

  @override
  State<SGDoctorProfile> createState() => _SGDoctorProfileState();
}

class _SGDoctorProfileState extends State<SGDoctorProfile> {
  bool isEditMode = false;

  double displayHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Material(child: isEditMode ? editMode() : notEditMode());
  }

  Widget notEditMode() {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 80,
              width: double.infinity,
              color: CustomColors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 390, right: 65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Dr. ' + widget.name,
                      style: CustomTextStylesBuilder()
                          .withColor(CustomColors.black)
                          .withSize(40)
                          .title(),
                    ),
                    Text('convenios'),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isEditMode = true;
                                });
                              },
                              child: const Icon(
                                Icons.edit,
                                size: 30,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.logout,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 210,
              width: double.infinity,
              color: CustomColors.medicPrimary,
              child: Padding(
                padding: const EdgeInsets.only(left: 390, right: 65, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.location_on,
                                  color: CustomColors.white,
                                  size: 20,
                                ),
                                Text(
                                  widget.address,
                                  style: CustomTextStylesBuilder()
                                      .withColor(CustomColors.white)
                                      .withSize(20)
                                      .title(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            widget.specialty,
                            style: CustomTextStylesBuilder()
                                .withColor(CustomColors.white)
                                .withSize(20)
                                .title(),
                          ),
                        ),
                        SizedBox(
                          height: 114,
                          width: displayWidth(context) * 0.66,
                          child: SingleChildScrollView(
                            child: Text(
                              widget.description,
                              style: CustomTextStylesBuilder()
                                  .withColor(CustomColors.white)
                                  .withSize(20)
                                  .title(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.qr_code,
                        color: CustomColors.white,
                        size: 72,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Positioned(
          left: 90,
          child: CircleAvatar(
            backgroundColor: CustomColors.black,
            radius: 115,
          ),
        ),
      ],
    );
  }

  Widget editMode() {
    return Text('editMode');
  }
}
