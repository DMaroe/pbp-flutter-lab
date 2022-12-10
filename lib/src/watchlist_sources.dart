import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:labs/models/watchList_models.dart';

class Source {
  Future<List<Fields>> fecthWatchList() async {
    try {
      Uri url = Uri.parse(
          'http://127.0.0.1:8000/mywatchlist/json/');
      var response = await http.get(url);
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      List<Fields> watchList = [];
      for (var item in data) {
        watchList.add(Fields.fromJson(item['fields']));
      }
      return watchList;
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}