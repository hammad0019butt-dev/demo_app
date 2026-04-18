import 'package:flutter/material.dart';

class HTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final TextInputType? keyBoardType;

  const HTextField({
    super.key,
    required this.controller,
    this.hintText,
    required this.labelText,
    this.keyBoardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      height: 50,
      child: TextField(
        controller: controller,
        autofocus: true,
        keyboardType: keyBoardType,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: const Color(0xFF212121),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: const Color(0xFFBFC6CC)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Color(0xFFBFC6CC),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
