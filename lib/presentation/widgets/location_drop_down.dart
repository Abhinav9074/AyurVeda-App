import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test1/domain/models/branch_model.dart';
import 'package:machine_test1/presentation/core/theme.dart';

class LocationDropDown extends StatefulWidget {
  final String text;
  final String hint;
  final List<DropdownMenuItem> list;
  const LocationDropDown(
      {super.key, required this.text, required this.list, required this.hint});

  @override
  State<LocationDropDown> createState() => _CustomDropDownState();
}
class _CustomDropDownState extends State<LocationDropDown> {

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.text,
                style: MyTextStyle.mediumGreyText,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButton(
                    isExpanded: true,
                    disabledHint: Text(widget.hint),
                    hint: Text(widget.hint),
                    dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                    items: widget.list,
                    onChanged: (value) {
                      if(value is BranchModel){
                        log(value.name.toString());
                      }else{
                      log(value.toString());
                      }
                    }),
              ),
            ],
          ),
        );
  }
}
