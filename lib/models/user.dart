class User {
  String _token;
  String _id;
  String _name;
  String _email;

  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get token => _token;

  User.map(dynamic obj) {
    this._name = obj["name"];
    this._email = obj["email"];
    this._id = obj["id"];
    this._token = obj["token"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["email"] = _email;
    map["id"] = _id;
    map["token"] = _token;
    return map;
  }

}
