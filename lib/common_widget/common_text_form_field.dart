import 'package:flutter/material.dart';

Widget commonTextFormField({
  required IconData icon,
  required String nameOfField,
  required TextEditingController textEditingController,
  required String? Function(String?)? validator,
  bool obscureText = false,
}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          hintText: nameOfField,
          prefixIcon: Icon(icon),
        ),
        obscureText: obscureText,
      ),
    );
