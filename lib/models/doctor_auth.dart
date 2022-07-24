class DoctorAuth {
  DoctorAuth({
    this.accessToken,
    this.refreshToken,
    this.id,
  });

  DoctorAuth.fromJson(dynamic json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    id = json['id'];
  }

  String? accessToken;
  String? refreshToken;
  String? id;

  DoctorAuth copyWith({
    String? accessToken,
    String? refreshToken,
    String? id,
  }) =>
      DoctorAuth(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        id: id ?? this.id,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    map['id'] = id;
    return map;
  }
}
