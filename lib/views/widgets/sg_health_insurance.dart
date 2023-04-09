import 'package:flutter/material.dart';
import 'package:sow_good/models/health_insurance.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';

class SGHealthInsurance extends StatelessWidget {
  const SGHealthInsurance({
    super.key,
    required this.healthInsurances,
  });

  final List<HealthInsurance> healthInsurances;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 350,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: healthInsurances
                  .map(
                    (HealthInsurance item) => Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage(item.image!),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  item.name!,
                                  style: CustomTextStylesBuilder()
                                      .withSize(8)
                                      .placeholder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
