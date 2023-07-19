import 'package:catalogo_video/pages/login.dart';
import 'package:catalogo_video/pages/navigation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class DatabaseHelper {

  _recoverDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, "banco.db");
    print(path);

    Database db = await openDatabase(
      path, 
      version: 1,
      onCreate: (db, version) async {
        String sql = """
        CREATE TABLE user(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name VARCHAR NOT NULL,
          email VARCHAR NOT NULL,
          password VARCHAR NOT NULL
        );
        """;
        await db.execute(sql);

        sql = """
        CREATE TABLE genre(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name VARCHAR NOT NULL
        );
        """;
        await db.execute(sql);
        
        sql = """
        CREATE TABLE video(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name VARCHAR(2) NOT NULL,
          description TEXT NOT NULL,
	        type INTEGER NOT NULL,
	        ageRestriction VARCHAR NOT NULL,
	        durationMinutes INTEGER NOT NULL,
	        thumbnailImageId VARCHAR NOT NULL,
	        releaseDate TEXT NOT NULL
        );
        """;
        await db.execute(sql);

        sql = """
        CREATE TABLE video_genre(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          videoid INTEGER NOT NULL,
	        genreid INTEGER NOT NULL,
	        FOREIGN KEY(videoid) REFERENCES video(id),
	        FOREIGN KEY(genreid) REFERENCES genre(id)
        );
        """;
        await db.execute(sql);

      }
    );
    print("foi");
    return db;
  }

  login(TextEditingController email, TextEditingController password, context) async {
    Database db = await _recoverDatabase();

    //String sql = "SELECT * FROM usuarios WHERE idade BETWEEN 20 AND 30";
    //String sql = "SELECT * FROM usuarios WHERE nome LIKE 'Ana%'";
    String sql = "SELECT * FROM user Where email LIKE ?";
    List<dynamic> whereArgs = [email.text];

    List dadosUsuario = await db.rawQuery(sql, whereArgs);
    if(dadosUsuario.isNotEmpty){
      if(dadosUsuario[0]["email"]==email.text && dadosUsuario[0]["password"]==password.text){
        changeToCatalog(context);
        email.text="";
        password.text="";
      }
      else{
        print("senha errada");
      }
    }
    else if(dadosUsuario.isEmpty){
      print("usuário não existe");
    }
    
  }

  void changeToCatalog(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NavBar()),
  );
  }

  cadastro(TextEditingController name, TextEditingController email, TextEditingController password, context) async {
  Database db = await _recoverDatabase();

  String sql = "SELECT * FROM user Where name LIKE ?";
  List<dynamic> whereArgs = [name.text];
  List<dynamic> dadosExistentes = await db.rawQuery(sql, whereArgs);

  if(dadosExistentes.isNotEmpty){
    print("usuário já existe");
  }
  else{
    sql = "INSERT INTO user(name, email, password) VALUES(?, ?, ?)";
    List<dynamic> values = [name.text, email.text, password.text];

    await db.rawInsert(sql, values);
    print("conta criada");
    name.text="";
    email.text="";
    password.text="";
    
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
  }
 
}

adicionarVideo(name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate, genre) async {
    Database db = await _recoverDatabase();
    String sql = "INSERT INTO video(name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(?, ?, ?, ?, ?, ?, ?)";
    List<dynamic> values = [name.text, description.text, type, ageRestriction.text, int.parse(durationMinutes.text), thumbnailImageId.text, releaseDate.text];

    int id = await db.rawInsert(sql,values);

    sql = "INSERT INTO video_genre(videoid, genreid) VALUES(?, ?)";
    values = [id,genre];

    await db.rawInsert(sql,values);

    //APAGAR DEPOISSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
    sql = "SELECT * FROM video";
    List<dynamic> dadosVideo = await db.rawQuery(sql);
    print("adicionados em video: "+dadosVideo.toString());

    sql = "SELECT * FROM video_genre";
    List<dynamic> dadosVideoGenre = await db.rawQuery(sql);
    print("adicionados em videoGenre: "+dadosVideoGenre.toString());
  }


}