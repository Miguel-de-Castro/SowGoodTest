// ignore_for_file: always_specify_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class DiaryComponent extends StatefulWidget {
  final String title;
  final String description;
  final String link;

  const DiaryComponent(
      {Key? key,
      required this.title,
      required this.description,
      required this.link})
      : super(key: key);

  @override
  _DiaryComponentState createState() => _DiaryComponentState();
}

class _DiaryComponentState extends State<DiaryComponent> {
  late String _formattedDate;

  @override
  void initState() {
    super.initState();
    _formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String url = widget.link;
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          throw 'Não foi possível abrir $url';
        }
      },
      child: Card(
        child: Container(
          width: 350,
          height: 90,
          color: CustomColors.patientPrimary,
          padding:
              const EdgeInsets.only(top: 15, left: 20, bottom: 7, right: 11),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        widget.title,
                        style: CustomTextStylesBuilder()
                            .withColor(CustomColors.black)
                            .withSize(20)
                            .placeholder(),
                      ),
                    ),
                    Text(
                      '$_formattedDate - ${widget.description}',
                      style: CustomTextStylesBuilder()
                          .withColor(CustomColors.graySubtitle)
                          .withSize(14)
                          .placeholder(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 20, right: 0),
                  child: Icon(Icons.arrow_forward_ios_rounded)),
            ],
          ),
        ),
      ),
    );
  }
}
