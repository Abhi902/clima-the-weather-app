import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  getdata() async {
    var urlreal = Uri.parse(this.url);
    http.Response responce = await http.get(urlreal);

    if (responce.statusCode == 200) {
      String data = responce.body;
      var decodedata = jsonDecode(data);
      return decodedata;
    } else {
      print(responce.statusCode);
    }
  }
}
