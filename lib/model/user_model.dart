class Data {
  String? id;
  String? username;
  String? email;
  String? avatar;
  String? birthdate;

  Data({this.id, this.username, this.email, this.avatar, this.birthdate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    birthdate = json['birthdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['avatar'] = avatar;
    data['birthdate'] = birthdate;
    return data;
  }
}