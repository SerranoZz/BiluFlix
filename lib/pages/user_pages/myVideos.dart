import 'package:catalogo_video/pages/editar.dart';
import 'package:flutter/material.dart';

import '../../controller/VideoController.dart';
import '../../model/user.dart';

class MyVideos extends StatefulWidget {
  final User user;
  const MyVideos({required this.user});

  @override
  State<MyVideos> createState() => _MyVideosState();
}

class _MyVideosState extends State<MyVideos> {
  List<dynamic> labels = [];

  late VideoController videoController;

  @override
  void initState() {
    super.initState();
    videoController = VideoController();
    _loadVideos();
  }

  Future<void> _loadVideos() async {
  List<dynamic> videos = await videoController.meusVideos(widget.user.id);
  setState(() {
    this.labels=videos;
  });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),

      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: labels.length,
          itemBuilder: (BuildContext context, index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildVideos(context, index),
                SizedBox(height: 20,),
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
      softWrap: true,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: size,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w400,
          color: color,
        ),
    );
  }

  Widget _buildVideos(BuildContext context, int index){
    
    return
    Dismissible(
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Tem certeza que deseja excluir?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _loadVideos();
                      },
                      child: Text("Cancelar"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        videoController.deleteById(this.labels[index]["id"]);
                        setState(() {
                          this.labels.removeAt(index);
                        });
                        
                      },
                      child: Text("Excluir"),
                    ),
                  ],
                );
              },
            );

        } else if (direction == DismissDirection.startToEnd) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Editar(video: labels,index: index, user: widget.user,)),
          );
        }
      }, 
      background: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.edit,
            color: Colors.white,
          )
        ],
      ),
    ),
    secondaryBackground: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.delete,
            color: Colors.white,
          )
        ],
      ),
    ),
    child: 
      Container(
        width:  MediaQuery.of(context).size.width - 25,
        decoration: BoxDecoration(
          color: Color(0xF2030000),
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 110,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)
                ),
                child: Image.network(
                  this.labels[index]["thumbnailImageId"],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 200,
                ),
                alignment: Alignment.center,
                child: _buildText(
                  "${this.labels[index]["name"]}  \n\n ${this.labels[index]["type"] == 0 ? "Filme" : "Série"}",
                  Colors.white,
                  18,
                ), 
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}