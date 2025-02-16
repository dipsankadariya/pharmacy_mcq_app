import 'package:flutter/material.dart';

class FormContainer extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldkey;
  final bool? isPasswordField;
  final String? hintText;
  final String? helperText;
  final String? labelText;
  final FormFieldSetter<String>? onsaved;
  final FormFieldValidator<String>? validator;
  final TextInputType? inputType;
  final ValueChanged<String>? onfieldSubmitted;

  const FormContainer(
      {super.key,
      this.controller,
      this.fieldkey,
      this.helperText,
      this.hintText,
      this.inputType,
      this.isPasswordField,
      this.labelText,
      this.onfieldSubmitted,
      this.onsaved,
      this.validator});

  @override
  _FormContainerState createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  bool _obsecure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: widget.controller,
        key: widget.fieldkey,
        keyboardType: widget.inputType,
        validator: widget.validator,
        onFieldSubmitted: widget.onfieldSubmitted,
        obscureText: widget.isPasswordField == true ? _obsecure : false,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.black),
            suffixIcon: widget.isPasswordField == true
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _obsecure = !_obsecure;
                      });
                    },
                    child: Icon(
                      _obsecure ? Icons.visibility_off : Icons.visibility,
                      color: _obsecure == false ? Colors.blue : Colors.grey,
                    ),
                  )
                : null),
      ),
    );
  }
}
