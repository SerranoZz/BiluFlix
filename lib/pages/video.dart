import 'package:flutter/material.dart';

class Video extends StatefulWidget {
  Map<String, dynamic> video;
  String genero;
  Video(this.video, this.genero);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
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
          child: SingleChildScrollView( // Adicionado o SingleChildScrollView
            child: Column(
              children: [
                Image.network(
                  widget.video["thumbnailImageId"].toString(),
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 15),
                _buildText(widget.video["name"], 30),
                SizedBox(height: 10),
                Divider(
                  // Linha horizontal
                  color: Colors.white,
                  thickness: 1,
                  height: 0,
                ),
                SizedBox(height: 10),
                _buildText(
                  '  ${widget.video["ageRestriction"]} | ${widget.video["type"] == 0 ? "Filme" : "Série"} | ${widget.genero} | ${widget.video["releaseDate"]}  ',
                  20,
                ),

                SizedBox(height: 10),
                Divider(
                  // Linha horizontal
                  color: Colors.white,
                  thickness: 1,
                  height: 0,
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(15),
                  child: _buildText(widget.video["description"], 20),
                ),
              ],
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
