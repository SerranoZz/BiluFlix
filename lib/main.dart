import 'package:catalogo_video/pages/login.dart';
import 'package:catalogo_video/pages/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Catálogo de Vídeos",
    debugShowCheckedModeBanner: false,
    home: SignUp(),
  ));
}