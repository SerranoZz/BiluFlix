import 'package:catalogo_video/helper/DatabaseHelper.dart';
import 'package:catalogo_video/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/LoginController.dart';
import '../model/user.dart';
import 'navigation.dart';

enum LoginStatus { notSignIn, signIn }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String? _email, _password;
  final _formKey = GlobalKey<FormState>();
  late LoginController controller;
  var value;

  _LoginPageState() {
    this.controller = LoginController();
  }

  void _submit() async {
    final form = _formKey.currentState;

    if (form!.validate()) {      
      form.save();

      try{
        User user = (await controller.getLogin(_email!, _password!)) as User;
        if (user.id != -1) {
          savePref(1, user.email, user.password);
          _loginStatus = LoginStatus.signIn;

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavBar(user: user)),
          );
          
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuário não registrado!')),
          );
        }
      } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );     
      }
    }
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      preferences.setInt("value", 0);
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  savePref(int value, String user, String pass) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      preferences.setInt("value", value);
      preferences.setString("user", user);
      preferences.setString("pass", pass);
    });
  }

  void changeToCatalog(BuildContext context){;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavBar()),
    );
  }

  @override
  void initState() {
    super.initState();
    getPref();
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/logo.png', // Substitua pelo caminho da sua imagem
                    width: 140, // Ajuste a largura da imagem conforme necessário
                    height: 140, // Ajuste a altura da imagem conforme necessário
                  ),
                  _buildText('Login', Colors.white, 30),
                  _buildText('Olá, seja bem-vindo(a)', Colors.white, 21),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTextLabel('Email:', Colors.white, 300, false, _emailController),
                        SizedBox(height: 15,),
                        _buildTextLabel('Senha:', Colors.white, 300, true, _passwordController),
                      ],
                    ),
                  ),
                  _buildButton('LOGIN', Color(0xFFFFF400), 300, () => _submit()),
                  Container(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildText('Ainda não tem cadastro?' , Colors.white, 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()), // Substitua "NovaTela" pelo nome da tela para a qual deseja navegar
                            );
                          },
                          child: Text(
                            'Clique aqui',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFFF400),
                                decoration: TextDecoration.underline,
                              ),
                          ),
                        ),        
                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFF0F0F0),
                        ),
                      ),
                    ),
                  ),
                  _buildButton('Entrar sem login', Colors.white, 300, () => changeToCatalog(context)),
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

  Widget _buildTextLabel(
    String text, Color color, double width, bool senha, TextEditingController controller) {
  return Container(
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
          child: TextFormField(
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
            onSaved: (value) {
              if (text == 'Email:') {
                _email = value;
              } else if (text == 'Senha:') {
                _password = value;
              }
            },
          ),
        ),
      ],
    ),
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