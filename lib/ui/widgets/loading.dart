import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final BuildContext context;
  const LoadingWidget({Key? key, required this.context}) : super(key: key);

  @override
  _AlertWidgetState createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Rea',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(25),
              child: const LinearProgressIndicator(),
            ),
            const Text(
              'Cargando ...',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
