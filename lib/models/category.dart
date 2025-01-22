import 'package:flutter/material.dart';

class Category {
  const Category(this.id, this.tittle, [this.color = Colors.deepOrangeAccent]);

  final String id;
  final String tittle;
  final Color color;
}
