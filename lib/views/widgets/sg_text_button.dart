import 'package:flutter/material.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';

class SGTextButton extends StatelessWidget {
  const SGTextButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.subTitle,
      required this.icon});

  final void Function() onPressed;
  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 42,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: CustomColors.grayDivider)),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.white,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 42,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 3, 0, 0),
                child: Icon(
                  icon,
                  color: CustomColors.black,
                  size: 25.33,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(19.67, 0, 0, 0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          color: CustomColors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(19.67, 0, 0, 0),
                      child: Text(
                        subTitle,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          color: CustomColors.graySubtitle,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}