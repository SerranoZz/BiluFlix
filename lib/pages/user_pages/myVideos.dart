import 'package:catalogo_video/pages/editar.dart';
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
                        //_list();
                      },
                      child: Text("Cancelar"),
                    ),
                    TextButton(
                      onPressed: () {
                        //_deleteById(_taskList[index].id);
                        setState(() {
                          //_taskList.removeAt(index);
                        });
                        Navigator.pop(context);
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
            MaterialPageRoute(builder: (context) => Editar()), // Substitua "NovaTela" pelo nome da tela para a qual deseja navegar
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
                  'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/bb73c913cae027a8d4b2f81e076b70c7b07dcee75d686417c5dd032dc773210c._RI_TTW_.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 26),
              child: Container(
              constraints: 
                BoxConstraints(
                  maxWidth: 200, // Defina o valor máximo de largura desejado
                ),
                child: _buildText('Uncharted: Fora do Mapa', Colors.white, 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}