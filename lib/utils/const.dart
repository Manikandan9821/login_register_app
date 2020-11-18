import 'package:flutter/material.dart';

final decoration =  BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  gradient: LinearGradient(
    colors: [
      Color(0xFFF4325C),
      Color(0xFFFB8C66),
    ],
    stops: [0.5, 1.6,],
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
  ),
);