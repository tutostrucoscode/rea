import 'package:flutter/material.dart';
import 'package:rea/domain/models/form_model.dart';
import 'package:rea/ui/widgets/textField.dart';

class Page2 extends StatelessWidget {
  final FormFieldModel formField;

  const Page2({Key? key, required this.formField}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _field5Controller = TextEditingController();
    _field5Controller.text = formField.field5;
    TextEditingController _field6Controller = TextEditingController();
    _field6Controller.text = formField.field6;
    TextEditingController _field7Controller = TextEditingController();
    _field7Controller.text = formField.field7;
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(children: [
        TProgress(
          hintText: 'Materia de interes',
          prefix: const Icon(Icons.book),
          controller: _field5Controller,
        ),
        SizedBox(height: 15),
        TProgress(
          hintText: 'Horas de estudio',
          prefix: const Icon(Icons.timer),
          controller: _field6Controller,
        ),
        SizedBox(height: 15),
        TProgress(
          hintText: 'Promedio general de la carrera',
          prefix: const Icon(Icons.star),
          controller: _field7Controller,
        ),
      ]),
    );
  }
}
