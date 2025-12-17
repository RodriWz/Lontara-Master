import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'lontarata.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id_user INTEGER PRIMARY KEY AUTOINCREMENT,
        nama_user TEXT,
        email TEXT,
        password TEXT,
        created_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE aksara (
        id_aksara INTEGER PRIMARY KEY AUTOINCREMENT,
        latin TEXT,
        lontara TEXT,
        gambar TEXT,
        suara TEXT,
        vokal TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE feedback (
        id_fb INTEGER PRIMARY KEY AUTOINCREMENT,
        nama_pengguna TEXT,
        peran TEXT,
        waktu_kirim TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE transliterasi (
        id_transliterasi INTEGER PRIMARY KEY AUTOINCREMENT,
        id_user INTEGER,
        input_text TEXT,
        hasil_lontara TEXT,
        FOREIGN KEY (id_user) REFERENCES users(id_user)
      )
    ''');

    await db.execute('''
      CREATE TABLE kamus (
        id_kamus INTEGER PRIMARY KEY AUTOINCREMENT,
        kata_indo TEXT,
        arti_bugis TEXT,
        lontara_unicode TEXT,
        contoh_kalimat TEXT,
        cara_baca TEXT
      )
    ''');
  }
}
