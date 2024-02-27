import 'package:flutter/material.dart';
import 'package:machine_test1/presentation/core/theme.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController textCont;
  final bool obscure;
  final String text;

  const CustomTextField({super.key, required this.hint, required this.textCont, required this.obscure, required this.text,});

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,style: MyTextStyle.mediumGreyText,),
          const SizedBox(height: 5,),
          TextFormField(
            obscureText: obscure,
            controller: textCont,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                hintText: hint,
                hintStyle: MyTextStyle.optionTextMediumLight,
                filled: true),
          ),
        ],
      ),
    );
  }
}
