import 'package:flutter/material.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';

class SGcomponenteMedico extends StatefulWidget {
  SGcomponenteMedico({
    super.key,
    required this.nome,
    required this.especialidade,
    required this.crm,
    required this.rqe,
    required this.endereco,
    required this.openGoogle,
  });

  final String nome;
  final String especialidade;
  final String crm;
  final String rqe;
  final String endereco;
  final Function() openGoogle;

  @override
  State<SGcomponenteMedico> createState() => _SGcomponenteMedicoState();
}

class _SGcomponenteMedicoState extends State<SGcomponenteMedico> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 350,
      padding: EdgeInsets.all(5),
      child: Row(children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              'data:image/jpeg;base64,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'),
          maxRadius: 50,
          minRadius: 50,
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dr. ' + widget.nome,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.especialidade,
              style: TextStyle(color: CustomColors.graySubtitle),
            ),
            Text(
              'CRM ' + widget.crm,
              style: TextStyle(color: CustomColors.graySubtitle),
            ),
            Text(
              widget.rqe,
              style: TextStyle(color: CustomColors.graySubtitle),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                TextButton.icon(
                  onPressed: widget.openGoogle,
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  icon: Icon(
                    Icons.location_on,
                    color: CustomColors.graySubtitle,
                  ),
                  label: Text(
                    widget.endereco,
                    style: TextStyle(color: CustomColors.graySubtitle),
                  ),
                )
              ],
            ),
          ],
        ),
      ]),
    ));
  }
}
