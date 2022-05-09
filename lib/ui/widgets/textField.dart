import 'package:flutter/material.dart';

class TProgress extends StatelessWidget {
  String hintText;
  Widget prefix;
  TextEditingController controller;

  TProgress(
      {Key? key,
      required this.hintText,
      required this.prefix,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: prefix,
            hintText: hintText,
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
