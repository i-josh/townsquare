import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../values/colors.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputFormatter? inputFormatter;
  final Function? validator;
  final String label;
  final int? minLines;
  final int? maxLines;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final String? hintText;
  final TextCapitalization textCapitalization;
  final Function? onTap;
  final Function? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.textInputType,
    this.obscureText = false,
    this.validator,
    this.minLines,
    this.maxLines,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction,
    this.inputFormatter,
    this.hintText,
    this.onTap,
    this.onChanged,
    this.textCapitalization = TextCapitalization.sentences,
    required this.label,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  Color _fillColor = Colors.white;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          _fillColor = Colors.white;
        } else {
          _fillColor = Colors.white;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 0,
          offset: Offset(4, 4),
        ),
      ]),
      child: TextFormField(
        focusNode: _focusNode,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onTap: widget.onTap as void Function()?,
        onChanged: widget.onChanged as void Function(String)?,
        obscureText: widget.obscureText,
        style: const TextStyle(fontSize: 12),
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        controller: widget.controller,
        inputFormatters:
            widget.inputFormatter == null ? [] : [widget.inputFormatter!],
        textCapitalization: widget.textCapitalization,
        validator: widget.validator as String? Function(String?)?,
        //cursorColor: AppColors.primary,
        cursorColor: AppColors.primary,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          errorMaxLines: 4,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          filled: true,
          fillColor: _fillColor,
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: widget.label,
          labelStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(width: 1.5, color: AppColors.primary),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(width: 1.5, color: Colors.grey[200]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(width: 1.5, color: Colors.grey[200]!),
          ),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              borderSide: BorderSide(width: 1.5, color: Colors.red)),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(width: 1.5, color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
