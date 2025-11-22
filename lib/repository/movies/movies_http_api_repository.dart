
import 'package:bloccleancode/config/internet_url/internet_url.dart';
import 'package:bloccleancode/data/network/network_api_service.dart';
import 'package:bloccleancode/models/movie/movies.dart';
import 'package:bloccleancode/repository/movies/movies_repository.dart';

class MoviesHttpApiRepository implements MovieRepository{
  
  
  final _apiService=NetworkApiService();
  @override
  Future<MovieModel> fetchMovieList() async{
    final response= await _apiService.getApi(InternetUrl.movieUrl);

    return MovieModel.fromJson(response);
  }
  
  
  
}