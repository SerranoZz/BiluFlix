
import 'package:catalogo_video/pages/catalog_pages/film.dart';
import 'package:catalogo_video/pages/catalog_pages/series.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState(){
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Colors.black, Color(0xE520083C)],
          ),
        ),
        child: Center(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Image.asset(
                    'assets/biluflix.png', // Substitua pelo caminho da sua imagem
                    width: 150, // Ajuste a largura da imagem conforme necessário/ Ajuste a altura da imagem conforme necessário
                  ),

                  Container(
                    width: 286,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: TabBar(
                            unselectedLabelColor: Colors.white,
                            labelColor: Color(0xFFFFF400),
                            indicatorColor: Color(0xFFFFF400),
                            indicatorWeight: 2,
                            controller: tabController,
                             labelStyle: TextStyle(
                              fontSize: 24, 
                              fontWeight: FontWeight.normal, 
                              fontFamily: 'Lexend',
                            ),
                            tabs: [
                              Tab(
                                text: 'Filmes',
                              ),
                              
                              Tab(
                                text: 'Séries',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: 
                    TabBarView(
                      controller: tabController,
                      children: [
                        Film(),
                        Serie(),
                      ],
                    ),
                  ),
                ],
              ),
            ), 
        ),
      ),
    );
  }

  Widget _buildText(String text, Color color, double size) {
    return Text(
      text,
      style: 
        GoogleFonts.lexendDeca(
          textStyle: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      ),
    );
  }

  Widget _buildTextLabel(String text, Color color, double width, senha){
    return(
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            text,
            style: 
              GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),

          Container(
            height: 40.0,
            width: width,
            child: TextField(
              decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                contentPadding: EdgeInsets.only(left: 5),
              ),
              obscureText: senha,
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            ),
          ),
        ]),
      )
    );
  }

  Widget _buildButton(String text, Color color, double width){
    return ElevatedButton(
        onPressed: () {
          
        },
        child: 
        Text(
          text,
          style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
        ),

        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(width, 40.0)),
          fixedSize: MaterialStateProperty.all(Size(width, 40.0)),
          backgroundColor: MaterialStateProperty.all(color),
        ),
    );
  }

}