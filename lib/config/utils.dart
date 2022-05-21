import 'package:flutter/material.dart';
import 'package:rea/domain/models/category_model.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
          name: 'Matematicas discretas',
          icon: const Icon(Icons.school),
          color: Colors.redAccent,
          imgName: 'estudio',
          subCategories: []),
      Category(
          name: 'Matematicas operativas',
          icon: const Icon(Icons.school),
          color: Colors.redAccent,
          imgName: 'estudio',
          subCategories: []),
      Category(
          name: 'Logica de programacion',
          icon: const Icon(Icons.school),
          color: Colors.redAccent,
          imgName: 'estudio',
          subCategories: []),
    ];
  }
}
