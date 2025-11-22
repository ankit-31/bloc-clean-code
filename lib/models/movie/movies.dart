

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies.freezed.dart';
part 'movies.g.dart';
//in terminal flutter pub run build_runner build --delete-conflicting-outputs

@freezed
 abstract class MovieModel with _$MovieModel{//this is api https://www.episodate.com/api/most-popular?page=1

 const factory MovieModel({
//now look at response of api to make parameter

 @Default('') int total,
    @Default(0)int page,
    @Default(0)int pages,
  @Default([]) @JsonKey(name: 'tv_shows') List<TvShows> tvShow})=_MovieModel;

 factory MovieModel.fromJson(Map<String,dynamic>json)=>_$MovieModelFromJson(json);


}


@freezed
abstract class TvShows with _$TvShows{//inside tvshows response

  const factory TvShows({
//now look at response of api to make parameter
//json key uses snake_case and Dart uses camelCase so required in that way

  @JsonKey(name: 'name') @Default('') String name,//yoou can also palced json key
   @Default('')@JsonKey(name: 'permalink') String permalink,
    @Default('') @JsonKey(name: 'end_date') String endDate,
   @JsonKey(name: 'network') @Default('')String network,
    @JsonKey(name: 'image_thumbnail_path') @Default('')String imageThumbnalilPath,
   @JsonKey(name: 'status') @Default('')String status,

    @Default([]) @JsonKey(name: 'tv_shows') List<TvShows> tvShow})=_TvShows;

  factory TvShows.fromJson(Map<String,dynamic>json)=>_$TvShowsFromJson(json);



}
