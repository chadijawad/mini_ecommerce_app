import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController myController;
  final String text;
  final bool isObscure;
  final TextInputType inpuType;
  const TextFieldInput({super.key,required this.text,required this.inpuType,required this.isObscure,required this.myController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:myController ,
      keyboardType:inpuType,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: text,
        // To delete borders
        enabledBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        // fillColor: Colors.red,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
    );
  }
}
