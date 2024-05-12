import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDB {
  static Database? _db;
  Future<Database?> get db async {
    _db ??= await initDB(); // ?? means if it s null
    return _db;
  }

  // initDB
  initDB() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cartdb.db');
    Database db = await openDatabase(path,
        version: 1, onCreate: onCreate, onUpgrade: onUpgrade);
    return db;
  }

  onUpgrade(Database db, int oldVersion, int newVersion) {}

  onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE cart (
      id INTEGER,
      items_name TEXT,
      items_name_ar TEXT,
      items_image TEXT,
      items_datetime TEXT,
      items_description TEXT,
      items_description_ar TEXT,
      items_count INTEGER,
      items_active INTEGER,
      items_price TEXT,
      items_discount TEXT,
      items_date TEXT,
      items_quantity INTEGER,
      items_categorie INTEGER,
      cat_name TEXT,
      cat_name_ar TEXT,
      cat_image TEXT,
      cat_datetime TEXT,
      order_quantity INTEGER
    )
    ''');
  }

  // With SQL LANGUAGE

  /*
  readData(String sql) async {
    Database? myDb = await db;
    List<Map<String, Object?>> response = await myDb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? myDb = await db;
    var response = await myDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql);
    return response;
  }

  */

  // Delete the database
  deleteAllDB() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'cart.db');
    await deleteDatabase(path);
  }

  // WITHOUT SQL LANGUAGE
  read(String table) async {
    Database? myDb = await db;
    List<Map<String, Object?>> response = await myDb!.query(table);
    return response;
  }

  insert(String table, Map<String, Object?> values) async {
    Database? myDb = await db;
    int response = await myDb!.insert(table, values);
    return response;
  }

  update(String table, Map<String, Object?> values, String? where) async {
    Database? myDb = await db;
    var response = await myDb!.update(table, values, where: where);
    return response;
  }

  delete(String table, String? where) async {
    Database? myDb = await db;
    int response = await myDb!.delete(table, where: where);
    return response;
  }
}
