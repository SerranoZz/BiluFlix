import 'package:flutter/material.dart';
import '../../helper/DatabaseHelper.dart';
import '../../controller/VideoController.dart';
import '../../model/user.dart';

class AddVideo extends StatefulWidget {
  final User user;

  AddVideo({required this.user});

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _duracaoController = TextEditingController();
  TextEditingController _faixaController = TextEditingController();
  TextEditingController _lancamentoController = TextEditingController();
  TextEditingController _urlController = TextEditingController();
  TextEditingController _tipo = TextEditingController();
  TextEditingController _genero = TextEditingController();
  
  late VideoController videoController;

  @override
  void initState() {
    super.initState();
    videoController = VideoController();
  }

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
                          child: _buildTextLabel('Título:', Colors.white, 350, false, _tituloController),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20,top: 15),
                          child: _buildTextLabel('Descrição:', Colors.white, 350, false, _descricaoController),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20,top: 15),
                              child: _buildTextLabel('Tipo:', Colors.white, 130, false, _tipo),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10,top: 15),
                              child: _buildTextLabel('Gênero:', Colors.white, 210, false, _genero),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20,top: 15),
                              child: _buildTextLabel('Duração:', Colors.white, 110, false, _duracaoController),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10,top: 15),
                              child: _buildTextLabel('Faixa Etária:', Colors.white, 110, false, _faixaController),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10,top: 15),
                              child: _buildTextLabel('Lançamento:', Colors.white, 110, false, _lancamentoController),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20,top: 15),
                          child: _buildTextLabel('URL Imagem (Thumbnail):', Colors.white, 350, false, _urlController),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20,top: 15),
                          child: _buildButton('ADICIONAR', Color(0xFFFFF400), 350, () => videoController.adicionarVideo(widget.user.id, _tituloController, _descricaoController, _tipo, _faixaController, _duracaoController, _urlController, _lancamentoController, _genero)),
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

  Widget _buildTextLabel(String text, Color color, double width, bool senha, controller){
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
              controller: controller,
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

  Widget _buildButton(String text, Color color, double width, onPressed){
    return ElevatedButton(
        onPressed: onPressed,
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

  Widget _buildComboBox(String text, Color color, double width, valor) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),

          Container(
            height: 40.0,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration.collapsed(hintText: ''),
                borderRadius: BorderRadius.circular(10),
                items: [
                  DropdownMenuItem<String>(
                    value: 'Option 1',
                    child: 
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Masculino',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w400,
                          ),
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  valor=value;
                },
                value: null, 
                isExpanded: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}