
import 'package:bloccleancode/models/movie/movies.dart';

abstract class MovieRepository{


  Future<MovieModel> fetchMovieList();
}