import 'package:catalogo_video/pages/user_pages/addVideo.dart';
import 'package:catalogo_video/pages/user_pages/myVideos.dart';
import 'package:flutter/material.dart';

class Editar extends StatefulWidget {
  const Editar({super.key});

  @override
  State<Editar> createState() => _EditarState();
}

class _EditarState extends State<Editar> with SingleTickerProviderStateMixin{
  late TabController tabController;
  
  @override
  void initState(){
    tabController = TabController(length: 2, vsync: this);
    super.initState();
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
                                  'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/bb73c913cae027a8d4b2f81e076b70c7b07dcee75d686417c5dd032dc773210c._RI_TTW_.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        SizedBox(height: 15),

                        Column(      
                          children: [
                            _buildTextLabel('Título:', Colors.white, 350, 40, false),
                            SizedBox(height: 15),
                            _buildTextLabel('Descrição:', Colors.white, 350, 40,false),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: _buildComboBox('Tipo:', Colors.white, 130),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: _buildComboBox('Gênero:', Colors.white, 210),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: _buildTextLabel('Duração:', Colors.white, 110, 40,false),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: _buildTextLabel('Faixa Etária:', Colors.white, 110, 40,false),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: _buildTextLabel('Lançamento:', Colors.white, 110, 40,false),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            _buildTextLabel('URL Imagem (Thumbnail):', Colors.white, 350, 40,false),
                            SizedBox(height: 10),
                            _buildButton('ADICIONAR', Color(0xFFFFF400), 350),
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

  Widget _buildTextLabel(String text, Color color, double width, double height, bool senha){
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

  Widget _buildComboBox(String text, Color color, double width) {
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
                  print('Item selecionado: $value');
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