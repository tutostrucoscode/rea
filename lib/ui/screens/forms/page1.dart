import 'package:flutter/material.dart';
import 'package:rea/ui/widgets/textField.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(children: [
        TProgress(
          hintText: 'Nombre de la universidad',
          prefix: const Icon(Icons.apartment),
        ),
        SizedBox(height: 15),
        TProgress(
          hintText: 'Nombre de la facultad',
          prefix: const Icon(Icons.school),
        ),
        SizedBox(height: 15),
        TProgress(
          hintText: 'Semestre cursando',
          prefix: const Icon(Icons.numbers),
        ),
        SizedBox(height: 15),
        TProgress(
          hintText: 'Promedio general de la carrera',
          prefix: const Icon(Icons.star),
        ),
      ]),
    );
  }
}
