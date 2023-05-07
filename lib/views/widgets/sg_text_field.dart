import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sow_good/views/design_tokens/custom_colors.dart';
import 'package:sow_good/views/design_tokens/custom_text_styles.dart';

enum FieldType { text, date, deletableText }

class SGTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String placeholder;
  final FieldType type;
  final void Function()? onPressed;
  final String? Function(String?)? validator;
  final IconData icon;
  final String initialText;

  const SGTextField({
    super.key,
    required this.controller,
    this.isPassword = false,
    this.type = FieldType.text,
    this.onPressed,
    required this.placeholder,
    this.validator,
    required this.icon,
    this.initialText = '',
  }) : assert((type == FieldType.deletableText && onPressed != null) ||
            (type != FieldType.deletableText && onPressed == null));

  @override
  State<SGTextField> createState() => _SGTextFieldState();
}

class _SGTextFieldState extends State<SGTextField> {
  bool error = false;
  String? errorMessage;
  bool isVisible = true;

  String? _validateInput(String? value) {
    if (widget.validator != null) {
      String? result = widget.validator!(value);
      if (result != null) {
        setState(() {
          error = true;
          errorMessage = result;
        });

        return '';
      }

      setState(() {
        error = false;
        errorMessage = null;
      });
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    widget.controller.text = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 42,
          decoration: BoxDecoration(
              border: Border.all(
                  color: error ? CustomColors.error : CustomColors.black),
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Expanded(
                child:
                    widget.type == FieldType.date ? dateField() : textField(),
              ),
            ],
          ),
        ),
        error
            ? Padding(
                padding: const EdgeInsets.only(
                  top: 4.0,
                ),
                child: Text(errorMessage ?? '',
                    style: CustomTextStylesBuilder()
                        .withSize(14)
                        .withColor(CustomColors.error)
                        .title()),
              )
            : Container(),
      ],
    );
  }

  Widget textField() {
    return TextFormField(
      controller: widget.controller,
      validator: _validateInput,
      maxLines: 1,
      obscureText: widget.isPassword ? isVisible : widget.isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.icon,
          color: CustomColors.black,
        ),
        prefixIconColor: CustomColors.black,
        suffixIcon: widget.type == FieldType.deletableText
            ? IconButton(
                onPressed: widget.onPressed,
                icon: const Icon(
                  Icons.close,
                  color: CustomColors.black,
                ),
              )
            : widget.isPassword
                ? IconButton(
                    tooltip: isVisible ? 'mostrar senha' : 'esconder senha',
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: isVisible
                        ? const Icon(
                            Icons.visibility,
                            color: CustomColors.black,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: CustomColors.black,
                          ),
                  )
                : null,
        hintText: widget.placeholder,
        hintStyle: CustomTextStylesBuilder()
            .withColor(CustomColors.grayPlaceholder)
            .placeholder(),
        border: InputBorder.none,
        errorStyle: const TextStyle(height: 0),
      ),
    );
  }

  Widget dateField() {
    DateTime? selectedDate;

    return TextFormField(
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null && pickedDate != selectedDate) {
          setState(() {
            selectedDate = pickedDate;
          });
          widget.controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
        }
      },
      readOnly: true,
      keyboardType: TextInputType.none,
      controller: widget.controller,
      validator: _validateInput,
      maxLines: 1,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.icon,
          color: CustomColors.black,
        ),
        prefixIconColor: CustomColors.black,
        hintText: widget.placeholder,
        hintStyle: CustomTextStylesBuilder()
            .withColor(CustomColors.graySubtitle)
            .placeholder(),
        border: InputBorder.none,
        errorStyle: const TextStyle(height: 0),
      ),
    );
  }
}
