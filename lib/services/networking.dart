import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/weather.dart';



class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    var url = Uri.parse(this.url);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
