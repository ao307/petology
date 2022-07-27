/// imageUrl : "https://petology.orangedigitalcenteregypt.com/assets/Bowls and Cups.png"
/// title : "Bowls and Cups"

class HowToCareFriends {
  HowToCareFriends({
      String? imageUrl, 
      String? title,}){
    _imageUrl = imageUrl;
    _title = title;
}

  HowToCareFriends.fromJson(dynamic json) {
    _imageUrl = json['imageUrl'];
    _title = json['title'];
  }
  String? _imageUrl;
  String? _title;
HowToCareFriends copyWith({  String? imageUrl,
  String? title,
}) => HowToCareFriends(  imageUrl: imageUrl ?? _imageUrl,
  title: title ?? _title,
);
  String? get imageUrl => _imageUrl;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imageUrl'] = _imageUrl;
    map['title'] = _title;
    return map;
  }

}
