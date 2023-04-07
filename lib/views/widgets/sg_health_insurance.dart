import 'package:flutter/material.dart';
import 'package:sow_good/models/health_insurance.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';

class SGHealthInsurance extends StatelessWidget {
  const SGHealthInsurance({
    Key? key,
    required this.healthInsurances,
  }) : super(key: key);

  final List<HealthInsurance> healthInsurances;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 30, 0, 0),
      child: Container(
        width: 350,
        height: 100,
        color: CustomColors.grayDivider,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
              child: Text(
                'Convênios',
                style: CustomTextStylesBuilder()
                    .withColor(CustomColors.black)
                    .withSize(12)
                    .placeholder()
                    .copyWith(decoration: TextDecoration.none),
              ),
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (BuildContext context, int index) => Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        healthInsurances[index].image!,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      healthInsurances[index].name!,
                      textAlign: TextAlign.center,
                      style: CustomTextStylesBuilder()
                          .withSize(8)
                          .withColor(CustomColors.black)
                          .placeholder()
                          .copyWith(decoration: TextDecoration.none),
                    ),
                  ],
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 16),
                itemCount: healthInsurances.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}