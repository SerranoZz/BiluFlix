import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  // _recoverDatabase() async {
  //   final databasePath = await getDatabasesPath();

  //   final path = join(databasePath, "banco.db");
  //   print(path);

  //   Database db = await openDatabase(
  //     path, 
  //     version: 1,
  //     onCreate: (db, version) async {
  //       String sql = """
  //       CREATE TABLE user(
  //         id INTEGER PRIMARY KEY AUTOINCREMENT,
  //         name VARCHAR NOT NULL,
  //         email VARCHAR NOT NULL,
  //         password VARCHAR NOT NULL
  //       );
  //       """;
  //       await db.execute(sql);

  //       sql = """
  //       CREATE TABLE genre(
  //         id INTEGER PRIMARY KEY AUTOINCREMENT,
  //         name VARCHAR NOT NULL
  //       );
  //       """;
  //       await db.execute(sql);
        
  //       sql = """
  //       CREATE TABLE video(
  //         id INTEGER PRIMARY KEY AUTOINCREMENT,
  //         name VARCHAR(2) NOT NULL,
  //         description TEXT NOT NULL,
	//         type INTEGER NOT NULL,
	//         ageRestriction VARCHAR NOT NULL,
	//         durationMinutes INTEGER NOT NULL,
	//         thumbnailImageId VARCHAR NOT NULL,
	//         releaseDate TEXT NOT NULL
  //       );
  //       """;
  //       await db.execute(sql);

  //       sql = """
  //       CREATE TABLE video_genre(
  //         id INTEGER PRIMARY KEY AUTOINCREMENT,
  //         videoid INTEGER NOT NULL,
	//         genreid INTEGER NOT NULL,
	//         FOREIGN KEY(videoid) REFERENCES video(id),
	//         FOREIGN KEY(genreid) REFERENCES genre(id)
  //       );
  //       """;
  //       await db.execute(sql);

  //     }
  //   );
  //   print("foi");
  //   return db;
  // }
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  static Database? _db;
  
  factory DatabaseHelper() => _instance;

  DatabaseHelper.internal();

  Future<Database> get db async {
    return _db ??= await initDb();
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, "data.db");
    
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
            );""";
         await db.execute(sql);

      }
    );

    return db;
  }
}