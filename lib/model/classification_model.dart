import 'package:flutter/material.dart';

class ClassificationModel {
  final String img;
  final String title;
  final Widget screen;
  final bool active;

  ClassificationModel({
    required this.img,
    required this.title,
    required this.screen,
    required this.active,
  });
}
