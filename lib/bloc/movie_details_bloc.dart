import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:movie/model/movie_details.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.httpClient) : super(MovieDetailsState(movieId: '')) {
    on<MovieDetailsGet>(_movieDetailsGet);
    on<MarkFav>(_markFav);
  }

  final http.Client httpClient;

  FutureOr<void> _movieDetailsGet(
      MovieDetailsGet event, Emitter<MovieDetailsState> emit) async {
    try {
      final movie = await _fetchMovie(state.movieId);
      return emit(MovieDetailsState(
          movie: movie,
          movieId: state.movieId,
          status: MovieDetailStatus.success));
    } catch (_) {
      emit(MovieDetailsState(
          movieId: state.movieId, status: MovieDetailStatus.failure));
    }
  }

  FutureOr<void> _markFav(MarkFav event, Emitter<MovieDetailsState> emit) {
    emit(MovieDetailsState(
        movieId: state.movieId, status: MovieDetailStatus.failure));
  }

  Future<MovieDetailResponse> _fetchMovie(String id) async {
    final response = await httpClient.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/${id}?api_key=200d070fe55142f042035f377a3127b2&language=es"));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return MovieDetailResponse.fromJson(body);
    }
    throw Exception('error fetching movies');
  }
}
