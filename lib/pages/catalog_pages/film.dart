import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Film extends StatefulWidget {
  const Film({super.key});

  @override
  State<Film> createState() => _FilmState();
}

class _FilmState extends State<Film> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      body: Text('FILMES'),
    );
  }
}