import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Film extends StatefulWidget {
  const Film({super.key});

  @override
  State<Film> createState() => _FilmState();
}

class _FilmState extends State<Film> {
  List<List<String>> labels = [['0','1','2','3'], ['4','5','6','7'], ['8','8','4','7','7','7']];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),

      body: Container(
        margin: EdgeInsets.only(left: 12),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: labels.length,
          itemBuilder: (BuildContext context, index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildText('Comédia', Colors.white, 20),
                Container(
                  height: 158,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: labels[0].length,
                    itemBuilder: (BuildContext context, index2){
                      return Container(
                        margin: EdgeInsets.only(right: 12),
                        width: 111,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,

                        ),
                      );
                    }
                  ),
                ),
                SizedBox(height: 15,)
              ],
            );
            
          }
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
}