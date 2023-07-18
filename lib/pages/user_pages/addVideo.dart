import 'package:flutter/material.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({super.key});

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      body: Container(      
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 450,
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20, top: 15),
                          child: _buildTextLabel('Título:', Colors.white, 350, false),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20,top: 15),
                          child: _buildTextLabel('Descrição:', Colors.white, 350, false),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20,top: 15),
                              child: _buildTextLabel('Tipo:', Colors.white, 130, true),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10,top: 15),
                              child: _buildTextLabel('Gênero:', Colors.white, 210, true),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20,top: 15),
                              child: _buildTextLabel('Duração:', Colors.white, 110, true),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10,top: 15),
                              child: _buildTextLabel('Faixa Etária:', Colors.white, 110, true),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10,top: 15),
                              child: _buildTextLabel('Lançamento:', Colors.white, 110, true),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20,top: 15),
                          child: _buildTextLabel('URL Imagem (Thumbnail):', Colors.white, 350, true),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20,top: 15),
                          child: _buildButton('ADICIONAR', Color(0xFFFFF400), 350),
                        ),
                      ],                    
                    )
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildText(String text, Color color, double size) {
    return Text(
      text,
      style:TextStyle(
          fontSize: size,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w400,
          color: color,
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
            style:TextStyle(
                fontSize: 16,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
                color: color,
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
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
                color: Colors.black,
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
          style: TextStyle(
                fontSize: 15,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold,
                color: Colors.black,
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