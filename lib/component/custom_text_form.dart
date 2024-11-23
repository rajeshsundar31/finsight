import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final bool? readOnly;
  final InputBorder borderstyle;

  const CustomTextForm({
    required this.controller,
    this.hintText,
    this.labelText = "data",
    this.onChanged,
    this.readOnly = false,
    required this.borderstyle,
    super.key});


  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: widget.borderstyle,
        labelText: widget.labelText,
        hintText: widget.hintText
      ),
      onChanged: widget.onChanged,
    );
  }
}