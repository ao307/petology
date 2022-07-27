/// email : "Email@petology.com"
/// location : "First settlement/Cairo"
/// phone : "(+2)0123456789"
/// location2 : "Cairo/Egypt"

class FooterModel {
  FooterModel({
      String? email, 
      String? location, 
      String? phone, 
      String? location2,}){
    _email = email;
    _location = location;
    _phone = phone;
    _location2 = location2;
}

  FooterModel.fromJson(dynamic json) {
    _email = json['email'];
    _location = json['location'];
    _phone = json['phone'];
    _location2 = json['location2'];
  }
  String? _email;
  String? _location;
  String? _phone;
  String? _location2;
FooterModel copyWith({  String? email,
  String? location,
  String? phone,
  String? location2,
}) => FooterModel(  email: email ?? _email,
  location: location ?? _location,
  phone: phone ?? _phone,
  location2: location2 ?? _location2,
);
  String? get email => _email;
  String? get location => _location;
  String? get phone => _phone;
  String? get location2 => _location2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['location'] = _location;
    map['phone'] = _phone;
    map['location2'] = _location2;
    return map;
  }

}
