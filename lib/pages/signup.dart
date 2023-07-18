import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Colors.black, Color(0xE520083C)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/logo.png', // Substitua pelo caminho da sua imagem
                    width: 140, // Ajuste a largura da imagem conforme necessário
                    height: 140, // Ajuste a altura da imagem conforme necessário
                  ),
                  Container(
                    child: Column(children: [
                      _buildText('Crie uma nova conta', Colors.white, 16),
                      _buildText('É rápido e fácil!', Colors.white, 16),
                    ],),
                  ),
                  _buildTextLabel('Nome:', Colors.white, 300, false),
                  _buildTextLabel('Email:', Colors.white, 300, false),
                  _buildTextLabel('Senha:', Colors.white, 300, true),
                  _buildButton('CADASTRAR', Color(0xFFFFF400), 300)
                ],
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
            style: TextStyle(
                fontSize: 14,
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