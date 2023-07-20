import 'package:catalogo_video/helper/DatabaseHelper.dart';
import 'package:catalogo_video/pages/login.dart';
import 'package:flutter/material.dart';
import '../controller/LoginController.dart';
import '../model/user.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = LoginController();
  }

  void _submit() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    try{
        User user = (await controller.getLogin(email, password)) as User;
        if (user.id != -1) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuário já existe!')),
          );
          
        } else {
          User user = User(name: name, email: email, password: password);
          int res = await controller.saveUser(user);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuário salvo com sucesso!')),
          );

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );     
      }
  }
  
  @override
  Widget build(BuildContext context) {
    DatabaseHelper bancoFuncs = DatabaseHelper();
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
                  _buildTextLabel('Nome:', Colors.white, 300, false, _nameController),
                  _buildTextLabel('Email:', Colors.white, 300, false, _emailController),
                  _buildTextLabel('Senha:', Colors.white, 300, true, _passwordController),
                  _buildButton('CADASTRAR', Color(0xFFFFF400), 300, _submit),
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

  Widget _buildTextLabel(String text, Color color, double width, senha, controller){
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

  Widget _buildButton(String text, Color color, double width, VoidCallback onPressed){
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
}