import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller ;
  final bool obscureText;
  final Function validator ;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  const AuthTextFormField({Key? key, required this.controller, required this.obscureText, required this.validator, required this.prefixIcon, required this.suffixIcon, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      obscureText: obscureText,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200, //لون التكست فيلد
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true, // بتظهر اللون اللي عامله
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white ),
        borderRadius: BorderRadius.circular(10),
      ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder:   OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),

    );
  }
}
