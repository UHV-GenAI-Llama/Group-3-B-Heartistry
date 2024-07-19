import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseFileRoutines {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/local_persistence.json');
  }

  Future<String> readJournals() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        print("File does not exist: ${file.absolute}");
        await writeJournals('{"journals": []}');
      }

      // Read the file
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      print("Error in readJournals: $e");
      return "";
    }
  }

  // To save the JSON objects to file
  Future<File> writeJournals(String jsonString) async {
    final file = await _localFile;
    return file.writeAsString(jsonString);
  }

  // Handle JSON decode and encode for the entire database
  // To read and parse data from JSON
  Database databaseFromJson(String str) {
    final dataFromJson = json.decode(str);
    return Database.fromJson(dataFromJson);
  }

  // To save and parse data to JSON
  String dataToJson(Database data) {
    final dataToJson = data.toJson();
    return json.encode(dataToJson);
  }
}

//-----------------------------Database class---------------------------------------------------------

class Database {
  List<Journal> journal;

  Database(this.journal);

  factory Database.fromJson(Map<String, dynamic> json) => Database(
    List<Journal>.from(json['journals'].map((x) => Journal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "journals": List<dynamic>.from(journal.map((x) => x.toJson())),
  };
}

//-------------------------------------Journal Class----------------------------------------------------

class Journal {
  String id, date, mood, note;

  Journal(this.id, this.date, this.mood, this.note);

  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
    json["id"],
    json["date"],
    json["mood"],
    json["note"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "mood": mood,
    "note": note,
  };
}

//----------------------------------------JournalEdit class----------------------------------------------

class JournalEdit {
  String action;
  Journal journal;

  JournalEdit(this.action, this.journal);
}
