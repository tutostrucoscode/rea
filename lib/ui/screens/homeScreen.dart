import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rea/ui/widgets/textField.dart';

class Cuestion2Screen extends StatefulWidget {
  const Cuestion2Screen({Key? key}) : super(key: key);

  @override
  State<Cuestion2Screen> createState() => _Cuestion2ScreenState();
}

class _Cuestion2ScreenState extends State<Cuestion2Screen> {
  final _fomKey = GlobalKey<FormState>();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final _field1Controller = TextEditingController();
  final _field2Controller = TextEditingController();
  final _field3Controller = TextEditingController();
  final _field4Controller = TextEditingController();
  final _field5Controller = TextEditingController();
  final _field6Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
        child: DraggableScrollableSheet(
            maxChildSize: .9,
            minChildSize: .5,
            initialChildSize: .6,
            builder: (ctx, controller) {
              return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Form(
                      key: _fomKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text("Formulario de Ingreso",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent)),
                            const SizedBox(
                              height: 45,
                            ),
                            TProgress(
                              hintText: 'Nombre de la universidad',
                              prefix: const Icon(Icons.apartment),
                              controller: _field1Controller,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TProgress(
                              hintText: 'Nombre de la facultad',
                              prefix: const Icon(Icons.school),
                              controller: _field2Controller,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TProgress(
                              hintText: 'Semestre cursando',
                              prefix: const Icon(Icons.numbers),
                              controller: _field3Controller,
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TProgress(
                              hintText: 'Promedio general de la carrera',
                              prefix: const Icon(Icons.star),
                              controller: _field4Controller,
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TProgress(
                              hintText: 'Materia de interes',
                              prefix: const Icon(Icons.book),
                              controller: _field5Controller,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TProgress(
                              hintText: 'Horas de estudio',
                              prefix: const Icon(Icons.timer),
                              controller: _field6Controller,
                              keyboardType: TextInputType.datetime,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TextButton(
                                onPressed: () async {
                                  await firebaseFirestore
                                      .collection("forms")
                                      .add({
                                    "field1": _field1Controller.text,
                                    "field2": _field2Controller.text,
                                    "field3": _field3Controller.text,
                                    "field4": _field4Controller.text,
                                    "field5": _field5Controller.text,
                                    "field6": _field6Controller.text,
                                  });
                                  Navigator.pushNamed(context, '/list');
                                },
                                child: const Align(
                                    alignment: Alignment.center,
                                    child: Text("Enviar",
                                        style: TextStyle(fontSize: 20.0),
                                        textAlign: TextAlign.center)))
                          ]),
                    ),
                  ));
            }),
      ),
    );
  }
}
