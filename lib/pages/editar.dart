import 'package:catalogo_video/controller/VideoController.dart';
import 'package:flutter/material.dart';
import '../model/user.dart';

class Editar extends StatefulWidget {
  final List<dynamic> video;
  final int index;
  final User user;

  const Editar({required this.video, required this.index, required this.user});

  @override
  State<Editar> createState() => _EditarState();
}

class _EditarState extends State<Editar> with SingleTickerProviderStateMixin{
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _duracaoController = TextEditingController();
  TextEditingController _faixaController = TextEditingController();
  TextEditingController _lancamentoController = TextEditingController();
  TextEditingController _urlController = TextEditingController();
  TextEditingController _tipoController = TextEditingController();
  TextEditingController _generoController = TextEditingController();

  late VideoController videoController;
  late TabController tabController;
  
  funcao() async{
    _tituloController.text = widget.video[this.widget.index]['name'];
    _descricaoController.text = widget.video[this.widget.index]['description'];
    _duracaoController.text = widget.video[this.widget.index]['durationMinutes'].toString();
    _faixaController.text = widget.video[this.widget.index]['ageRestriction'];
    _lancamentoController.text = widget.video[this.widget.index]['releaseDate'];
    _urlController.text = widget.video[this.widget.index]['thumbnailImageId'];

  }

  @override
  void initState(){
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    funcao();
    videoController = VideoController();
  }
  
  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }

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
        child: Container(      
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildText('Editar Vídeo', Colors.white, 30),
                      SizedBox(height: 20),
                      Container(
                        width: 140,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.video[this.widget.index]['thumbnailImageId'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 15),

                  Column(      
                    children: [
                      _buildTextLabel('Título:', Colors.white, 350, 40, false, _tituloController),
                      SizedBox(height: 15),
                      _buildTextLabel('Descrição:', Colors.white, 350, 40, false, _descricaoController),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: _buildComboBoxTipo('Tipo:', Colors.white, 130),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: _buildComboBoxGen('Gênero:', Colors.white, 210),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: _buildTextLabel('Duração:', Colors.white, 110, 40, false, _duracaoController),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: _buildTextLabel('Faixa Etária:', Colors.white, 110, 40, false, _faixaController),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: _buildTextLabel('Lançamento:', Colors.white, 110, 40, false, _lancamentoController),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      _buildTextLabel('URL Imagem (Thumbnail):', Colors.white, 350, 40, false, _urlController),
                      SizedBox(height: 10),
                      _buildButton('ATUALIZAR', Color(0xFFFFF400), 350, () => videoController.atualizarVideo(widget.video[widget.index]["id"],_tituloController, _descricaoController, _tipoController, _faixaController, _duracaoController, _urlController, _lancamentoController, _generoController, context, widget.user)),
                      SizedBox(height: 15),
                    ],
                  ),                  
                ],                    
              )
            ),
          ),
        ),
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

  Widget _buildTextLabel(String text, Color color, double width, double height, bool senha, controller){
    return(
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 14,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),

          Container(
            height: height,
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
          style:TextStyle(
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

  Widget _buildComboBoxGen(String text, Color color, double width) {
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
                    value: '1',
                    child: 
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Comédia',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w400,
                          ),
                      ),
                    ),
                  ),

                  DropdownMenuItem<String>(
                    value: '2',
                    child: 
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Terror',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w400,
                          ),
                      ),
                    ),
                  ),

                  DropdownMenuItem<String>(
                    value: '3',
                    child: 
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Aventura',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w400,
                          ),
                      ),
                    ),
                  ),

                  DropdownMenuItem<String>(
                    value: '4',
                    child: 
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Suspense',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w400,
                          ),
                      ),
                    ),
                  ),

                  DropdownMenuItem<String>(
                    value: '5',
                    child: 
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Ação',
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
                  _generoController.text = value!;
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

  Widget _buildComboBoxTipo(String text, Color color, double width) {
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
                    value: '0',
                    child: 
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Filme',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w400,
                          ),
                      ),
                    ),
                  ),

                  DropdownMenuItem<String>(
                    value: '1',
                    child: 
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Série',
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
                  _tipoController.text=value!;
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