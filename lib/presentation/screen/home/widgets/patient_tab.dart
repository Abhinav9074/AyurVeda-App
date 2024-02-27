import 'package:flutter/material.dart';
import 'package:machine_test1/presentation/core/theme.dart';

class PatientTab extends StatelessWidget {
  final String name;
  final String date;
  final String treatement;
  final String index;

  const PatientTab(
      {super.key,
      required this.name,
      required this.date,
      required this.treatement,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 214, 213, 213),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    '$index .',
                    style: MyTextStyle.commonHeadingText,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: MyTextStyle.commonHeadingText),
                    Text(
                      treatement,
                      style: MyTextStyle.discussionHeadingText,
                    ),
                    Text(
                      date,
                      style: MyTextStyle.greyHeadingTextSmall,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
