

class Note {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Note(this._title, this._date, this._priority, [this._description]);
  Note.withId(this._title, this._date, this._priority, [this._description]);

// all the getters

  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  // all the setters

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      this._title = newDescription;
    }
  }

  set date(String newDate) {
    this._title = newDate;
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

//used to save and retrive from database

Map<String, dynamic> toMap(){

 var map = Map<String, dynamic>();
 if(id != null){
   map['id'] = _id;
 }
 map['title'] = _title;
 map['description'] = _description;
 map['priority'] = _priority;
 map['map'] = _date;
 return map;
}
 Note.fromMapObject(Map<String , dynamic> map) {
this._id = map['id'];
this._title=map['title'];
this.description = map['description'];
this._priority = map['priority'];
this._date = map['date'];
 
 }


}
