import 'package:flutter/material.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';

class SGLogoutButton extends StatelessWidget {
  const SGLogoutButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.patientPrimary,
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: SizedBox(
          child: Row(
            children: const <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Icon(
                  Icons.logout,
                  color: CustomColors.white,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
