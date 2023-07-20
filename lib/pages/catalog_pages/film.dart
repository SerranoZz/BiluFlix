import 'package:catalogo_video/pages/video.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_video/controller/VideoController.dart';

class Film extends StatefulWidget {
  const Film({super.key});

  @override
  State<Film> createState() => _FilmState();
}

class _FilmState extends State<Film> {
  List<List<dynamic>> labels = [];


  late VideoController videoController;

  @override
  void initState() {
    super.initState();
    videoController = VideoController();
    _loadFilmes();
  }

  Future<void> _loadFilmes() async {
  List<List<dynamic>> filmes = await videoController.catalogoFilmes();
  setState(() {
    this.labels=filmes;
  });
  }

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
            if(labels[index].length>1){
              return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildText(labels[index][0], Colors.white, 20),
                              Container(
                                height: 158,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: labels[index].length-1,
                                  itemBuilder: (BuildContext context, index2){
                                    return Container(
                                      margin: EdgeInsets.only(right: 12),
                                      width: 111,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: GestureDetector(
                                        onTap: () => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Video(labels[index][index2+1],labels[index][0])),
                                          )
                                        },
                                        child: Image.network(labels[index][index2+1]["thumbnailImageId"].toString(),fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }
                                ),
                              ),
                              SizedBox(height: 15,)
                            ],
                          );
            }else {return Container();}
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