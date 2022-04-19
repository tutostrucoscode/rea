import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 150,
                child: Text("Rea"),
              ),
              const Text(
                "Bienvenido",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Nombre de usuario",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              const Text(
                "Email",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              ActionChip(label: const Text("Desconectarse"), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
