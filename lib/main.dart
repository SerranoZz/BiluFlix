import 'package:catalogo_video/pages/login.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (BuildContext context) => LoginPage(),
  '/login': (BuildContext context) => LoginPage(),
};

void main() {
  runApp(MaterialApp(
    title: "Catálogo de Vídeos",
    debugShowCheckedModeBanner: false,
    routes: routes,
  ));
}