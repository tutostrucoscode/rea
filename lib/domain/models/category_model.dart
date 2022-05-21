import 'package:flutter/material.dart';

class Category {
  String name;
  Icon icon;
  Color color;
  String imgName;
  List<Category> subCategories;

  Category(
      {required this.name,
      required this.icon,
      required this.color,
      required this.imgName,
      required this.subCategories});
}
