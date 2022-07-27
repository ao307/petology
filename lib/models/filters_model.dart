/// breed : ["Aegean","American Bobtail","Australian Mist","Burmilla","Chartreux"]
/// ages : ["0-2 months","3-4 months","5-6 months","7-8 months","9-10 months","10-12 months","1-2 years","3-5 years","6-8 years","9+ years"]
/// size : ["small","medium","large"]
/// goodWith : ["PET FRIENDLY","KID FRIENDLY","DISABLED"]
/// gender : {"male":0,"female":1}
/// colors : ["yellow","orange","Antique bronze","Artichoke green","Black olive"]
/// hairLength : ["short","medium","tall"]
/// behaviour : ["OUTGOING","SHY","BONDED PAIR","BLIND"]

class FiltersModel {
  FiltersModel({
      List<String>? breed, 
      List<String>? ages, 
      List<String>? size, 
      List<String>? goodWith, 
      Gender? gender, 
      List<String>? colors, 
      List<String>? hairLength, 
      List<String>? behaviour,}){
    _breed = breed;
    _ages = ages;
    _size = size;
    _goodWith = goodWith;
    _gender = gender;
    _colors = colors;
    _hairLength = hairLength;
    _behaviour = behaviour;
}

  FiltersModel.fromJson(dynamic json) {
    _breed = json['breed'] != null ? json['breed'].cast<String>() : [];
    _ages = json['ages'] != null ? json['ages'].cast<String>() : [];
    _size = json['size'] != null ? json['size'].cast<String>() : [];
    _goodWith = json['goodWith'] != null ? json['goodWith'].cast<String>() : [];
    _gender = json['gender'] != null ? Gender.fromJson(json['gender']) : null;
    _colors = json['colors'] != null ? json['colors'].cast<String>() : [];
    _hairLength = json['hairLength'] != null ? json['hairLength'].cast<String>() : [];
    _behaviour = json['behaviour'] != null ? json['behaviour'].cast<String>() : [];
  }
  List<String>? _breed;
  List<String>? _ages;
  List<String>? _size;
  List<String>? _goodWith;
  Gender? _gender;
  List<String>? _colors;
  List<String>? _hairLength;
  List<String>? _behaviour;
FiltersModel copyWith({  List<String>? breed,
  List<String>? ages,
  List<String>? size,
  List<String>? goodWith,
  Gender? gender,
  List<String>? colors,
  List<String>? hairLength,
  List<String>? behaviour,
}) => FiltersModel(  breed: breed ?? _breed,
  ages: ages ?? _ages,
  size: size ?? _size,
  goodWith: goodWith ?? _goodWith,
  gender: gender ?? _gender,
  colors: colors ?? _colors,
  hairLength: hairLength ?? _hairLength,
  behaviour: behaviour ?? _behaviour,
);
  List<String>? get breed => _breed;
  List<String>? get ages => _ages;
  List<String>? get size => _size;
  List<String>? get goodWith => _goodWith;
  Gender? get gender => _gender;
  List<String>? get colors => _colors;
  List<String>? get hairLength => _hairLength;
  List<String>? get behaviour => _behaviour;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['breed'] = _breed;
    map['ages'] = _ages;
    map['size'] = _size;
    map['goodWith'] = _goodWith;
    if (_gender != null) {
      map['gender'] = _gender?.toJson();
    }
    map['colors'] = _colors;
    map['hairLength'] = _hairLength;
    map['behaviour'] = _behaviour;
    return map;
  }

}

/// male : 0
/// female : 1

class Gender {
  Gender({
      int? male, 
      int? female,}){
    _male = male;
    _female = female;
}

  Gender.fromJson(dynamic json) {
    _male = json['male'];
    _female = json['female'];
  }
  int? _male;
  int? _female;
Gender copyWith({  int? male,
  int? female,
}) => Gender(  male: male ?? _male,
  female: female ?? _female,
);
  int? get male => _male;
  int? get female => _female;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['male'] = _male;
    map['female'] = _female;
    return map;
  }

}