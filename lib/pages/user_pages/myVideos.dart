import 'package:flutter/material.dart';

class MyVideos extends StatefulWidget {
  const MyVideos({super.key});

  @override
  State<MyVideos> createState() => _MyVideosState();
}

class _MyVideosState extends State<MyVideos> {
  List<String> labels = ['0','1','2','3'];

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
                Container(
                  height: 158,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, index2){
                      return Container(
                        child: _buildText('Usuário', Colors.white, 30),
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
      style: TextStyle(
          fontSize: size,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w400,
          color: color,
        ),
    );
  }
}