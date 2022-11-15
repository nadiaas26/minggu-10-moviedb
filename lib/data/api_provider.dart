import 'dart:convert';
import 'package:http/http.dart';
import 'package:api2/model/popular_movies.dart';

class ApiProvider{
  String apiKey = '51b50ce079326d2449b1580b0118a3b6';
  String baseurl = 'https://api.themoviedb.org/3';

  Client client = Client();
  
  Future<PopularMovies> getPopularMovies() async {

    Response response = 
    await client.get('$baseurl/movie/popular?api_key=$apiKey');
     if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}