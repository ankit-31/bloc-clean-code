

part of 'movies_bloc.dart';

class MovieState extends Equatable{

 final  ApiResponse <MovieModel> movielist;

  MovieState({required this.movielist});

  MovieState copyWith({ ApiResponse<MovieModel>?movieList}){

    return MovieState(movielist: movieList??this.movielist);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [movielist];



}