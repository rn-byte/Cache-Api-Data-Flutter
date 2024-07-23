import 'package:cache_api_data_flutter/models/news_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  // create or open a new database
  static Future<Database> createDatabase() async {
    return await openDatabase(
      'hacker_news.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE news(id INTEGER PRIMARY KEY,title TEXT,author VARCHAR(255),url TEXT,createdAt TEXT,updatedAt TEXT)');
      },
    );
  }

//insert new NEWS to Database
  static Future insertNews(Hits news) async {
    var db = await createDatabase();

    return await db.insert(
      'news',
      {
        'id': news.id,
        'title': news.title,
        'author': news.author,
        'url': news.url,
        'createdAt': news.createdAt,
        'updatedAt': news.updatedAt,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //read latest 20 news from the local database

  static Future<List<Map<String, dynamic>>> getNews() async {
    var db = await createDatabase();
    return await db.query(
      'news',
      orderBy: 'updatedAt DESC',
      limit: 20,
    );
  }
  //get more data but in limit of 20

  static Future<List<Map<String, dynamic>>> getMoreNews(int lastNo) async {
    var db = await createDatabase();
    return await db.query(
      'news',
      orderBy: 'updatedAt DESC',
      limit: 20,
      offset: lastNo,
    );
  }

  //count the number of news inside the database
  static Future<int?> getNewsCount() async {
    var db = await createDatabase();
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM news'));
  }
}
