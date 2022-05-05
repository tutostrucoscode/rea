import 'package:flutter/material.dart';

class TProgress extends StatelessWidget {
  String hintText;
  Widget prefix;

  TProgress({Key? key, required this.hintText, required this.prefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: prefix,
            hintText: hintText,
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
