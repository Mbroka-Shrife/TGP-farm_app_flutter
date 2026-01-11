import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // ضروري لإضافة FilteringTextInputFormatter

class CustomFormField extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final bool isPassword;
  final TextInputType? inputType;

  const CustomFormField({
    super.key, 
    required this.hintText, 
    this.suffixIcon, 
    this.isPassword = false, 
    this.inputType
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      keyboardType: inputType,
      // هذا الجزء يضمن أنه إذا كان الكيبورد رقمي، لا يقبل الحقل إلا أرقام فقط
      inputFormatters: inputType == TextInputType.number || inputType == TextInputType.phone
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Icon(suffixIcon, color: const Color(0xff69a03a)),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}