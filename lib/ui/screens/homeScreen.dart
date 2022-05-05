import 'package:flutter/material.dart';
import 'package:rea/ui/screens/forms/page1.dart';
import 'package:rea/ui/screens/forms/page2.dart';
import 'package:rea/ui/screens/forms/page3.dart';
import 'package:rea/ui/widgets/progress.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          DraggableScrollableSheet(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PForm(pages: const [
                          Page1(),
                          Page2(),
                          Page3()
                        ], title: [
                          PTitle(
                            title: 'Información de la univeridad',
                          ),
                          PTitle(
                            title: 'Información de la carrera',
                          ),
                          PTitle(
                            title: 'Confirmación',
                          )
                        ])
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
