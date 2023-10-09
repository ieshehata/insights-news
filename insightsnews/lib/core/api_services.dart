import 'dart:convert';
 import 'package:http/http.dart' as http;

import '../feature/home/data/model/news_model.dart';


class ApiServices {
  Future<NewsModel?> getNews({required String category}) async {
    try {
      var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=125aac10045c4091a1fa77bc672ce782');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(json.decode(res.body));
        print(news.totalResults);
        return news;
      }
    } catch (e) {
      print('----------------');
      print(e.toString());
      print('----------------');
    }
    print('----------------');
    return null;
  }
  Future<NewsModel?> searchNews({required String search}) async {
    try {
      var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=us&q=$search&apiKey=125aac10045c4091a1fa77bc672ce782');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(json.decode(res.body));
        print(news.totalResults);
        return news;
      }
    } catch (e) {
      print('----------------');
      print(e.toString());
      print('----------------');

    }
    print('----------------');
    return null;
  }
}
