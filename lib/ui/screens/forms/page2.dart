import 'package:flutter/material.dart';
import 'package:rea/ui/widgets/textField.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(children: [
        TProgress(
          hintText: 'Materia de interes',
          prefix: const Icon(Icons.book),
        ),
        SizedBox(height: 15),
        TProgress(
          hintText: 'Horas de estudio',
          prefix: const Icon(Icons.timer),
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
