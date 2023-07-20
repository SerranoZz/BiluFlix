import '../helper/DatabaseHelper.dart';

class VideoController {
  DatabaseHelper con = DatabaseHelper();
  
    adicionarVideo(name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate, genre) async {
    var db = await con.db;
    String sql = "INSERT INTO video(name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(?, ?, ?, ?, ?, ?, ?)";
    List<dynamic> values = [name.text, description.text, int.parse(type.text), ageRestriction.text, int.parse(durationMinutes.text), thumbnailImageId.text, releaseDate.text];

    int id = await db.rawInsert(sql,values);

    sql = "INSERT INTO video_genre(videoid, genreid) VALUES(?, ?)";
    values = [id,int.parse(genre.text)];

    await db.rawInsert(sql,values);

    //APAGAR DEPOISSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
    sql = "SELECT * FROM video";
    List<dynamic> dadosVideo = await db.rawQuery(sql);
    print("adicionados em video: "+dadosVideo.toString());

    sql = "SELECT * FROM video_genre";
    List<dynamic> dadosVideoGenre = await db.rawQuery(sql);
    print("adicionados em videoGenre: "+dadosVideoGenre.toString());
  }

  catalogoFilmes() async{
    List<List<dynamic>> listaCompleta=[];
    
    var db = await con.db;

    String sql = "SELECT * FROM genre;";
    List<dynamic> quantidadeGeneros = await db.rawQuery(sql);
    
    sql="SELECT * FROM video";
    List<dynamic> dadosVideo = await db.rawQuery(sql);

    for( var item in quantidadeGeneros){
      List<dynamic> listaAux=[];
      
      sql='''select video.id, video.name, genre.name from video left join video_genre on video.id = video_genre.videoid left join genre on genre.id = video_genre.genreid where genre.name = '${item["name"]}';''';

      List<dynamic> dadosVideoGenre = await db.rawQuery(sql);
      listaAux.add(item["name"]);
      if(dadosVideoGenre.isNotEmpty){
        for(var item2 in dadosVideoGenre){
          if(dadosVideo[item2["id"]-1]["type"]==0){
            listaAux.add(dadosVideo[item2["id"]-1]);
          }
        }
      }
      listaCompleta.add(listaAux);
    }
    return listaCompleta;
  }

  catalogoSeries() async{
    List<List<dynamic>> listaCompleta=[];
    
    var db = await con.db;

    String sql = "SELECT * FROM genre;";
    List<dynamic> quantidadeGeneros = await db.rawQuery(sql);
    
    sql="SELECT * FROM video";
    List<dynamic> dadosVideo = await db.rawQuery(sql);

    for( var item in quantidadeGeneros){
      List<dynamic> listaAux=[];
      
      sql='''select video.id, video.name, genre.name from video left join video_genre on video.id = video_genre.videoid left join genre on genre.id = video_genre.genreid where genre.name = '${item["name"]}';''';

      List<dynamic> dadosVideoGenre = await db.rawQuery(sql);
      listaAux.add(item["name"]);
      if(dadosVideoGenre.isNotEmpty){
        for(var item2 in dadosVideoGenre){
          if(dadosVideo[item2["id"]-1]["type"]==1){
            listaAux.add(dadosVideo[item2["id"]-1]);
          }
        }
      }
      listaCompleta.add(listaAux);
    }
    return listaCompleta;
  }
}