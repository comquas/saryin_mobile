import 'dart:async';
import 'network.dart';
import 'package:saryin/models/user.dart';

class GraphDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://acc.test/graphql";

  Future<User> login(String email, String password) {
    var graphQuery = '''
    mutation {
      login(email:"$email", password:"$password")
    }
    ''';

    return _netUtil.graph(BASE_URL, graphQuery).then((dynamic res) {
      if (res["login"] == null) {
        throw new Exception("Invalid Login");
      } else {
        var token = res["login"];
        var me = '''
        {
          me {
            id
            name
            email
          }
        }
        ''';
        return _netUtil.graph(BASE_URL, me, token: token).then((dynamic res) {
          var usr = res["me"];
          usr["token"] = token;
          return new User.map(usr);
        });
      }
    });
  }
}
