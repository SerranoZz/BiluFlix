import 'package:flutter/material.dart';

class Video extends StatefulWidget {
  const Video({Key? key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: [Colors.black, Color(0xE520083C)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [

                  Expanded(
                    flex: 1,
                    child: Image.network(
                      'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcThhjAv6Y9BKKrJyczESuQQwW7MSBJbWuWtUiN3e5MgEv5op-ZF',
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        _buildText('Gente Grande', 30),
                        SizedBox(height: 10),
                        Divider( // Linha horizontal
                          color: Colors.white,
                          thickness: 1,
                          height: 0,
                        ),
                        SizedBox(height: 10),
                        _buildText('  A12 | Filme | Comédia | 2010  ', 20),
                        SizedBox(height: 10),
                        Divider( // Linha horizontal
                          color: Colors.white,
                          thickness: 1,
                          height: 0,
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.all(15),
                          child: _buildText('A morte do treinador de basquete de infância de velhos amigos reúne a turma no mesmo lugar que celebraram um campeonato anos atrás. Os amigos, acompanhados de suas esposas e filhos, descobrem que idade não significa o mesmo que maturidade.', 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(String text, double size) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Lexend',
        fontSize: size,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }

}
