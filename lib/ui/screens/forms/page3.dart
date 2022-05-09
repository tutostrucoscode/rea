import 'package:flutter/material.dart';
import 'package:rea/domain/models/form_model.dart';
import 'package:rea/ui/widgets/textField.dart';

class Page3 extends StatelessWidget {
  final FormFieldModel formField;

  const Page3({Key? key, required this.formField}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _field8Controller = TextEditingController();
    _field8Controller.text = formField.field8;
    TextEditingController _field9Controller = TextEditingController();
    _field9Controller.text = formField.field9;
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(children: [
        TProgress(
          hintText: 'Como se entero de nosotros',
          prefix: const Icon(Icons.batch_prediction),
          controller: _field8Controller,
        ),
        SizedBox(height: 15),
        TProgress(
          hintText: 'Heres estudiante o profesor',
          prefix: const Icon(Icons.assignment_ind),
          controller: _field9Controller,
        ),
      ]),
    );
  }
}
