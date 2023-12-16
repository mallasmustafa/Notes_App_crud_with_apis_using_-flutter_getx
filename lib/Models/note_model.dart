
class NoteModel {
  String? title;
  String? description;
  String? date;
  String? time;
  String? id;

  NoteModel({this.title, this.description, this.date, this.time, this.id});

  NoteModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["description"];
    date = json["date"];
    time = json["time"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["description"] = description;
    _data["date"] = date;
    _data["time"] = time;
    _data["id"] = id;
    return _data;
  }
}