import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  final bool isfoucs;
  final String hint;
  final void Function(String)? onChanged;
  const Customtextfield(
      {super.key, required this.hint, this.onChanged, this.isfoucs = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: isfoucs,
      validator: (data) {
        if (data!.isEmpty) return "field is required";
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
