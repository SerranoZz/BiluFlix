import 'package:catalogo_video/model/user.dart';
import 'package:catalogo_video/pages/login.dart';
import 'package:catalogo_video/pages/user_pages/addvideo.dart';
import 'package:catalogo_video/pages/user_pages/myvideos.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginStatus { notSignIn, signIn }

class UserPage extends StatefulWidget {
  User user;

  UserPage({
    required this.user,
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with SingleTickerProviderStateMixin{
  late TabController tabController;

  LoginStatus _loginStatus = LoginStatus.signIn;

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", 0);
      _loginStatus = LoginStatus.notSignIn;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

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
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Colors.black, Color(0xE520083C)],
          ),
        ),
        child: Center(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Image.asset(
                    'assets/bilu.png', // Substitua pelo caminho da sua imagem
                    width: 100, // Ajuste a largura da imagem conforme necessário/ Ajuste a altura da imagem conforme necessário
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Column(children: [
                      _buildText(widget.user.name, Colors.white, 30),
                      SizedBox(height: 10),
                      _buildButton('Deslogar', Color(0xFFFFF400), 120),
                      SizedBox(height: 10),
                    ],),
                  ),
                  Container(
                    width: 400,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: TabBar(
                            unselectedLabelColor: Colors.white,
                            labelColor: Color(0xFFFFF400),
                            indicatorColor: Color(0xFFFFF400),
                            indicatorWeight: 2,
                            controller: tabController,
                             labelStyle: TextStyle(
                              fontSize: 19, 
                              fontWeight: FontWeight.normal, 
                              fontFamily: 'Lexend',
                            ),
                            tabs: [
                              Tab(
                                text: 'Meus Vídeos',
                              ),
                              
                              Tab(
                                text: 'Adicionar Vídeos',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: 
                    TabBarView(
                      controller: tabController,
                      children: [
                        MyVideos(user: widget.user),
                        AddVideo(user: widget.user),
                      ],
                    ),
                  ),
                ],
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
          signOut();
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

}