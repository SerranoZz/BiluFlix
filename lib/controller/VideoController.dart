import '../helper/DatabaseHelper.dart';

class VideoController {
  DatabaseHelper con = DatabaseHelper();

    
    adicionarVideo(name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate, genre) async {
    var db = await con.db; 
    String sql = "INSERT INTO video(name, description, type, ageRestriction, durationMinutes, thumbnailImageId, releaseDate) VALUES(?, ?, ?, ?, ?, ?, ?)";
    List<dynamic> values = [name, description, type, ageRestriction, int.parse(durationMinutes), thumbnailImageId, releaseDate];

    int id = await db.rawInsert(sql, values); 

    sql = "INSERT INTO video_genre(videoid, genreid) VALUES(?, ?)";
    values = [id, genre];

    await db.rawInsert(sql, values); 

    sql = "SELECT * FROM video";
    List<dynamic> dadosVideo = await db.rawQuery(sql); 
    print("adicionados em video: " + dadosVideo.toString());

    sql = "SELECT * FROM video_genre";
    List<dynamic> dadosVideoGenre = await db.rawQuery(sql);
    print("adicionados em videoGenre: " + dadosVideoGenre.toString());
  }
}