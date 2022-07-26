/// title : "Not only people need a house"
/// body : "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est. "

class FirstSectionModel {
  FirstSectionModel({
      String? title, 
      String? body,}){
    _title = title;
    _body = body;
}

  FirstSectionModel.fromJson(dynamic json) {
    _title = json['title'];
    _body = json['body'];
  }
  String? _title;
  String? _body;
FirstSectionModel copyWith({  String? title,
  String? body,
}) => FirstSectionModel(  title: title ?? _title,
  body: body ?? _body,
);
  String? get title => _title;
  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['body'] = _body;
    return map;
  }

}