import 'package:flutter/material.dart';
import 'package:rea/domain/models/form_model.dart';
import 'package:rea/ui/widgets/textField.dart';

class Page1 extends StatelessWidget {
  final FormFieldModel formField;

  const Page1({Key? key, required this.formField}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _field1Controller = TextEditingController();
    _field1Controller.text = formField.field1;
    TextEditingController _field2Controller = TextEditingController();
    _field2Controller.text = formField.field2;
    TextEditingController _field3Controller = TextEditingController();
    _field3Controller.text = formField.field3;
    TextEditingController _field4Controller = TextEditingController();
    _field4Controller.text = formField.field4;
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(children: [
        TProgress(
          hintText: 'Nombre de la universidad',
          prefix: const Icon(Icons.apartment),
          controller: _field1Controller,
        ),
        const SizedBox(height: 15),
        TProgress(
          hintText: 'Nombre de la facultad',
          prefix: const Icon(Icons.school),
          controller: _field2Controller,
        ),
        const SizedBox(height: 15),
        TProgress(
          hintText: 'Semestre cursando',
          prefix: const Icon(Icons.numbers),
          controller: _field3Controller,
        ),
        const SizedBox(height: 15),
        TProgress(
          hintText: 'Promedio general de la carrera',
          prefix: const Icon(Icons.star),
          controller: _field4Controller,
        ),
      ]),
    );
  }
}
