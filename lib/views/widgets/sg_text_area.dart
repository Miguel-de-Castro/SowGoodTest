import 'package:flutter/material.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';

class SGTextArea extends StatefulWidget {
    const SGTextArea(
      {super.key,
      required this.controller,
      required this.placeholder,
      required this.icon,
      this.initialText = '',
      this.oneLine = false,
      this.maxLength = 0
      });

  final String placeholder;
  final IconData icon;
  final TextEditingController controller;
  final bool oneLine;
  final int maxLength;
  final String initialText;

  @override
  State<SGTextArea> createState() => _SGTextAreaState();
}

class _SGTextAreaState extends State<SGTextArea> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.oneLine ? 40 : 100,
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(widget.icon),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: TextFormField(
                controller: widget.controller,
                minLines: widget.oneLine ? 1 : 4,
                maxLines: widget.oneLine ? 1 : null,
                keyboardType: TextInputType.multiline,
                maxLength: widget.maxLength == 0 ? null : widget.maxLength,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: widget.placeholder,
                  counterText: '',
                  hintStyle: CustomTextStylesBuilder()
                      .withColor(CustomColors.graySubtitle)
                      .placeholder(),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
