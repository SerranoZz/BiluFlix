import 'package:flutter/material.dart';

import '../../controller/VideoController.dart';
import '../video.dart';

class Serie extends StatefulWidget {

  @override
  State<Serie> createState() => _SerieState();
}

class _SerieState extends State<Serie> {
  List<List<dynamic>> labels = [];


  late VideoController videoController;

   @override
  void initState() {
    super.initState();
    videoController = VideoController();
    _loadSeries();
  }

  Future<void> _loadSeries() async {
  List<List<dynamic>> series = await videoController.catalogoSeries();
  setState(() {
    this.labels=series;
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
                                            MaterialPageRoute(builder: (context) => Video(labels[index][index2+1],labels[index][0])), // Substitua "NovaTela" pelo nome da tela para a qual deseja navegar
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