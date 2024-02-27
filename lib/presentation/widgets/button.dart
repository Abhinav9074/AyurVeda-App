import 'package:flutter/material.dart';
import 'package:machine_test1/presentation/core/theme.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const CommonButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 51, 125, 53)),
          padding:
              MaterialStateProperty.all(const EdgeInsets.fromLTRB(130, 15, 130, 15)),
          textStyle:
              MaterialStateProperty.all(MyTextStyle.commonHeadingTextWhite)),
      child: Text(text),
    );
  }
}
