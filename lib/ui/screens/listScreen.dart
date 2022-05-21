import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: null,
      //drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Lista de Materias'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('list').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Container(
                  margin: EdgeInsets.all(20),
                  height: 150,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/imgs/' +
                                (doc.data() as dynamic)['imgName'] +
                                '.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent
                                  ])),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(children: [
                              ClipOval(
                                child: Container(
                                  color: Colors.redAccent,
                                  padding: EdgeInsets.all(10),
                                  child: const Icon(Icons.school),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                (doc.data() as dynamic)['title'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              )
                            ]),
                          ))
                    ],
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}

//title: Text('${(doc.data() as dynamic)['title']}'),