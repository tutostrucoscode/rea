import 'package:flutter/material.dart';
import 'package:rea/ui/widgets/textField.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(children: [
        TProgress(
          hintText: 'Como se entero de nosotros',
          prefix: const Icon(Icons.batch_prediction),
        ),
        SizedBox(height: 15),
        TProgress(
          hintText: 'Heres estudiante o profesor',
          prefix: const Icon(Icons.assignment_ind),
        ),
      ]),
    );
  }
}
