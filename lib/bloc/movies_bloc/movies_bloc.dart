



import 'package:bloc/bloc.dart';
import 'package:bloccleancode/data/response/api_response.dart';
import 'package:bloccleancode/models/movie/movies.dart';
import 'package:bloccleancode/repository/movies/movies_http_api_repository.dart';
import 'package:bloccleancode/repository/movies/movies_repository.dart';
import 'package:equatable/equatable.dart';

part 'movies_event.dart';
part 'movies_state.dart';



class MovieBloc extends Bloc<MoviesEvent,MovieState>{
  MovieRepository movieRepository=MoviesHttpApiRepository();
  MovieBloc():super(MovieState(movielist: ApiResponse.loading())){//initally loading provide
    on<MoviesFetched>(fetchmovielist);
  }
  Future<void>fetchmovielist(MoviesFetched event,Emitter<MovieState>emit)async{

  //hit api
    await movieRepository.fetchMovieList().then((value){
      emit(state.copyWith(movieList: ApiResponse.completed(value)));

    }).onError((error,stackTrace){
      emit(state.copyWith(movieList: ApiResponse.error(error.toString())));

    });
  }

}